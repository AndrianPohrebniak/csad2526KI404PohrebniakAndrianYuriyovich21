-- spiapks.vhd  (містить entity spi_master)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all; 

entity spi_master is
  generic (
    G_CLK_HZ     : natural := 100_000_000; -- частота системного такту
    G_SPI_HZ     : natural := 10_000_000;  -- бажана частота SCK
    G_FRAME_BITS : positive := 8;          -- довжина слова (>=2)
    G_CPOL       : integer := 0;           -- 0 або 1
    G_CPHA       : integer := 0;           -- 0 або 1
    G_LSB_FIRST  : boolean := false        -- MSB першим за замовчуванням
  );
  port (
    clk     : in  std_logic;
    rst_n   : in  std_logic;

    -- керування/дані
    start   : in  std_logic;
    tx_data : in  std_logic_vector(G_FRAME_BITS-1 downto 0);
    rx_data : out std_logic_vector(G_FRAME_BITS-1 downto 0);
    busy    : out std_logic;
    done    : out std_logic;

    -- SPI лінії
    sck     : out std_logic;
    mosi    : out std_logic;
    miso    : in  std_logic;
    cs_n    : out std_logic
  );
end entity;

architecture rtl of spi_master is
  constant C_DIV : natural := integer(G_CLK_HZ / (2 * G_SPI_HZ));
  -- 2 тики дільника = 1 період SCK (тому множник 2)

  -- уникаємо колізії з портом "done": ST_* замість DONE
  type t_state is (ST_IDLE, ST_LOAD, ST_ASSERT_CS, ST_TRANSFER, ST_DEASSERT_CS, ST_DONE);
  signal st, st_n : t_state;

  signal div_cnt  : natural range 0 to C_DIV-1 := 0;
  signal sck_i    : std_logic := '0';  -- сирий SCK до поляризації
  signal sck_out  : std_logic := '0';  -- з урахуванням CPOL
  signal sck_en   : std_logic := '0';  -- “тік” дільника (точка toggle)

  signal cs_n_i   : std_logic := '1';

  signal sh_tx    : std_logic_vector(G_FRAME_BITS-1 downto 0) := (others => '0');
  signal sh_rx    : std_logic_vector(G_FRAME_BITS-1 downto 0) := (others => '0');
  signal bit_cnt  : integer range 0 to G_FRAME_BITS := 0;

  signal busy_i   : std_logic := '0';
  signal done_i   : std_logic := '0';
  signal mosi_i   : std_logic := '0';

  -- допоміжні: визначення leading/trailing відносно CPOL
  function is_leading_edge(sck_now, cpol : std_logic) return boolean is
  begin
    -- leading = перехід від idle-рівня (CPOL) до !CPOL
    return (cpol = '0' and sck_now = '1') or (cpol = '1' and sck_now = '0');
  end function;

  function is_trailing_edge(sck_now, cpol : std_logic) return boolean is
  begin
    -- trailing = перехід назад до idle-рівня (CPOL)
    return (cpol = '0' and sck_now = '0') or (cpol = '1' and sck_now = '1');
  end function;

  signal cpol_s, cpha_s : std_logic;
