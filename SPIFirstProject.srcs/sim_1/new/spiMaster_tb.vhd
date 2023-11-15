----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2023 08:51:00 AM
-- Design Name: 
-- Module Name: spiMaster_tb - Behavioral
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

entity spiMaster_tb is
--  Port ( );
end spiMaster_tb;

architecture Behavioral of spiMaster_tb is

component spiMaster_s is 
    generic (   spiMode : std_logic_vector (1 downto 0) := "00";
               N : integer := 8
    );
    port (  clk : in std_logic; 
            TxValidIN : in std_logic; 
            RxMisoBit : in std_logic; 
            TxMosiIN : in std_logic_vector (N-1 downto 0); 
            rst : in std_logic; 
            RxValid : out std_logic; 
            TxReady : out std_logic; 
            TxMosiBit : out std_logic; 
            RxMisoData : out std_logic_vector 
    );
end component; 

signal clk, TxValidIN, RxMisoBit, rst, RxValid, TxReady, TxMosiBit : std_logic; 
signal TxMosiIN, RxMisoData : std_logic_vector (7 downto 0); 
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

    uut : spiMaster_s 
    generic map (
        spiMode => "11",
        N => 8 
    )
    port map (
        clk => clk, 
        TxValidIN => TxValidIN, 
        RxMisoBit => RxMisoBit, 
        TxMosiIN => TxMosiIN, 
        rst => rst,
        RxValid => RxValid, 
        TxReady => TxReady, 
        TxMosiBit => TxMosiBit, 
        RxMisoData => RxMisoData
    ); 

    stim : process  
    begin
        
        TxValidIN <= '0'; 
        RxMisoBit <= '1'; 
        rst <= '0'; 
        TxMosiIN <= "10101001"; 

        wait for 100ns;

        TxValidIN <= '1'; 

        wait for 100ns; 

        RxMisoBit <= '0'; 
        
        wait for 80ns; 

        RxMisoBit <= '1'; 
        TxValidIN <= '0'; 
        TxMosiIN <= "10011001";

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '1'; 

        wait for 160ns; 

        RxMisoBit <= '0'; 
        
        wait for 160ns;

        TxValidIN <= '1'; 

        wait for 100ns; 

        RxMisoBit <= '1'; 
        
        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '1';

        wait for 80ns; 

        RxMisoBit <= '0'; 

        wait for 80ns; 

        RxMisoBit <= '1'; 

        wait for 80ns; 

        RxMisoBit <= '1';

        wait; 




    end process ; -- stim


end Behavioral;
