----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:59 05/21/2018 
-- Design Name: 
-- Module Name:    Exception - Behavioral 
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

entity Exception is
    Port ( Opcode : in  STD_LOGIC_VECTOR(5 downto 0);
           OVF : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR(31 downto 0);
			  Reset : in std_logic;
			  Opcode_pipe2 : in STD_LOGIC_VECTOR(5 downto 0);
           Cause : out  STD_LOGIC_VECTOR(31 downto 0);
           WE_Pipe1 : out  STD_LOGIC;
			  WE_Pipe2 : out  STD_LOGIC;
			  EPC_Mux_sel : out  STD_LOGIC;
           Handler_sel : out  STD_LOGIC_VECTOR(1 downto 0);
			  WE_Flip_Flop : out STD_LOGIC);
end Exception;

architecture Behavioral of Exception is

signal Handler_sel_signal : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal Cause_signal : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
signal WE_Pipe1_signal : STD_LOGIC := '1';
signal WE_Pipe2_signal : STD_LOGIC := '1';
signal EPC_Mux_sel_signal : STD_LOGIC := '0';
signal WE_Flip_Flop_signal : STD_LOGIC := '0';
signal paparia : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000001000000000000";

begin

process(Opcode,OVF,ALU_out,Reset)
begin
if( Reset = '0' ) then
	if((Opcode /= "100000") AND (Opcode /= "111000") AND (Opcode /= "001111") AND (Opcode /= "101010")) then
		Handler_sel_signal <= "01";
		Cause_signal <= x"00000111";
		WE_Pipe1_signal <= '0';
		WE_Flip_Flop_signal <= '1';
		EPC_Mux_sel_signal <= '0';
	elsif(OVF = '1') then
		Handler_sel_signal <= "11";
		Cause_signal <= x"00111000";
		WE_Pipe2_signal <= '0';
		EPC_Mux_sel_signal <= '1';
		WE_Flip_Flop_signal <= '1';
	elsif((ALU_out > paparia) AND (Opcode_pipe2 = "001111")) then
		Handler_sel_signal <= "10";
		Cause_signal <= x"11000000";
		WE_Pipe2_signal <= '0';
		EPC_Mux_sel_signal <= '1';
		WE_Flip_Flop_signal <= '1';
	else
		Handler_sel_signal <= "00";
		Cause_signal <= x"00000000";
		WE_Pipe1_signal <= '1';
		WE_Pipe2_signal <= '1';
		WE_Flip_Flop_signal <= '0';
	end if;
end if;
end process;			  

Handler_sel <=	Handler_sel_signal;
Cause <=	Cause_signal;
WE_Pipe1 <=	WE_Pipe1_signal;
WE_Pipe2 <=	WE_Pipe2_signal;
EPC_Mux_sel <=	EPC_Mux_sel_signal;
WE_Flip_Flop <= WE_Flip_Flop_signal;

end Behavioral;

