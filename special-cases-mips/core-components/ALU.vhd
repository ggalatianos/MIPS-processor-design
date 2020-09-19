----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:39 03/03/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Zero : out  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Ovf : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

signal tmp1: std_logic_vector (31 downto 0);
signal tmp: std_logic_vector (32 downto 0);


begin
					 
	with Op select				 
	tmp1 <= A nand B                            when "0010",
			  A or B                              when "0011", 
			  not A                               when "0100",
			  A(31) & A(31 downto 1)              when "1000",
			  std_logic_vector(unsigned(A) sll 1) when "1001",
			  std_logic_vector(unsigned(A) srl 1) when "1010",
			  std_logic_vector(unsigned(A) rol 1) when "1100", 
			  std_logic_vector(unsigned(A) ror 1) when "1101",  
			  "00000000000000000000000000000000"  when others;
			
			
	with Op select
	 
	tmp <=('0' & A) + ('0' & B)               when "0000",
		   ('0' & A) + ('1' & ((not B)+1))     when "0001",
		   '0' & tmp1 when others;
		  
	 with Op select 
        Cout <= tmp(32) when "0000",
		          tmp(32) when "0001",
					 '0' when others;
			  		  
Zero <= '1' when tmp(32 downto 1)=0 else
		  '0';

Ovf <= '1' when ((A(31)=B(31)) AND (B(31)/=tmp(31))) else
 	    '0' ;

Output <= tmp(31 downto 0);

end Behavioral;
          

