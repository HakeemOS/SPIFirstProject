----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/23/2023 05:27:27 PM
-- Design Name: 
-- Module Name: spiMaster_s - Behavioral
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
library myLib; 
use myLib.paraPcr_p.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spiMaster_s is
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
end spiMaster_s;

architecture Behavioral of spiMaster_s is

-- Components -- 
component clk_SPI is 
    generic (N : integer := 8); 
    port (  clk : in std_logic;
            CPOL : in std_logic; 
            TxValid : in std_logic; 
            rst : in std_logic; 
            clkSPI : out std_logic
    );
end component;

component SPI_Tx is 
generic (N : integer := 8); 
    port (  clk : in std_logic; 
            clkSPI : in std_logic; 
            CPOL : in std_logic; 
            CPHA : in std_logic; 
            TxValid : in std_logic; 
            rst : in std_logic;
            TxMosiData : in std_logic_vector (N-1 downto 0); 
            TxReady : out std_logic; 
            TxMosiBit : out std_logic 
    );
end component; 

component SPI_Rx is 
    generic (N : integer := 8); 
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

-- Signals -- 
signal CPOL : std_logic := '0'; 
signal CPHA : std_logic := '0'; 
signal TxValid : std_logic := '0'; 
signal clkSPI : std_logic := '0'; 
signal RxVFlag : std_logic := '0'; 
signal detect : std_logic := '0'; 
signal TxMosiData : std_logic_vector (N-1 downto 0) := (others => '0'); 
signal RxMisoOUT : std_logic_vector (N-1 downto 0) := (others => '0'); 
-- Output Signals --
signal RxValid_t : std_logic := '0'; 
signal TxReady_t : std_logic := '0'; 
signal TxMosiBit_t : std_logic := '0'; 
signal RxMisoData_t : std_logic_vector (N-1 downto 0) := (others => '0');  
-- Dummies --
signal edgeLeadIO, edgeFollowIO : std_logic; 


begin
    -- SPI MODE --
    with spiMode select CPOL <= 
        '0' when ("00" or "01"), 
        '1' when others; 

    with spiMode select CPHA <= 
        '0' when ("00" or "10"), 
        '1' when others; 

    -- Edge Detects -- 
    EdgeDetect(TxValidIN, clk, TxValid, edgeLeadIO, edgeFollowIO);
    EdgeDetect(RxValidOUT, clk, RxValid_t, edgeLeadIO, edgeFollowIO);
    -- Registers -- 
    SAEn_nBitReg(RxValid_t, rst, rst, clk, RxMisoOUT, RxMisoData_t); 
    SAEn_nBitReg(TxValid, rst, rst, clk, TxMosiIN, TxMosiData); 

    -- Component Maps -- 
    clk0 : clk_SPI 
        generic map (N => 8)
        port map (
            clk => clk, 
            CPOL => CPOL, 
            TxValid => TxValid, 
            rst => rst, 
            clkSPI => clkSPI
        );  

    SPI_Tx0 : SPI_Tx
        generic map (N => 8)
        port map (
            clk => clk, 
            clkSPI => clkSPI,
            CPOL => CPOL, 
            CPHA => CPHA, 
            TxValid => TxValid, 
            rst => rst, 
            TxMosiData => TxMosiData, 
            TxReady => TxReady_t, 
            TxMosiBit => TxMosiBit_t
        );

    SPI_Rx0 : SPI_Rx
        generic map (N => 8)
        port map (
            clk => clk, 
            clkSPI => clkSPI, 
            CPOL => CPOL, 
            CPHA => CPHA, 
            TxValid => TxValid, 
            RxMisoBit => RxMisoBit_t,
            rst => rst, 
            RxValid => RxValidOUT, 
            RxMisoData => RxMisoOUT
        ); 

    --proc1 : process( clk )
    --begin
    --    if (rising_edge(clk)) then
    --        if (RxValid_t = '1' and detect = '0') then
    --            RxVFlag <= '1'; 
    --            detect <= '1'; 
    --        elsif (RxVFlag = '1') then
    --            RxVFlag <= '0'; 
    --        elsif (RxValid_t) then
    --            Detect <= '0'; 
    --        end if ;
    --    end if ;
    --end process ; -- proc1: implements edge detection for RxMiso register 



        

    RxValid <= RxValid_t; 
    TxReady <= TxReady_t;
    TxMosiBit <= TxMosiBit_t; 
    RxMisoData <= RxMisoData_t;  


end Behavioral;
