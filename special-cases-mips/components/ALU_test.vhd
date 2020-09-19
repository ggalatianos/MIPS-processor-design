--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:33:25 03/13/2018
-- Design Name:   
-- Module Name:   C:/Users/Galatis/Documents/Organwsi/Lab2/ALU_test.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AluStage
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
 
ENTITY ALU_test IS
END ALU_test;
 
ARCHITECTURE behavior OF ALU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AluStage
    PORT(
         RF_A : IN  std_logic_vector(31 downto 0);
         RF_B : IN  std_logic_vector(31 downto 0);
         Immed : IN  std_logic_vector(31 downto 0);
         ALU_Bin_Sel : IN  std_logic;
         ALU_func : IN  std_logic_vector(3 downto 0);
         ALU_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RF_A : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_B : std_logic_vector(31 downto 0) := (others => '0');
   signal Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Bin_Sel : std_logic := '0';
   signal ALU_func : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AluStage PORT MAP (
          RF_A => RF_A,
          RF_B => RF_B,
          Immed => Immed,
          ALU_Bin_Sel => ALU_Bin_Sel,
          ALU_func => ALU_func,
          ALU_out => ALU_out
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		--add A+B
		RF_A <= "00000000000000000000000000000111";
      RF_B <= "00000000000000000000000000001001";
      Immed <= "00000000000000000000000000000101";
      ALU_Bin_Sel <= '0';
      ALU_func <= "0000";
		
		wait for 100 ns;
		
		--add A+Immed
		RF_A <= "00000000000000000000000000000111";
      RF_B <= "00000000000000000000000000001001";
      Immed <= "00000000000000000000000000000101";
      ALU_Bin_Sel <= '1';
      ALU_func <= "0000";
		
		wait for 100 ns;
		
		--sub A-B
		RF_A <= "00000000000000000000000000010111";
      RF_B <= "00000000000000000000000000001001";
      Immed <= "00000000000000000000000000000101";
      ALU_Bin_Sel <= '0';
      ALU_func <= "0001";
		
		wait for 100 ns;
		
		--sub A-Immed
		RF_A <= "00000000000000000000000000000111";
      RF_B <= "00000000000000000000000000001001";
      Immed <= "00000000000000000000000000000001";
      ALU_Bin_Sel <= '1';
      ALU_func <= "0001";
		
		wait for 100 ns;
		
		--shift left logical
		RF_A <= "00000000000000000000000111000000";
      RF_B <= "00000000000000000000000000001001";
      Immed <= "00000000000000000000000000000101";
      ALU_Bin_Sel <= '0';
      ALU_func <= "1001";
		
		wait for 100 ns;
		
      -- insert stimulus here 

      wait;
   end process;

END;
