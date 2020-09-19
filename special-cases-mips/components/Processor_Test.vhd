--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:28:46 05/06/2018
-- Design Name:   
-- Module Name:   C:/Users/Galatis/Documents/Organwsi/1-2-3/lab5/Lab2/Processor_Test.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Processor
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
 
ENTITY Processor_Test IS
END Processor_Test;
 
ARCHITECTURE behavior OF Processor_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processor
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Output : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processor PORT MAP (
          Clk => Clk,
          Reset => Reset,
          Output => Output
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '1';
		wait for Clk_period/2;
		Clk <= '0';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='1';
      wait for 10 ns;	
				Reset<='0';
		wait for 10 ns;		

      -- wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
