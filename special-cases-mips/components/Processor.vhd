----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:44:55 05/05/2018 
-- Design Name: 
-- Module Name:    Processor - Behavioral 
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

entity Processor is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Output : out STD_LOGIC);
end Processor;

architecture Behavioral of Processor is

component AluStage is
    Port ( RF_A : in STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in STD_LOGIC_VECTOR (31 downto 0);
           Immed : in STD_LOGIC_VECTOR (31 downto 0);
			  EX_MEM : in STD_LOGIC_VECTOR (31 downto 0);
			  MEM_WB : in STD_LOGIC_VECTOR (31 downto 0);
			  ALU_Ain_Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Control is
    Port ( Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
           ALU_Func : out  STD_LOGIC_VECTOR (3 downto 0);
           data_WrEn : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC);
end component;

component DECODE is
    Port ( Instr : in STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in STD_LOGIC;
			  Awr : in STD_LOGIC_VECTOR (4 downto 0);
			  Data_Din : in STD_LOGIC_VECTOR (31 downto 0);
           RF_B_sel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Immed : out STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component DEC_EX is
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
end component;

component EX_MEM is
    Port ( WE : in  STD_LOGIC;
			  Clk : in  STD_LOGIC;
			  ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           data_WrEn : in  STD_LOGIC;
           WrData_sel : in  STD_LOGIC;
           ALU_out_out : out  STD_LOGIC_VECTOR (31 downto 0);
           Instruction_out : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn_out : out  STD_LOGIC;
           RF_B_out : out  STD_LOGIC_VECTOR (31 downto 0);
           data_WrEn_out : out  STD_LOGIC;
           WrData_sel_out : out  STD_LOGIC);
end component;

component ForwardUnit is
    Port ( InstrDec_Ex : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrEx_Mem : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrMem_Wb : in  STD_LOGIC_VECTOR (31 downto 0);
           Rf_Wr_EnEx_Mem : in  STD_LOGIC;
           Rf_Wr_EnMem_Wb : in  STD_LOGIC;
           Alu_Ain_sel : out  STD_LOGIC_VECTOR (1 downto 0);
           Alu_Bin_sel : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component IFSTAGE is
    Port ( PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  PC_sel : in STD_LOGIC;
           Clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (10 downto 0));
end component;

component MEM_WB is
    Port ( WE : in  STD_LOGIC;
			  Clk : in  STD_LOGIC;
			  RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           WrData_sel : in  STD_LOGIC;
           RF_WrEn_out : out  STD_LOGIC;
           ALU_out_out : out  STD_LOGIC_VECTOR (31 downto 0);
           Instruction_out : out  STD_LOGIC_VECTOR (31 downto 0);
           WrData_sel_out : out  STD_LOGIC);
end component;

component MainMemory is
    Port ( inst_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           inst_dout : out  STD_LOGIC_VECTOR (31 downto 0);
           data_we : in  STD_LOGIC;
           data_addr : in  STD_LOGIC_VECTOR (10 downto 0);
           data_din : in  STD_LOGIC_VECTOR (31 downto 0);
           data_dout : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end component;

component MemStage is
    Port (ALU_MEM_addr : in  STD_LOGIC_VECTOR (31 downto 0);
	       Output : out STD_LOGIC_VECTOR(10 downto 0));
end component;

component Mux2x1_32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Stall is
    Port ( InstrDec_Ex : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrEx_Mem : in  STD_LOGIC_VECTOR (31 downto 0);
			  Reset : in STD_LOGIC;
			  PC_LdEn : out STD_LOGIC;
			  PC_sel : out STD_logic);
end component;

signal PC_LdEn_signal : STD_LOGIC;
signal PC_sel_signal : STD_LOGIC;

signal inst_addr_signal : STD_LOGIC_VECTOR(10 downto 0);
signal Instruction_signal : STD_LOGIC_VECTOR(31 downto 0);
signal Instruction_stall : STD_LOGIC_VECTOR(31 downto 0);
signal Instruction_out_signal : STD_LOGIC_VECTOR(31 downto 0);
signal Instruction_out_MEM_WB_signal : STD_LOGIC_VECTOR(31 downto 0);

signal data_WrEn_signal : STD_LOGIC;
signal data_WrEn_out_signal : STD_LOGIC;
signal data_WrEn_out_signal_final : STD_LOGIC;
signal data_addr_signal : STD_LOGIC_VECTOR(10 downto 0);
signal mem_data_out_signal  : STD_LOGIC_VECTOR(31 downto 0);

signal RF_B_sel_signal : STD_LOGIC;
signal RF_WrData_sel_signal : STD_LOGIC;
signal RF_data_din_signal : STD_LOGIC_VECTOR(31 downto 0);
signal RF_A_signal : STD_LOGIC_VECTOR(31 downto 0);
signal RF_B_signal : STD_LOGIC_VECTOR(31 downto 0);
signal RF_A_out_signal : STD_LOGIC_VECTOR(31 downto 0);
signal RF_B_out_signal : STD_LOGIC_VECTOR(31 downto 0);
signal RF_WrEn_final : STD_LOGIC;
signal RF_WrEn_signal : STD_LOGIC;
signal RF_WrEn_out_signal : STD_LOGIC;
signal RF_WrEn_MEM_WB_signal : STD_LOGIC;
signal RF_B_Memory_signal : STD_LOGIC_VECTOR(31 downto 0);

signal Immed_signal : STD_LOGIC_VECTOR(31 downto 0);
signal Immed_out_signal : STD_LOGIC_VECTOR(31 downto 0);

signal WE_stall_signal : STD_LOGIC;

signal MEM_WB_ALU_signal : STD_LOGIC_VECTOR(31 downto 0);
signal ALU_Func_out_signal : STD_LOGIC_VECTOR(3 downto 0);
signal ALU_Ain_sel_signal : STD_LOGIC_VECTOR(1 downto 0);
signal ALU_Bin_sel_signal: STD_LOGIC_VECTOR(1 downto 0);
signal ALU_out_EX_MEM_signal : STD_LOGIC_VECTOR(31 downto 0);
signal ALU_out_Memory_MEM_WB_signal  : STD_LOGIC_VECTOR(31 downto 0);
signal ALU_Func_signal : STD_LOGIC_VECTOR(3 downto 0);

signal WrData_sel_MEM_WB_signal : STD_LOGIC;
signal WrData_sel_out_final : STD_LOGIC;
signal WrData_sel_out_signal : STD_LOGIC;
signal WB_in_b : STD_LOGIC_VECTOR(31 downto 0);

begin

PC : IFSTAGE port map(PC_LdEn => PC_LdEn_signal,
							 Reset => Reset,
							 PC_sel => PC_sel_signal,
							 Clk => Clk,
							 Instr => inst_addr_signal);
							 
RAM : MainMemory port map(inst_addr => inst_addr_signal,
								  inst_dout => Instruction_signal,
								  data_we => data_WrEn_out_signal_final,
								  data_addr => data_addr_signal,
								  data_din => RF_B_Memory_signal,
								  data_dout => mem_data_out_signal,
								  clk => Clk);

Software : Control port map(Instruction => Instruction_signal,
									 RF_B_sel => RF_B_sel_signal,
									 RF_WrEn => RF_WrEn_signal,
									 ALU_Func => ALU_Func_signal,
									 data_WrEn => data_WrEn_signal,
									 RF_WrData_sel => RF_WrData_sel_signal,
									 Reset => Reset);
									 
Decoder : DECODE port map(Instr => Instruction_signal,
								  RF_WrEn => RF_WrEn_final,
								  Awr => Instruction_stall(20 downto 16),
								  Data_Din => RF_data_din_signal,
								  RF_B_sel => RF_B_sel_signal,
								  Clk => Clk,
								  Immed => Immed_signal,
								  RF_A => RF_A_signal,
								  RF_B => RF_B_signal);

Pipeline1 : DEC_EX port map(WE => '1',
									 Clk => Clk,
									 --apo to decode--									 
									 RF_A => RF_A_signal,
									 RF_B => RF_B_signal,
									 Immed => Immed_signal,
									 --apo ti memory--
									 Instruction => Instruction_signal,
									 --apo to control--
									 ALU_Func => ALU_Func_signal,
									 data_WrEn => data_WrEn_signal,
									 WrData_sel => RF_WrData_sel_signal,
									 RF_WrEn => RF_WrEn_signal,

									 RF_A_out => RF_A_out_signal,
									 RF_B_out => RF_B_out_signal,
									 Immed_out => Immed_out_signal,
									 Instruction_out => Instruction_out_signal,
									 ALU_Func_out => ALU_Func_out_signal,
									 data_WrEn_out => data_WrEn_out_signal,
									 WrData_sel_out => WrData_sel_out_signal,
									 RF_WrEn_out => RF_WrEn_out_signal);
									 
Execute : AluStage port map(RF_A => RF_A_out_signal,
									 RF_B => RF_B_out_signal,
									 Immed => Immed_out_signal,
									 EX_MEM => ALU_out_Memory_MEM_WB_signal,
									 MEM_WB => RF_data_din_signal,
									 ALU_Ain_Sel => ALU_Ain_sel_signal,
								    ALU_Bin_Sel => ALU_Bin_sel_signal,
									 ALU_func => ALU_Func_out_signal,
									 ALU_out => ALU_out_EX_MEM_signal);
									 
Pipeline2 : EX_MEM port map(Clk => Clk,
									 WE => '1',
									 ALU_out => ALU_out_EX_MEM_signal,
									 Instruction => Instruction_out_signal,
									 RF_WrEn => RF_WrEn_out_signal,
									 RF_B => RF_B_out_signal,
									 data_WrEn => data_WrEn_out_signal,
									 WrData_sel => WrData_sel_out_signal,
									 
									 ALU_out_out => ALU_out_Memory_MEM_WB_signal,
									 Instruction_out => Instruction_out_MEM_WB_signal,
									 RF_WrEn_out => RF_WrEn_MEM_WB_signal,
									 RF_B_out => RF_B_Memory_signal,
									 data_WrEn_out => data_WrEn_out_signal_final,
									 WrData_sel_out => WrData_sel_MEM_WB_signal);
									 
MemStageFinal : MemStage port map(ALU_MEM_addr => ALU_out_Memory_MEM_WB_signal,
											 Output => data_addr_signal);
											 
Pipeline3 : MEM_WB port map(Clk => Clk,
									 WE => '1',
									 RF_WrEn => RF_WrEn_MEM_WB_signal,
									 ALU_out => ALU_out_Memory_MEM_WB_signal,
									 Instruction => Instruction_out_MEM_WB_signal,
									 WrData_sel => WrData_sel_MEM_WB_signal,
									 RF_WrEn_out => RF_WrEn_final,
									 ALU_out_out => WB_in_b,
									 Instruction_out => Instruction_stall,
									 WrData_sel_out => WrData_sel_out_final);
									 
WriteBack : Mux2x1_32 port map(A => mem_data_out_signal,
										 B => WB_in_b,
										 sel => WrData_sel_out_final,
										 Output => RF_data_din_signal);
										 
Forward : ForwardUnit port map(InstrDec_Ex => Instruction_out_signal,
										 InstrEx_Mem => Instruction_out_MEM_WB_signal,
										 InstrMem_Wb => Instruction_stall,
										 Rf_Wr_EnEx_Mem => RF_WrEn_MEM_WB_signal,
										 Rf_Wr_EnMem_Wb => RF_WrEn_final,
										 Alu_Ain_sel => ALU_Ain_sel_signal,
										 Alu_Bin_sel => ALU_Bin_sel_signal);
										 
Mpinia : Stall port map(InstrDec_Ex => Instruction_signal,
								InstrEx_Mem => Instruction_out_signal,
								Reset => Reset,
								PC_sel => PC_sel_signal,
								PC_LdEn => PC_LdEn_signal);
								
Output <= RF_WrEn_signal;

end Behavioral;

