----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2023 08:51:46 AM
-- Design Name: 
-- Module Name: SPITx_tb - Behavioral
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

entity SPITx_tb is
--  Port ( );
end SPITx_tb;

architecture Behavioral of SPITx_tb is

component SPI_Tx is 
    port (  clk : in std_logic; 
            clkSPI : in std_logic; 
            TxValid : in std_logic; 
            CPOL : in std_logic; 
            CPHA : in std_logic; 
            rst : in std_logic;
            TxMosiData : in std_logic_vector (7 downto 0); 
            TxReady : out std_logic; 
            TxMosiBit : out std_logic 
    );
end component; 

signal clk, clkSPI, TxValid, CPOL, CPHA, rst, TxReady, TxMosiBit : std_logic; 
signal TxMosiData : std_logic_vector (7 downto 0); 
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

    clkproc2 : process
    begin
        clkSPI <= '1';
        wait for clk_period*2; 
        clkSPI <= '0'; 
        wait for clk_period*2; 
    end process ; -- clkproc2

    uut : SPI_Tx 
    port map (
        clk => clk, 
        clkSPI => clkSPI, 
        TxValid => TxValid, 
        CPOL => CPOL, 
        CPHA => CPHA, 
        rst => rst, 
        TxMosiData => TxMosiData, 
        TxReady => TxReady, 
        TxMosiBit => TxMosiBit
    );

    stim : process 
    begin
        TxValid <= '0'; 
        CPOL <= '1'; 
        CPHA <= '0'; 
        rst <= '0'; 
        TxMosiData <= "11100001"; 

        wait for 40ns; 

        TxValid <= '1'; 

        wait for 20ns; 

        TxValid <= '0'; 

        wait; 

    end process ; -- stim



end Behavioral;
