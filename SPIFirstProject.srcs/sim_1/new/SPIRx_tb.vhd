----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/01/2023 06:26:12 PM
-- Design Name: 
-- Module Name: SPIRx_tb - Behavioral
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

entity SPIRx_tb is
--  Port ( );
end SPIRx_tb;

architecture Behavioral of SPIRx_tb is

component SPI_Rx is 
    port (  clk : in std_logic; 
            clkSPI : in std_logic; 
            CPOL : in std_logic; 
            CPHA : in std_logic; 
            TxValid : in std_logic; 
            RxMisoBit : in std_logic; 
            rst : in std_logic; 
            RxValid : out std_logic; 
            RxMisoData : out std_logic_vector
    );
end component; 

signal clk, clkSPI, CPOL, CPHA, TxValid, RxMisoBit, rst, RxValid : std_logic; 
signal RxMisoData : std_logic_vector (7 downto 0); 
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

    uut : SPI_Rx
    port map (
        clk => clk, 
        clkSPI => clkSPI, 
        CPOL => CPOL, 
        CPHA => CPHA, 
        TxValid => TxValid, 
        RxMisoBit => RxMisoBit, 
        rst => rst, 
        RxValid => RxValid, 
        RxMisoData => RxMisoData
    ); 

    stim : process 
    begin
        
        CPOL <= '1'; 
        CPHA <= '1'; 
        TxValid <= '0'; 
        RxMisoBit <= '1';
        rst <= '0'; 

        wait for 60ns; 

        TxValid <= '1'; 
        
        wait for 20ns;

        TxValid <= '0';
        RxMisoBit <= '0'; 

        wait for 80ns;
        
        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns;

        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '1'; 
        rst <= '1'; 

        wait for 20ns; 

        rst <= '0'; 

        wait for 60ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '1'; 
        TxValid <= '1'; 

        wait for 20ns; 

        TxValid <= '0'; 

        wait for 60ns; 

        RxMisoBit <= '0'; 

        wait for 80ns;
        
        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns;

        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait; 


    end process ; -- stim


end Behavioral;
