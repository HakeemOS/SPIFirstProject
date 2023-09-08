----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/23/2023 08:20:54 PM
-- Design Name: 
-- Module Name: clkSPI_tb - Behavioral
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

entity clkSPI_tb is
--  Port ( );
end clkSPI_tb;

architecture Behavioral of clkSPI_tb is

component clk_SPI is 
    port (  clk : in std_logic;
            CPOL : in std_logic; 
            TxValid : in std_logic; 
            rst : in std_logic; 
            clkSPI : out std_logic
    );
end component; 

signal clk, CPOL, TxValid, rst, clkSPI : std_logic; 
-- clk signals -- 
signal clk_period : time := 20ns; 
signal clk_stop : boolean; 

begin

    clkproc : process 
    begin
        clk <= '1';  
        wait for clk_period/2; 
        clk <= '0'; 
        wait for clk_period/2; 
    end process ; -- clkproc

    uut : clk_SPI 
    port map (
        clk => clk, 
        CPOL => CPOL, 
        TxValid => TxValid, 
        rst => rst, 
        clkSPI => clkSPI
    );

    stim : process 
    begin
        
        CPOL <= '1'; 
        TxValid <= '0'; 
        rst <= '0'; 

        wait for 20ns; 

        --rst <= '1'; 

        wait for 20ns; 

        rst <= '0'; 
        TxValid <= '1'; 

        wait for 20ns; 

        TxValid <= '0'; 
        
        wait; 

    end process ; -- stim

end Behavioral;
