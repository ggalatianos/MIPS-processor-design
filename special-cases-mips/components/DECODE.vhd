----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:27:53 03/11/2018 
-- Design Name: 
-- Module Name:    DECODE - Behavioral 
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

entity DECODE is
    Port ( Instr : in STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in STD_LOGIC;
			  Awr : in STD_LOGIC_VECTOR (4 downto 0);
			  Data_Din : in STD_LOGIC_VECTOR (31 downto 0);
           RF_B_sel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Immed : out STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out STD_LOGIC_VECTOR (31 downto 0));
end DECODE;

architecture Structural of DECODE is

component TypeMux is
    Port ( Itype : in  STD_LOGIC_VECTOR (4 downto 0);
           Rtype : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_B_sel : in  STD_LOGIC;
           Ard2 : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component RFile is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC);
end component;

component Extension is
    Port ( Op : in  STD_LOGIC_VECTOR (5 downto 0);
           Instr : in  STD_LOGIC_VECTOR (15 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal Ard2_signal : std_logic_vector(4 downto 0);

begin

	typem : TypeMux port map(RType => Instr(15 downto 11),
									 IType => Instr(20 downto 16),
									 RF_B_sel => RF_B_sel,
									 Ard2 => Ard2_signal);
											  
	RF : RFile port map( Ard1 => Instr(25 downto 21),
								Ard2 => Ard2_signal,
								Awr => Awr,
								Dout1 => RF_A,
								Dout2 => RF_B,
								Din => Data_Din,
								WrEn => RF_WrEn,
								Clk => Clk);
								
	Exte : Extension port map(	Op => Instr(31 downto 26),
										Instr => Instr(15 downto 0),
										Output => Immed);
	                           								
end Structural;

