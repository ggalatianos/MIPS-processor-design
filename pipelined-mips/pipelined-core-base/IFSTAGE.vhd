----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:13:27 03/11/2018 
-- Design Name: 
-- Module Name:    IFSTAGE - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IFSTAGE is
    Port ( InputException : in  STD_LOGIC_VECTOR (31 downto 0);
			  PC_sel_handler : in STD_LOGIC_VECTOR (1 downto 0);
			  PC_sel_exception : in STD_LOGIC;
			  PC_LdEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  Exception : out  STD_LOGIC_VECTOR (31 downto 0);
           Instr : out  STD_LOGIC_VECTOR (10 downto 0));
end IFSTAGE;

architecture Structural of IFSTAGE is

component PC is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
			  Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Adder is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux4x1 is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
			  C : in STD_LOGIC_VECTOR (31 downto 0);
			  D : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           Output : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux2x1_32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal PcOut : std_logic_vector(31 downto 0);
signal PcOutFour : std_logic_vector(31 downto 0);
signal Handler_signal : std_logic_vector(31 downto 0);
signal Pc_In_signal : std_logic_vector(31 downto 0);
signal InputException_signal : std_logic_vector(31 downto 0);

begin

PCon : PC port map( Input => PcOutFour,
						  Output => PcOut,
                    Clk => Clk,
						  Reset => Reset,
						  PC_LdEn => PC_LdEn);
						
Add1 : Adder port map( A => Pc_In_signal,
                       Output => PcOutFour);
							 
Add2 : Adder port map( A => InputException,
                       Output => InputException_signal);
							 
ExceptionMux : Mux2x1_32 port map( A => InputException_signal,
											  B => PcOut,
											  sel => PC_sel_exception,
											  Output => Handler_signal);
							 
HandlerMux : Mux4x1 port map( A => Handler_signal,
									   B => x"00000100",
									   C => x"00000200",
									   D => x"00000300",
									   sel => PC_sel_handler,
									   Output => Pc_In_signal);
								  
Instr <= Pc_In_signal(12 downto 2);
Exception <= Handler_signal;
								 
end Structural;

