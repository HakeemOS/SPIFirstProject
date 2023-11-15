----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/23/2023 09:46:24 AM
-- Design Name: 
-- Module Name: spiMasterCs_s - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
library myLib; 
use myLib.paraPcr_p.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spiMasterCs_s is
    generic (   spiMode : std_logic_vector (1 downto 0) := "00";
                byteTxNum : integer := 2;                                               --Num of bytes transmitter per chip select going active; max
                N : integer := 8
    );
    port (  clk : in std_logic; 
            TxValidIN : in std_logic; 
            RxMisoBit : in std_logic; 
            TxCount : in std_logic_vector (1 downto 0);                                 -- How many bytes will actually Tx
            TxMosiIN : in std_logic_vector (N-1 downto 0); 
            rst : in std_logic; 
            RxValid : out std_logic; 
            TxReady : out std_logic; 
            TxMosiBit : out std_logic;
            chipSelect : out std_logic;                                                 -- Outputs chip select value (controlled internally); active low enable  
            RxIndex : out std_logic_vector (1 downto 0);                                -- Tracking how many bytes are Rx
            RxMisoData : out std_logic_vector (N-1 downto 0)
    );
end spiMasterCs_s;

architecture Behavioral of spiMasterCs_s is

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
            RxValid : in std_logic; 
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
            TxReady : in std_logic; 
            rst : in std_logic; 
            RxValid : out std_logic; 
            RxMisoData : out std_logic_vector
    );
end component; 

-- types -- 
type states is (ready, RxTx, waiting); 
-- Signals -- 
signal CPOL : std_logic := '0'; 
signal CPHA : std_logic := '0'; 
signal TxValid : std_logic := '0'; 
signal clkSPI : std_logic := '0'; 
signal RxValidOUT : std_logic := '0'; 
signal cDetect : std_logic := '0'; 
signal TxMosiData : std_logic_vector (N-1 downto 0) := (others => '0'); 
signal RxMisoOUT : std_logic_vector (N-1 downto 0) := (others => '0'); 
-- Output Signals --
signal RxValid_t : std_logic := '0'; 
signal TxReady_t : std_logic := '1'; 
signal TxMosiBit_t : std_logic := '0'; 
signal chipSelect_t : std_logic := '1'; 
signal RxIndex_t : std_logic_vector (1 downto 0) := (others => '0');  
signal RxMisoData_t : std_logic_vector (N-1 downto 0) := (others => '0');  
-- Dummies --
signal TxEdgeLeadIO, TxEdgeFollowIO : std_logic := '0'; 
signal RxEdgeLeadIO, RxEdgeFollowIO : std_logic := '0'; 
-- SM Signals --
signal stt : states := ready; 
signal TxBCount : std_logic_vector (1 downto 0) := (others => '0'); 
signal clkSPICount : std_logic_vector (3 downto 0) := (others => '0'); 
signal idleFlag : std_logic := '1'; 

begin
        -- SPI MODE --
    with spiMode select CPOL <= 
        '0' when "00" , 
        '0' when "01",
        '1' when others; 

    with spiMode select CPHA <= 
        '0' when "00", 
        '0' when "10", 
        '1' when others; 

    -- Edge Detects -- 
    EdgeDetect(TxValidIN, clk, TxValid, TxEdgeLeadIO, TxEdgeFollowIO);
    EdgeDetect(RxValidOUT, clk, RxValid_t, RxEdgeLeadIO, RxEdgeFollowIO);
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
            RxValid => RxValid_t,
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
            RxMisoBit => RxMisoBit,
            TxReady => TxReady_t, 
            rst => rst, 
            RxValid => RxValidOUT, 
            RxMisoData => RxMisoOUT
        ); 

    -- State Processes -- 
    trns : process( clk )
    begin
        if (rst = '1') then
            stt <= ready; 
            
        else
            if (rising_edge(clk)) then
                case( stt ) is
                    when ready =>
                        if (chipSelect_t = '0') then
                          stt <= RxTx;   
                        end if ;
                    when RxTx => 
                        if (chipSelect_t = '1') then
                            stt <= waiting; 
                        end if ;
                    when others =>
                        if (idleFlag = '1') then
                            stt <= ready; 
                        end if ;
                end case ;
            end if ;
        end if ;
        
    end process ; -- trns
    
    output : process( stt, TxValid, chipSelect_t, TxReady_t, clkSPICount, RxValid_t )
    begin
        if (rst = '1') then
            chipSelect_t <= '1'; 
        else
            case( stt ) is
                when ready =>
                    idleFlag <= '0'; 
                    if (chipSelect_t = '1' and TxValid = '1') then
                        chipSelect_t <= '0'; 
                        RxIndex_t <= std_logic_vector(unsigned (TxCount) - 1); 
                    end if ;
                when RxTx =>
                    if (TxReady_t = '1') then
                        if (unsigned(RxIndex_t) > 0) then
                            if (TxValid = '1') then
                                RxIndex_t <= std_logic_vector(unsigned (RxIndex_t) - 1); 
                            end if ;
                        end if ;
                    elsif (unsigned(RxIndex_t) = 0) then
                        if (clkSPICount = "1001") then
                                RxIndex_t <= std_logic_vector(to_unsigned(byteTxNum, RxIndex_t'length)); 
                                chipSelect_t <= '1';
                            end if ;    
                    end if ;          
                when others =>
                    if (clkSPICount = "1010") then
                        idleFlag <= '1'; 
                    end if ;
            end case ;
        end if ;
    end process ; -- output

    counterProc : process( clkSPI, cDetect, clk )
    begin
        if (rst = '1') then
            clkSPICount <= "0000"; 
        elsif (rising_edge(clk)) then
            if (clkSPICount = "1010") then
                clkSPICount <= "0000"; 
            elsif (TxValid = '1') then
                clkSPICount <= "0000"; 
            else
                case( spiMode ) is
                    when "00" =>
                        if ((cDetect = not clkSPI) and clkSPI = '1') then
                            clkSPICount <= std_logic_vector(unsigned(clkSPICount) + 1); 
                        end if ; 
                    when "01" =>
                        if ((cDetect = not clkSPI) and clkSPI = '0') then
                            clkSPICount <= std_logic_vector(unsigned(clkSPICount) + 1);
                        end if ; 
                    when "10" =>
                        if ((cDetect = not clkSPI) and clkSPI = '0') then
                            clkSPICount <= std_logic_vector(unsigned(clkSPICount) + 1);
                        end if ;
                    when others =>
                        if ((cDetect = not clkSPI) and clkSPI = '1') then
                            clkSPICount <= std_logic_vector(unsigned(clkSPICount) + 1);
                        end if ;
                end case ;
            end if ;
            
        end if ;
        
    end process ; -- counterProc

    EdgeProc : process( clk )
    begin
        if (rst = '1') then
            cDetect <= '0';
        elsif (rising_edge(clk)) then
            cDetect <= clkSPI; 
        end if ;
    end process ; -- EdgeProc 


    RxValid <= RxValid_t; 
    TxReady <= TxReady_t;
    TxMosiBit <= TxMosiBit_t; 
    RxMisoData <= RxMisoData_t;  
    chipSelect <= chipSelect_t; 
    RxIndex <= RxIndex_t; 

end Behavioral;
