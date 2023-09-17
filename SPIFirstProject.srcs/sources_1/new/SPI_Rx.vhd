----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/23/2023 06:50:16 PM
-- Design Name: 
-- Module Name: SPI_Rx - Behavioral
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

entity SPI_Rx is
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
end SPI_Rx;

architecture Behavioral of SPI_Rx is


signal RxFlag : std_logic := '0';
signal RxEdge : std_logic := '0'; 
signal sampleDelay : std_logic := '0'; 
signal sampleFlag : std_logic := '0'; 
signal RxValid_t : std_logic := '0'; 
signal cDetect : std_logic := '0'; 
signal bitIndex : integer range -1 to N := N-1;  
signal RxMisoData_t : std_logic_vector (N-1 downto 0) := (others => '0'); 

begin

    proc1 : process( clk, clkSPI, rst )
    begin
        if (rst = '1') then
            RxValid_t <= '0'; 
            RxMisoData_t <= "00000000"; 
            bitIndex <= N-1; 
            RxEdge <= '0'; 
            RxFlag <= '0'; 
        elsif (rising_edge(clk)) then
            if (bitIndex > -1 and RxFlag = '1') then
                if (CPOL = '0' and CPHA = '0') then
                    if (sampleFlag = '1') then
                        RxMisoData_t(bitIndex) <= RxMisoBit; 
                        bitIndex <= bitIndex -1; 
                        RxEdge <= '1';
                    end if ;
                elsif (CPOL = '0' and CPHA = '1') then
                    if (sampleFlag = '1') then
                        RxMisoData_t(bitIndex) <= RxMisoBit; 
                        bitIndex <= bitIndex -1; 
                    end if ;
                elsif (CPOL = '1' and CPHA = '0') then
                    if (sampleFlag = '1') then
                        RxMisoData_t(bitIndex) <= RxMisoBit; 
                        bitIndex <= bitIndex -1; 
                    end if ;
                elsif (CPOL = '1' and CPHA = '1') then
                    if (sampleFlag = '1') then
                        RxMisoData_t(bitIndex) <= RxMisoBit; 
                        bitIndex <= bitIndex -1; 
                        RxEdge <= '1'; 
                    end if ;
                end if ;
            elsif (TxValid = '1') then
                RxFlag <= '1'; 
                RxValid_t <= '0';
            elsif (TxReady = '1') then
                RxMisoData_t <= (others => '0');
                RxValid_t  <= '0'; 
                RxEdge <= '0'; 
                bitIndex <= N-1; 
            end if ;  
            if (bitIndex = -1) then
                if (RxEdge = '1') then
                    --if ((cDetect = not clkSPI) and clkSPI = '1') then
                    RxFlag <= '0'; 
                    RxValid_t <= '1';
                    if ((cDetect = not clkSPI) and clkSPI = '0') then
                        RxValid_t  <= '0'; 
                        RxEdge <= '0'; 
                        bitIndex <= N-1; 
                        --RxMisoData_t <= (others => '0');
                    end if; 
                else 
                    RxFlag <= '0'; 
                    RxValid_t <= '1';
                    if ((cDetect = not clkSPI) and clkSPI = '0') then
                        RxValid_t  <= '0'; 
                        RxEdge <= '0'; 
                        bitIndex <= N-1; 
                        --RxMisoData_t <= (others => '0');
                    end if; 
                    --if (falling_edge(clkSPI)) then
                    --    RxFlag <= '0'; 
                    --    RxValid_t <= '1';    
                    --elsif (rising_edge(clkSPI)) then
                    --    bitIndex <= N-1;
                    --    RxMisoData_t <= (others => '0'); 
                    --end if ;
                end if ;
            end if ;  
        end if ;
    end process ; -- proc1

    sampleProc : process( clk, clkSPI, rst )
    begin
        -- Default -- 
        --sampleFlag <= '0'; 

        if (rst = '1') then
            sampleFlag <= '0'; 
            sampleDelay <= '0';
        elsif (rising_edge(clk)) then
            sampleFlag <= '0';
            if (RxFlag = '1') then
                if (sampleDelay = '1') then
                    sampleFlag <= '1'; 
                    sampleDelay <= '0'; 
                elsif (CPOL = '0' and CPHA = '0') then
                    if ((cDetect = not clkSPI) and clkSPI = '1') then -- Rising Edge Detect mechanism
                        sampleDelay <= '1'; 
                    end if ;
                elsif (CPOL = '0' and CPHA = '1') then
                    if ((cDetect = not clkSPI) and clkSPI = '0') then -- Falling Edge Detection mechanism 
                        sampleDelay <= '1'; 
                    end if ;
                elsif (CPOL = '1' and CPHA = '0') then
                    if ((cDetect = not clkSPI) and clkSPI = '0') then
                        sampleDelay <= '1'; 
                    end if ;
                elsif (CPOL = '1' and CPHA = '1') then
                    if ((cDetect = not clkSPI) and clkSPI = '1') then
                        sampleDelay <= '1';     
                    end if ;
                end if ;
            else
                sampleDelay <= '0'; 
            end if ;    
        end if ;
    end process ; -- sampleProc

    EdgeProc : process( clk )
    begin
        if (rst = '1') then
            cDetect <= '0';
        elsif (rising_edge(clk)) then
            cDetect <= clkSPI; 
        end if ;
    end process ; -- EdgeProc 

    RxValid <= RxValid_t; 
    RxMisoData <= RxMisoData_t; 




end Behavioral;
