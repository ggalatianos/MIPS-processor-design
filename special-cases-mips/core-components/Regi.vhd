----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:14 03/03/2018 
-- Design Name: 
-- Module Name:    Regi - Behavioral 
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

entity Regi is
    Port ( Clk : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC);
end Regi;

architecture Behavioral of Regi is

signal tmp : std_logic_vector(31 downto 0) := (others => '0');

begin

Process(Clk)
begin
      if (CLK'EVENT AND Clk='1') THEN 
		    if(we='1') then
		       tmp <= DATA;
			 else
			    tmp <= tmp;
		    end if;  
		end if;  
end process;  

Dout <= tmp;
end Behavioral;

