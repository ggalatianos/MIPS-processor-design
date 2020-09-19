----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:10 05/04/2018 
-- Design Name: 
-- Module Name:    Regi1 - Behavioral 
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

entity Regi1 is
    Port ( WE : in  STD_LOGIC;
           Data : in  STD_LOGIC;
           Dout : out  STD_LOGIC;
           Clk : in  STD_LOGIC);
end Regi1;

architecture Behavioral of Regi1 is

signal tmp : std_logic := '0';

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

