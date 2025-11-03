-- spi_slave_model.vhd (спрощений, лише для testbench)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- додано для to_unsigned()

entity spi_slave_model is
  generic (
    G_FRAME_BITS : positive := 8;
    G_CPOL       : integer := 0;
    G_CPHA       : integer := 0
  );
  port (
    sck   : in  std_logic;
    cs_n  : in  std_logic;
    mosi  : in  std_logic;
    miso  : out std_logic
  );
end entity;

architecture behav of spi_slave_model is
  -- ініціалізація без bit-string literal:
  signal sh_tx : std_logic_vector(G_FRAME_BITS-1 downto 0)
    := std_logic_vector(to_unsigned(16#3C#, G_FRAME_BITS));
  signal sh_rx : std_logic_vector(G_FRAME_BITS-1 downto 0) := (others => '0');

  signal last_sck : std_logic := '0';

  function to_sl(b : boolean) return std_logic is
  begin
    if b then return '1'; else return '0'; end if;
  end;

  signal cpol_s, cpha_s : std_logic;
begin
  cpol_s <= to_sl(G_CPOL /= 0);
  cpha_s <= to_sl(G_CPHA /= 0);

  process(sck, cs_n)
  begin
    if cs_n = '1' then
      miso     <= 'Z';
      last_sck <= sck;
    else
      -- детекція фронтів
      if last_sck /= sck then
        -- leading/trailing з урахуванням CPOL
        if ((cpol_s='0' and sck='1') or (cpol_s='1' and sck='0')) then
          -- leading
          if cpha_s='1' then
            -- вивід біта (зсув MSB->LSB)
            miso  <= sh_tx(G_FRAME_BITS-1);
            sh_tx <= sh_tx(G_FRAME_BITS-2 downto 0) & '0';
          else
            -- семпл MOSI
            sh_rx <= sh_rx(G_FRAME_BITS-2 downto 0) & mosi;
          end if;
        else
          -- trailing
          if cpha_s='1' then
            -- семпл MOSI
            sh_rx <= sh_rx(G_FRAME_BITS-2 downto 0) & mosi;
          else
            -- вивід біта (зсув MSB->LSB)
            miso  <= sh_tx(G_FRAME_BITS-1);
            sh_tx <= sh_tx(G_FRAME_BITS-2 downto 0) & '0';
          end if;
        end if;
        last_sck <= sck;
      end if;
    end if;
  end process;

end architecture;
