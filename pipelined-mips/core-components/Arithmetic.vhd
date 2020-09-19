----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:32:18 03/06/2018 
-- Design Name: 
-- Module Name:    Arithmetic - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Arithmetic is
    Port ( Op : in  STD_LOGIC_VECTOR (3 downto 0);
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC);
end Arithmetic;

architecture Behavioral of Arithmetic is

signal tmp: std_logic_vector (32 downto 0);

begin

with Op select
	 
	tmp<=('0' & A) + ('0' & B)               when "0000",
		  ('1' & A) + ('1' & ((not B)+1))     when "0001",
		  "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;
		  
	Sum <= tmp(31 downto 0);
		  
	Cout <= tmp(32);


end Behavioral;

