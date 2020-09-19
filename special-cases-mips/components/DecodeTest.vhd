--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:04:09 03/13/2018
-- Design Name:   
-- Module Name:   C:/Users/Galatis/Documents/Organwsi/Lab2/DecodeTest.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECODE
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
 
ENTITY DecodeTest IS
END DecodeTest;
 
ARCHITECTURE behavior OF DecodeTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECODE
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         Clk : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECODE PORT MAP (
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          Clk => Clk,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
   
   --R-type    
	Instr <= "10000000101001000100000000110010";--"100000 00101 00100 01000 00000 110010"
   RF_WrEn <= '1';
   ALU_out <= "00000000000000000000000000000001"; 
   MEM_out <= "00000000000000000000000000000111";
   RF_WrData_sel <= '0';
   RF_B_sel <= '0';
   wait for Clk_period;
	
	Instr <=   "10000000100001011111100000110000";--"100000 00100 00101 11111 00000 110000"
   RF_WrEn <= '1';
   ALU_out <= "00000000000000000000000000000001"; 
   MEM_out <= "00000000000000000000000000000111";
   RF_WrData_sel <= '1';
   RF_B_sel <= '0';
   wait for Clk_period;
	
	Instr <=   "10000000100111001111100000110000";--"100000 00100 11100 11111 00000 110000"
   RF_WrEn <= '1';
   ALU_out <= "00000000000000000000000000000001"; 
   MEM_out <= "00000000000000000000000000000111";
   RF_WrData_sel <= '1';
   RF_B_sel <= '0';
   wait for Clk_period;
	
	--I-type
	Instr <=   "11100000101001001000000000110010";--"111000 00101 00100 0000000000110010"
   RF_WrEn <= '1';
   ALU_out <= "00000000000000000000000000000001"; 
   MEM_out <= "00000000000000000000000000000111";
   RF_WrData_sel <= '0';
   RF_B_sel <= '1';
   wait for Clk_period;
	
	Instr <=   "11001011100000011111100000110000";--"110010 11100 00001 1111100000110000"
   RF_WrEn <= '1';
   ALU_out <= "00000000000000000000000000000001"; 
   MEM_out <= "00000000000000000000000000000111";
   RF_WrData_sel <= '1';
   RF_B_sel <= '1';
   wait for Clk_period;
	
	
      -- insert stimulus here 

      wait;
   end process;

END;
