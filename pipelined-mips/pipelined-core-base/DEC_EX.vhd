----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:05:35 05/04/2018 
-- Design Name: 
-- Module Name:    IF_DEC - Behavioral 
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

entity DEC_EX is
    Port ( WE : in  STD_LOGIC;
			  Clk : in  STD_LOGIC;
			  RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Func : in  STD_LOGIC_VECTOR (3 downto 0);
           data_WrEn : in  STD_LOGIC;
           WrData_sel : in  STD_LOGIC;
           RF_WrEn : in  STD_LOGIC;
           RF_A_out : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B_out : out  STD_LOGIC_VECTOR (31 downto 0);
           Immed_out : out  STD_LOGIC_VECTOR (31 downto 0);
           Instruction_out : out  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Func_out : out  STD_LOGIC_VECTOR (3 downto 0);
           data_WrEn_out : out  STD_LOGIC;
           WrData_sel_out : out  STD_LOGIC;
           RF_WrEn_out : out  STD_LOGIC);
end DEC_EX;

architecture Behavioral of DEC_EX is

Component Regi is
    Port ( Clk : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC);
end Component;

Component Regi1 is
    Port ( Clk : in  STD_LOGIC;
           Data : in  STD_LOGIC;
           Dout : out  STD_LOGIC;
           WE : in  STD_LOGIC);
end Component;

Component Regi4 is
    Port ( Clk : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (3 downto 0);
           Dout : out  STD_LOGIC_VECTOR (3 downto 0);
           WE : in  STD_LOGIC);
end Component;

signal RF_A_signal : STD_LOGIC_VECTOR (31 downto 0);
signal RF_B_signal : STD_LOGIC_VECTOR (31 downto 0);--
signal Immed_signal : STD_LOGIC_VECTOR (31 downto 0);
signal Instruction_signal : STD_LOGIC_VECTOR (31 downto 0);--
signal ALU_Func_signal : STD_LOGIC_VECTOR (3 downto 0);
signal data_WrEn_signal : STD_LOGIC;--
signal WrData_sel_signal : STD_LOGIC;--
signal RF_WrEn_signal : STD_LOGIC;--

begin

RF_A_reg : Regi port map(WE => WE,
								 Data => RF_A,
								 Dout => RF_A_signal,
								 Clk => Clk);
								 
RF_B_reg : Regi port map(WE => WE,
								 Data => RF_B,
								 Dout => RF_B_signal,
								 Clk => Clk);
								 
Immed_reg : Regi port map(WE => WE,
								  Data => Immed,
								  Dout => Immed_signal,
								  Clk => Clk);
								  
Instruction_reg : Regi port map(WE => WE,
										  Data => Instruction,
										  Dout => Instruction_signal,
										  Clk => Clk);
									 
ALU_Func_reg : Regi4 port map(WE => WE,
										Data => ALU_Func,
										Dout => ALU_Func_signal,
										Clk => Clk);

data_WrEn_reg : Regi1 port map(WE => WE,
										 Data => data_WrEn,
										 Dout => data_WrEn_signal,
										 Clk => Clk);
									
WrData_sel_reg : Regi1 port map(WE => WE,
										  Data => WrData_sel,
										  Dout => WrData_sel_signal,
										  Clk => Clk);
									 
RF_WrEn_reg : Regi1 port map(WE => WE,
									  Data => RF_WrEn,
									  Dout => RF_WrEn_signal,
									  Clk => Clk);

RF_A_out <= RF_A_signal;
RF_B_out <= RF_B_signal;
Immed_out <= Immed_signal;
Instruction_out <= Instruction_signal;
ALU_Func_out <= ALU_Func_signal;
data_WrEn_out <= data_WrEn_signal;
WrData_sel_out <= WrData_sel_signal;
RF_WrEn_out <= RF_WrEn_signal;

end Behavioral;

