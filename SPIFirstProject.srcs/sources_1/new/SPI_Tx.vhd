----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/23/2023 06:49:47 PM
-- Design Name: 
-- Module Name: SPI_Tx - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI_Tx is
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
end SPI_Tx;

architecture Behavioral of SPI_Tx is

signal TxReady_t : std_logic := '1';
signal TxMosiBit_t : std_logic := '0'; 
signal TxFlag : std_logic := '0'; 
signal TxEdge : std_logic := '0'; 
signal bitIndex : integer range -1 to N := N-1;  
-- Debugging signal --
signal cDetect : std_logic := '0'; 


begin

    proc1 : process( clk, clkSPI, rst)
    begin
        if (rst = '1') then
            TxReady_t <= '1'; 
            TxMosiBit_t <= '0'; 
            TxFlag <= '0'; 
            bitIndex <= N-1; 
        elsif (rising_edge(clk)) then
            if (bitIndex > -1 and TxFlag = '1' ) then 
                if (CPOL = '0' and CPHA = '0') then
                    if ((cDetect = not clkSPI) and clkSPI = '1') then -- Rising Edge Detect mechanism
                        TxMosiBit_t <= TxMosiData(bitIndex); 
                        bitIndex <= bitIndex - 1; 
                        TxEdge <= '1'; 
                    end if ;
                elsif (CPOL = '0' and CPHA = '1') then
                    if ((cDetect = not clkSPI) and clkSPI = '0') then -- Falling Edge Detect mechanism 
                        TxMosiBit_t <= TxMosiData(bitIndex); 
                        bitIndex <= bitIndex - 1; 
                    end if ;
                elsif (CPOL = '1' and CPHA = '0') then
                    if ((cDetect = not clkSPI) and clkSPI = '0') then
                        TxMosiBit_t <= TxMosiData(bitIndex); 
                        bitIndex <= bitIndex - 1; 
                    end if; 
                elsif (CPOL = '1' and CPHA = '1') then
                    if ((cDetect = not clkSPI) and clkSPI = '1') then
                        TxMosiBit_t <= TxMosiData(bitIndex); 
                        bitIndex <= bitIndex - 1; 
                        TxEdge <= '1'; 
                    end if ;
                end if ; 
            elsif (TxValid = '1') then
                TxReady_t <= '0'; 
                TxFlag <= '1';
            else
                if (TxEdge = '1') then
                    if ((cDetect = not clkSPI) and clkSPI = '1') then
                        --bitIndex <= bitIndex - 1;
                        TxEdge <= '0';
                        TxMosiBit_t <= '0';
                    --end if ; 
                    --if (bitIndex = -2) then
                    --    if ((cDetect = not clkSPI) and clkSPI = '0') then
                    --        TxReady_t <= '1'; 
                    --        TxFlag <= '0'; 
                    --        TxEdge <= '0';
                    --        TxMosiBit_t <= '0';
                    --    end if ; 
                    end if ; 
                else
                    if (RxValid = '1') then
                        bitIndex <= N-1; 
                        TxReady_t <= '1'; 
                        TxFlag <= '0'; 
                    elsif ((cDetect = not clkSPI) and clkSPI = '0') then -- formatting 
                        --if (falling_edge(clk)) then
                            TxMosiBit_t <= '0';
                        --end if ;
                    --elsif (RxValid = '1') then
                    --    bitIndex <= N-1; 
                    --    TxReady_t <= '1'; 
                    --    TxFlag <= '0'; 
                    end if ;
                end if ;
            end if ;
        end if ; 
                                
    end process ; -- proc1

    EdgeProc : process( clk )
    begin
        if (rst = '1') then
            cDetect <= '0';
        elsif (rising_edge(clk)) then
            cDetect <= clkSPI; 
        end if ;
    end process ; -- EdgeProc 


    TxReady <= TxReady_t; 
    TxMosiBit <= TxMosiBit_t; 

end Behavioral;
