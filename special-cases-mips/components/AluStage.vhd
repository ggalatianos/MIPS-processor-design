----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:58:24 03/11/2018 
-- Design Name: 
-- Module Name:    AluStage - Behavioral 
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

entity AluStage is
    Port ( RF_A : in STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in STD_LOGIC_VECTOR (31 downto 0);
           Immed : in STD_LOGIC_VECTOR (31 downto 0);
			  EX_MEM : in STD_LOGIC_VECTOR (31 downto 0);
			  MEM_WB : in STD_LOGIC_VECTOR (31 downto 0);
			  ALU_Ain_Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0));
end AluStage;

architecture Structural of AluStage is

component ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Zero : out  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Ovf : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

Component Mux4x1 is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
			  C : in STD_LOGIC_VECTOR (31 downto 0);
			  D : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           Output : out STD_LOGIC_VECTOR (31 downto 0));
end Component;

signal Ain_signal : std_logic_vector(31 downto 0);
signal Bin_signal : std_logic_vector(31 downto 0);
signal zero_signal : std_logic_vector(31 downto 0);

begin

zero_signal <= "00000000000000000000000000000000";
								
ALUS : ALU port map(A => Ain_signal,
                    B => Bin_signal,
						  Op => ALU_func,
						  Output => ALU_out);
							 
ALU_Ain : Mux4x1 port map(A => RF_A,
								  B => EX_MEM,
								  C => MEM_WB,
								  D => zero_signal,
								  Sel => ALU_Ain_sel,
								  Output => Ain_signal);
								  
ALU_Bin : Mux4x1 port map(A => RF_B,
								  B => Immed,
								  C => EX_MEM,
								  D => MEM_WB,
								  Sel => ALU_Bin_sel,
								  Output => Bin_signal);
							 
end Structural;

