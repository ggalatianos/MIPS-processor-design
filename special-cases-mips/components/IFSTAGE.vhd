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
    Port ( PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  PC_sel : in STD_LOGIC;
           Clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (10 downto 0));
end IFSTAGE;

architecture Structural of IFSTAGE is

component PC is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC);
end component;

component Adder is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
			  Output1 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux2x1_32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal PcOut : std_logic_vector(31 downto 0);
signal PcOutFour : std_logic_vector(31 downto 0);
signal Pc_In_signal : std_logic_vector(31 downto 0);
signal PcOutMinusFour : std_logic_vector(31 downto 0);

begin

PCon : PC port map( Input => PcOutFour,
						  Output => PcOut,
                    Clk => Clk,
						  Reset => Reset,
						  PC_LdEn => PC_LdEn);
						
Add : Adder port map( A => PcOut,
                      Output => PcOutFour,
							 Output1 => PcOutMinusFour);
							 
StallMux : Mux2x1_32 port map( A => PcOut,
										 B => PcOutMinusFour,
										 sel => PC_sel,
										 Output => Pc_In_signal);
								  
Instr <= Pc_In_signal(12 downto 2);
								 
end Structural;

