----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:24:48 05/05/2018 
-- Design Name: 
-- Module Name:    Stall - Behavioral 
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

entity Stall is
    Port ( InstrDec_Ex : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrEx_Mem : in  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in STD_LOGIC;
			  PC_LdEn : out STD_LOGIC;
			  PC_sel : out STD_logic);
end Stall;

architecture Behavioral of Stall is

signal PC_sel_signal : STD_LOGIC := '0';
signal PC_LdEn_signal : STD_LOGIC := '1';

begin
	
	process(InstrDec_Ex,InstrEx_Mem,Reset)
	begin
	
	if (Reset = '0') then
		if (InstrEx_Mem(31 downto 26) = "001111" AND InstrDec_Ex(31 downto 26) = "100000" AND (InstrEx_Mem(20 downto 16) = InstrDec_Ex(25 downto 21) OR InstrEx_Mem(20 downto 16) = InstrDec_Ex(15 downto 11))) then
			PC_sel_signal <= '1';
			PC_LdEn_signal <= '0';
		else 
		   PC_LdEn_signal <= '1';
			PC_sel_signal <= '0';
		end if;
	else
		PC_LdEn_signal <= '0';
	end if;
	end process;

PC_sel <= PC_sel_signal;
PC_LdEn <= PC_LdEn_signal;											

end Behavioral;

