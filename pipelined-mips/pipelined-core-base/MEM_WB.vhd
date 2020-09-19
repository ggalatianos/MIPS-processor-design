----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:19 05/05/2018 
-- Design Name: 
-- Module Name:    MEM_WB - Behavioral 
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

entity MEM_WB is
    Port ( RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           WrData_sel : in  STD_LOGIC;
			  WE : in STD_LOGIC;
			  Clk : in STD_LOGIC;
           RF_WrEn_out : out  STD_LOGIC;
           ALU_out_out : out  STD_LOGIC_VECTOR (31 downto 0);
           Instruction_out : out  STD_LOGIC_VECTOR (31 downto 0);
           WrData_sel_out : out  STD_LOGIC);
end MEM_WB;

architecture Behavioral of MEM_WB is

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

signal RF_WrEn_signal : STD_LOGIC;
signal ALU_out_signal : STD_LOGIC_VECTOR (31 downto 0);
signal Instruction_signal : STD_LOGIC_VECTOR (31 downto 0);
signal WrData_sel_signal : STD_LOGIC;

begin

ALU_out_reg : Regi port map(WE => WE,
									 Data => ALU_out,
									 Dout => ALU_out_signal,
									 Clk => Clk);
									 
									 
Instruction_reg : Regi port map(WE => WE,
										  Data => Instruction,
										  Dout => Instruction_signal,
										  Clk => Clk);
										 
										  
RF_WrEn_reg : Regi1 port map(WE => WE,
									  Data => RF_WrEn,
									  Dout => RF_WrEn_signal,
									  Clk => Clk);

									  
WrData_sel_reg : Regi1 port map(WE => WE,
										  Data => WrData_sel,
										  Dout => WrData_sel_signal,
										  Clk => Clk);		


RF_WrEn_out <= RF_WrEn_signal;
ALU_out_out <= ALU_out_signal;
Instruction_out <= Instruction_signal;
WrData_sel_out <= WrData_sel_signal;
									  
end Behavioral;

