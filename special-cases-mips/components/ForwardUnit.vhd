----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:32 05/05/2018 
-- Design Name: 
-- Module Name:    ForwardUnit - Behavioral 
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

entity ForwardUnit is
    Port ( InstrDec_Ex : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrEx_Mem : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrMem_Wb : in  STD_LOGIC_VECTOR (31 downto 0);
           Rf_Wr_EnEx_Mem : in  STD_LOGIC;
           Rf_Wr_EnMem_Wb : in  STD_LOGIC;
           Alu_Ain_sel : out  STD_LOGIC_VECTOR (1 downto 0);
           Alu_Bin_sel : out  STD_LOGIC_VECTOR (1 downto 0));
end ForwardUnit;

architecture Behavioral of ForwardUnit is

begin

process(InstrDec_Ex,InstrEx_Mem,InstrMem_Wb,Rf_Wr_EnEx_Mem,Rf_Wr_EnMem_Wb)
begin
if( InstrDec_Ex(31 downto 26) = "111000" ) then
	Alu_Ain_sel <= "11";
	Alu_Bin_sel <= "01";
elsif( InstrDec_Ex(31 downto 26) = "001111" OR InstrDec_Ex(31 downto 26) = "011111" ) then
	Alu_Ain_sel <= "00";
	Alu_Bin_sel <= "01";
elsif( Rf_Wr_EnEx_Mem  = '1' AND (InstrDec_Ex(25 downto 21) = InstrEx_Mem(20 downto 16) OR InstrDec_Ex(15 downto 11) = InstrEx_Mem(20 downto 16)) ) then
	
	if( InstrDec_Ex(25 downto 21) = InstrEx_Mem(20 downto 16) ) then
		Alu_Ain_sel <= "01";
	else
		Alu_Ain_sel <= "00";
	end if;
	
	if( InstrDec_Ex(15 downto 11) = InstrEx_Mem(20 downto 16) ) then
		Alu_Bin_sel <= "10";
	else
		Alu_Bin_sel <= "00";
	end if;
	
elsif( Rf_Wr_EnMem_Wb = '1' AND (InstrDec_Ex(25 downto 21) = InstrMem_Wb(20 downto 16) OR InstrDec_Ex(15 downto 11) = InstrMem_Wb(20 downto 16)) ) then

	if( InstrDec_Ex(25 downto 21) = InstrMem_Wb(20 downto 16) ) then
		Alu_Ain_sel <= "10";
	else
		Alu_Ain_sel <= "00";
	end if;
	
	if( InstrDec_Ex(15 downto 11) = InstrMem_Wb(20 downto 16) ) then
		Alu_Bin_sel <= "11";
	else
		Alu_Bin_sel <= "00";
	end if;
else
	Alu_Ain_sel <= "00";
	Alu_Bin_sel <= "00";
end if;
end process;

end Behavioral;

