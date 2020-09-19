--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:55:42 03/05/2018
-- Design Name:   
-- Module Name:   C:/Users/Galatis/Documents/Organwsi/Lab1/aluTEST.vhd
-- Project Name:  Lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY aluTEST IS
END aluTEST;
 
ARCHITECTURE behavior OF aluTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Zero : OUT  std_logic;
         Output : OUT  std_logic_vector(31 downto 0);
         Ovf : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Zero : std_logic;
   signal Output : std_logic_vector(31 downto 0);
   signal Ovf : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Op => Op,
          Zero => Zero,
          Output => Output,
          Ovf => Ovf,
          Cout => Cout
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
      --wait for 50 ns;	

      -- wait for <clock>_period*10;

   	A <= "00000000000000000000000000000000";
		B <= "00000000000000000000000000000011";
		Op <= "0000";
		wait for 50 ns;
		
		A <= "00000000000000000001100000000000";
		B <= "00000000000000000000000000000011";
		Op <= "0000";
		wait for 50 ns;
		
		A <= "11111000000000011111100000000000";
		B <= "11111111111111111111000000000011";
		Op <= "0000";
		wait for 50 ns;
		
		A <= "10011001000000000000000000000000";
		B <= "10111011000000000000000000000000";
		Op <= "0000";
		wait for 50 ns;
		------------------ADD-------------------
		
		A <= "11111111111111111111111111111111";
		B <= "00000000000000000000000000000011";
		Op <= "0001";
		wait for 50 ns;
		
		A <= "11110000011111111111111111111111";
		B <= "00000000000000000000000000000011";
		Op <= "0001";
		wait for 50 ns;
		
		A <= "00000000011111111111111111111111";
		B <= "00000000000000000000000000000011";
		Op <= "0001";
		wait for 50 ns;
		--SUB
		
		A <= "11111111111111111111111111111111";
		B <= "00000000000000000000000000000011";
		Op <= "0010";
		wait for 50 ns;
		
		A <= "11111111111111111111111111111111";
		B <= "00000000000000000000000000000011";
		Op <= "0011";
		wait for 50 ns;
		
		A <= "11111111111111111111111111111111";
		B <= "00000000000000000000000000000011";
		Op <= "0100";
		wait for 50 ns;
		
		A <= "10101010101010101010101010101010";
		B <= "00000000000000000000000000000011";
		Op <= "1000";
		wait for 50 ns;
		
		A <= "10101010101010101010101010101010";
		B <= "00000000000000000000000000000011";
		Op <= "1001";
		wait for 50 ns;
		
		A <= "10101010101010101010101010101010";
		B <= "00000000000000000000000000000011";
		Op <= "1010";
		wait for 50 ns;
		
		A <= "10101010101010101010101010000000";
		B <= "00000000000000000000000000000011";
		Op <= "1100";
		wait for 50 ns;
		
		A <= "10101010101010101010101000000000";
		B <= "00000000000000000000000000000011";
		Op <= "1101";
		wait for 50 ns;

      wait;
   end process;

END;
