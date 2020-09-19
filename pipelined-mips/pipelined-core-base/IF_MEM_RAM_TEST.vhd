--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:29:16 03/13/2018
-- Design Name:   
-- Module Name:   C:/Users/Galatis/Documents/Organwsi/Lab2/IF_MEM_RAM_test.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MainMemory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY IF_MEM_RAM_test IS
END IF_MEM_RAM_test;
 
ARCHITECTURE behavior OF IF_MEM_RAM_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   COMPONENT MainMemory
   PORT(
			inst_addr : IN  std_logic_vector(10 downto 0);
         data_we : IN  std_logic;
         data_addr : IN  std_logic_vector(10 downto 0);
         data_din : IN  std_logic_vector(31 downto 0);
         data_dout : OUT  std_logic_vector(31 downto 0);
			inst_dout : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic
        );
   END COMPONENT;
	 
	COMPONENT IFSTAGE
	PORT( 
			PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
         PC_sel : in  STD_LOGIC;
         PC_LdEn : in  STD_LOGIC;
         Reset : in  STD_LOGIC;
         Clk : in  STD_LOGIC;
         Instr : out  STD_LOGIC_VECTOR (10 downto 0));
	END COMPONENT;
	
	Component MemStage is
   Port ( ALU_MEM_addr : in  STD_LOGIC_VECTOR (31 downto 0);
	       Output : out STD_LOGIC_VECTOR(10 downto 0));
	end Component;

	--CLOCK
	signal clk : std_logic := '1';

   --Inputs Ram
   signal inst_addr1 : std_logic_vector(10 downto 0) := (others => '0');
   signal data_we : std_logic := '0';
   signal data_addr : std_logic_vector(10 downto 0) := (others => '0');
   signal data_din : std_logic_vector(31 downto 0) := (others => '0');
   
	--Inputs IfSTage
	signal PC_Immed : std_logic_vector(31 downto 0) := (others => '0');
	signal PC_sel : std_logic := '0';
	signal PC_LdEn : std_logic := '0';
	signal Reset : std_logic := '0';
	
	--Inputs MemStage
	signal ALU_MEM_addr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal inst_dout : std_logic_vector(31 downto 0);
   signal data_dout : std_logic_vector(31 downto 0);
	

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   RAM : MainMemory PORT MAP ( inst_addr => inst_addr1,
										 inst_dout => inst_dout,
										 data_we => data_we,
										 data_addr => data_addr,
										 data_din => data_din,
										 data_dout => data_dout,
										 clk => clk);
		  
	if_stage : IFSTAGE PORT MAP( PC_Immed => PC_Immed,
										  PC_LdEn => PC_LdEn,
										  PC_sel => PC_sel,
										  clk => clk,
										  reset => reset,
										  Instr => inst_addr1);
										  
	mem_stage : MemStage PORT MAP( ALU_MEM_addr => ALU_MEM_addr,
											 Output => data_addr);

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for clk_period;	
		
		--Reset do not write
		Reset <= '1';
		PC_LdEn <= '1';
		PC_sel <= '0';
		PC_Immed <= "00000000000000000000000000000000";
		data_we <= '1';
		data_din <= "00000000000000000000000000000001";
		ALU_MEM_addr <= "00000000000000000000000000000100";
		wait for clk_period;
		
		--Move and do not write
		PC_LdEn <= '1';
		PC_sel <= '1';
		PC_Immed <= "00000000000000000000000000000101";
		Reset <= '0';
		data_we <= '0';
		data_din <= "00000000000000001111111111111111";
		ALU_MEM_addr <= "00000000000000000000000000000100";
      wait for clk_period;	
		
		PC_LdEn <= '1';
		PC_sel <= '1';
		PC_Immed <= "00000000000000000000000000000101";
		Reset <= '0';
		data_we <= '1';
		data_din <= "00000000000000001111111111111111";
		ALU_MEM_addr <= "00000000000000000000000000001000";
      wait for clk_period;	
		
		

		--PC moves by 4 and we write on RAM
		PC_LdEn <= '1';
		PC_sel <= '0';
		PC_Immed <= "00000000000000000000000000101110"; --46
		Reset <= '0';
		data_we <= '1';
		data_din <= "10101010101010101010101010101010";
		ALU_MEM_addr <= "00000000000000000000000001100100"; --25
		wait for clk_period;
		
		
		--PC does not move and we do not write in RAM
		PC_LdEn <= '0';
		PC_sel <= '1';
		PC_Immed <= "00000000000000000000000000101110";
		Reset <= '0';
		data_we <= '0';
		data_din <= "00000000000000000000000000101110";
		ALU_MEM_addr <= "00000000000000000000000001100100";
		wait for clk_period;
		
		
		--PC moves with Immediate and we do not write in RAM
		PC_LdEn <= '1';
		PC_sel <= '1';
		PC_Immed <= "00000000000000000000000000001000"; --8
		Reset <= '0';
		data_we <= '0';
		data_din <= "00000000000000000000000000001000";
		ALU_MEM_addr <= "00000000000000000000000000001000";
		wait for clk_period;
		
		
		--PC does not move and we write in RAM
		PC_LdEn <= '0';
		PC_sel <= '1';
		PC_Immed <= "00000000000000000000000000001000";
		Reset <= '0';
		data_we <= '1';
		data_din <= "00000000000000001111111111111111";
		ALU_MEM_addr <= "00000000000000000000000001101000"; --26
		wait for clk_period;
		
		
		--Reset do not write
		PC_LdEn <= '1';
		PC_sel <= '1';
		PC_Immed <= "00000000000000000000000000010011";
		Reset <= '1';
		data_we <= '0';
		data_din <= "00000000000000001111111111111111";
		ALU_MEM_addr <= "00000000000000000000000000001111";
		wait for clk_period;
		
		
		--PC moves by 4 and we do not write
		PC_LdEn <= '1';
		PC_sel <= '1';
		PC_Immed <= "00000000000000000000000000001111";
		Reset <= '1';
		data_we <= '0';
		data_din <= "00000000000000001111111111111111";
		ALU_MEM_addr <= "00000000000000000000000000111111";
--		
--		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
