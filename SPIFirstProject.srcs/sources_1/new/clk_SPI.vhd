----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/23/2023 05:32:58 PM
-- Design Name: 
-- Module Name: clk_SPI - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_SPI is
    generic (N : integer := 8); 
    port (  clk : in std_logic;
            CPOL : in std_logic; 
            TxValid : in std_logic; 
            rst : in std_logic; 
            clkSPI : out std_logic
    );
end clk_SPI;

architecture Behavioral of clk_SPI is

constant MaxPulse : integer := (N*2)+6;

signal count : std_logic := '0'; 
signal clkSPI_t : std_logic := '0'; 
signal initFlag : std_logic := '0';
signal pulseCount : integer range 0 to MaxPulse := 22; 

begin

    proc1 : process( clk )
    begin
        if(rst = '1') then
            clkSPI_t <= CPOL; 
            pulseCount <= 18; 
        elsif (rising_edge(clk)) then 
            if (initFlag = '0') then
                clkSPI_t <= CPOL; 
                initFlag <= '1'; 
            end if ;
            if (TxValid = '1') then
                pulseCount <= 0; 
            elsif (pulseCount < 22) then
                if (count = '1') then
                    clkSPI_t <= not clkSPI_t; 
                    pulseCount <= pulseCount + 1;
                    count <= '0'; 
                else
                    count <= '1'; 
                end if ;
                 
            
            end if ;
        end if ;
    end process ; -- proc1

    clkSPI <= clkSPI_t; 


end Behavioral;
