-- tb_spi.vhd (VHDL-93 friendly)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity tb_spi is
end entity;

architecture sim of tb_spi is
  constant CLK_HZ     : natural := 100_000_000;
  constant SPI_HZ     : natural := 5_000_000;
  constant CPOL       : integer := 0;
  constant CPHA       : integer := 0;
  constant FRAME_BITS : natural := 8;

  signal clk   : std_logic := '0';
  signal rst_n : std_logic := '0';

  signal start   : std_logic := '0';
  -- ІНІЦІАЛІЗАЦІЯ БЕЗ x".." (VHDL-93): через to_unsigned(...)
  signal tx_data : std_logic_vector(FRAME_BITS-1 downto 0)
    := std_logic_vector(to_unsigned(16#A5#, FRAME_BITS));
  signal rx_data : std_logic_vector(FRAME_BITS-1 downto 0);

  signal busy, done : std_logic;

  signal sck, mosi, miso, cs_n : std_logic;

begin
  -- 100 МГц (період 10 нс)
  clk <= not clk after 5 ns;

  -- RESET
  process
  begin
    rst_n <= '0';
    wait for 100 ns;
    rst_n <= '1';
    wait until false;
  end process;

  -- DUT: Master
  u_master: entity work.spi_master
    generic map (
      G_CLK_HZ     => CLK_HZ,
      G_SPI_HZ     => SPI_HZ,
      G_FRAME_BITS => FRAME_BITS,
      G_CPOL       => CPOL,
      G_CPHA       => CPHA,
      G_LSB_FIRST  => false
    )
    port map (
      clk     => clk,
      rst_n   => rst_n,
      start   => start,
      tx_data => tx_data,
      rx_data => rx_data,
      busy    => busy,
      done    => done,
      sck     => sck,
      mosi    => mosi,
      miso    => miso,
      cs_n    => cs_n
    );

  -- Модель Slave для симуляції
  u_slave: entity work.spi_slave_model
    generic map (
      G_FRAME_BITS => FRAME_BITS,
      G_CPOL       => CPOL,
      G_CPHA       => CPHA
    )
    port map (
      sck  => sck,
      cs_n => cs_n,
      mosi => mosi,
      miso => miso
    );

  -- Сценарій
  process
    variable L : line;  -- для виводу HEX через hwrite
  begin
    wait until rst_n = '1';
    wait for 200 ns;

    -- Трансфер #1
    tx_data <= std_logic_vector(to_unsigned(16#A5#, FRAME_BITS));
    start   <= '1';
    wait for 10 ns;
    start   <= '0';

    wait until done = '1';
    L := null;
    hwrite(L, rx_data);                           -- HEX у L
    report "Transfer #1 done. RX=0x" & L.all;
    deallocate(L);

    -- Трансфер #2 (інше слово)
    wait for 200 ns;
    tx_data <= std_logic_vector(to_unsigned(16#3C#, FRAME_BITS));
    start   <= '1';
    wait for 10 ns;
    start   <= '0';

    wait until done = '1';
    L := null;
    hwrite(L, rx_data);
    report "Transfer #2 done. RX=0x" & L.all;
    deallocate(L);

    wait for 200 ns;
    assert false report "TB finished" severity failure;
  end process;

end architecture;
