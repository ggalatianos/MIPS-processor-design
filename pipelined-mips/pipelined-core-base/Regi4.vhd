----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:38 05/04/2018 
-- Design Name: 
-- Module Name:    Regi4 - Behavioral 
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

entity Regi4 is
    Port ( WE : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (3 downto 0);
           Dout : out  STD_LOGIC_VECTOR (3 downto 0));
end Regi4;

architecture Behavioral of Regi4 is

signal tmp : std_logic_vector(3 downto 0) := (others => '0');

begin

Process(Clk)
begin
      if (Clk'EVENT AND Clk='1') THEN 
		    if(WE='1') then
		       tmp <= Data;
			 else
			    tmp <= tmp;
		    end if;  
		end if;  
end process;  

Dout <= tmp;
end Behavioral;

