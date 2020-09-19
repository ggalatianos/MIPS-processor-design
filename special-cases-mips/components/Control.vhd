----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:59:33 05/04/2018 
-- Design Name: 
-- Module Name:    Control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control is
    Port ( Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
           ALU_Func : out  STD_LOGIC_VECTOR (3 downto 0);
           data_WrEn : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC);
end Control;

architecture Behavioral of Control is

signal signal_RF_B_sel : STD_LOGIC := '0';
signal signal_RF_WrEn : STD_LOGIC := '0';
signal signal_ALU_Func : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal signal_data_WrEn : STD_LOGIC := '0';
signal signal_RF_WrData_sel : STD_LOGIC := '0';

begin
process(Instruction,Reset)
begin
if (Reset = '0') then
	if (Instruction (31 downto 26) = "100000") then --add
		signal_RF_B_sel <= '0';
		signal_RF_WrEn <= '1';
		signal_data_WrEn <= '0';
		signal_RF_WrData_sel <= '1';
	elsif (Instruction (31 downto 26) = "111000") then --li
		signal_RF_B_sel <= '1';
		signal_RF_WrEn <= '1';
		signal_data_WrEn <= '0';
		signal_RF_WrData_sel <= '1';
	elsif (Instruction (31 downto 26) = "001111") then --Load
		signal_RF_B_sel <= '1';
		signal_RF_WrEn <= '1';
		signal_data_WrEn <= '0';
		signal_RF_WrData_sel <= '0';
	elsif (Instruction (31 downto 26) = "011111") then --Store
		signal_RF_B_sel <= '1';
		signal_RF_WrEn <= '0';
		signal_data_WrEn <= '1';
		signal_RF_WrData_sel <= '0';
	end if;
else 
	signal_RF_WrEn <= '0';
	signal_data_WrEn <= '0';
end if;
end process;

RF_B_sel <= signal_RF_B_sel;  
RF_WrEn <= signal_RF_WrEn;
ALU_Func <= signal_ALU_Func;  
data_WrEn <= signal_data_WrEn;  
RF_WrData_sel <= signal_RF_WrData_sel;
	
end Behavioral;