begin
  -- Перевірки параметрів (concurrent assert'и — після begin)
  assert G_FRAME_BITS >= 2
    report "G_FRAME_BITS must be >= 2 for this implementation"
    severity failure;

  assert (G_CLK_HZ >= 2*G_SPI_HZ) and (C_DIV >= 1)
    report "C_DIV < 1: G_CLK_HZ must be >= 2*G_SPI_HZ"
    severity failure;

  cpol_s <= '1' when G_CPOL /= 0 else '0';
  cpha_s <= '1' when G_CPHA /= 0 else '0';

  -- виходи
  sck     <= sck_out;
  cs_n    <= cs_n_i;
  mosi    <= mosi_i;
  rx_data <= sh_rx;
  busy    <= busy_i;
  done    <= done_i;

  -- Генерація SCK: дільник + поляризація
  gen_sck: process(clk, rst_n)
  begin
    if rst_n = '0' then
      div_cnt <= 0;
      sck_i   <= '0';
      sck_en  <= '0';
    elsif rising_edge(clk) then
      if st = ST_TRANSFER then
        if div_cnt = C_DIV-1 then
          div_cnt <= 0;
          sck_i   <= not sck_i; -- toggle
          sck_en  <= '1';
        else
          div_cnt <= div_cnt + 1;
          sck_en  <= '0';
        end if;
      else
        -- поза TRANSFER тримаємо SCK у idle стані
        div_cnt <= 0;
        sck_i   <= '0';
        sck_en  <= '0';
      end if;
    end if;
  end process;

  -- Поляризований SCK (idle рівень = CPOL)
  sck_out <= (sck_i xor cpol_s);

  -- FSM: регістр стану
  fsm_reg: process(clk, rst_n)
  begin
    if rst_n = '0' then
      st <= ST_IDLE;
    elsif rising_edge(clk) then
      st <= st_n;
    end if;
  end process;

  -- FSM: комбінаційна логіка переходів
  fsm_next: process(st, start, bit_cnt, done_i)
  begin
    st_n <= st;
    case st is
      when ST_IDLE        => if start = '1' then st_n <= ST_LOAD; end if;
      when ST_LOAD        => st_n <= ST_ASSERT_CS;
      when ST_ASSERT_CS   => st_n <= ST_TRANSFER;
      when ST_TRANSFER    => if (bit_cnt = 0) and (done_i = '1') then st_n <= ST_DEASSERT_CS; end if;
      when ST_DEASSERT_CS => st_n <= ST_DONE;
      when ST_DONE        => st_n <= ST_IDLE;
      when others         => st_n <= ST_IDLE;
    end case;
  end process;

  -- Основна логіка передачі/прийому
  datapath: process(clk, rst_n)
    variable leading, trailing : boolean;
  begin
    if rst_n = '0' then
      cs_n_i  <= '1';
      busy_i  <= '0';
      done_i  <= '0';
      mosi_i  <= '0';
      sh_tx   <= (others => '0');
      sh_rx   <= (others => '0');
      bit_cnt <= 0;
    elsif rising_edge(clk) then
      done_i <= '0'; -- однотактний імпульс

      case st is
        when ST_IDLE =>
          cs_n_i <= '1';
          busy_i <= '0';
          mosi_i <= '0';
          bit_cnt<= 0;

        when ST_LOAD =>
          busy_i <= '1';
          -- підготовка shift-регістрів
          sh_tx  <= tx_data;

        when ST_ASSERT_CS =>
          cs_n_i <= '0';
          -- Якщо CPHA=0, виставляємо початковий MOSI до першого активного фронту
          if cpha_s = '0' then
            if G_LSB_FIRST then
              mosi_i <= sh_tx(0);
            else
              mosi_i <= sh_tx(G_FRAME_BITS-1);
            end if;
          end if;
          -- ініціалізація лічильника бітів
          bit_cnt <= G_FRAME_BITS;

        when ST_TRANSFER =>
          -- Обробляємо тільки у моменти toggle SCK (sck_en='1')
          if sck_en = '1' then
            leading  := is_leading_edge(sck_out, cpol_s);
            trailing := is_trailing_edge(sck_out, cpol_s);

            if cpha_s = '0' then
              -- CPHA=0: семпл на leading, зсув на trailing
              if leading then
                if G_LSB_FIRST then
                  sh_rx <= miso & sh_rx(G_FRAME_BITS-1 downto 1);
                else
                  sh_rx <= sh_rx(G_FRAME_BITS-2 downto 0) & miso;
                end if;
              end if;

              if trailing then
                if bit_cnt > 0 then
                  if G_LSB_FIRST then
                    mosi_i <= sh_tx(1);
                    sh_tx  <= '0' & sh_tx(G_FRAME_BITS-1 downto 1);
                  else
                    mosi_i <= sh_tx(G_FRAME_BITS-2);
                    sh_tx  <= sh_tx(G_FRAME_BITS-2 downto 0) & '0';
                  end if;

                  bit_cnt <= bit_cnt - 1;
                  if bit_cnt = 1 then
                    done_i <= '1'; -- останній біт щойно відіслали
                  end if;
                end if;
              end if;

            else
              -- CPHA=1: зсув на leading, семпл на trailing
              if leading then
                if bit_cnt > 0 then
                  if G_LSB_FIRST then
                    mosi_i <= sh_tx(0);
                    sh_tx  <= '0' & sh_tx(G_FRAME_BITS-1 downto 1);
                  else
                    mosi_i <= sh_tx(G_FRAME_BITS-1);
                    sh_tx  <= sh_tx(G_FRAME_BITS-2 downto 0) & '0';
                  end if;

                  bit_cnt <= bit_cnt - 1;
                  if bit_cnt = 1 then
                    done_i <= '1';
                  end if;
                end if;
              end if;

              if trailing then
                if G_LSB_FIRST then
                  sh_rx <= miso & sh_rx(G_FRAME_BITS-1 downto 1);
                else
                  sh_rx <= sh_rx(G_FRAME_BITS-2 downto 0) & miso;
                end if;
              end if;
            end if;
          end if;

        when ST_DEASSERT_CS =>
          cs_n_i <= '1';

        when ST_DONE =>
          busy_i <= '0';
          done_i <= '1';

        when others =>
          null;
      end case;
    end if;
  end process;

end architecture;
