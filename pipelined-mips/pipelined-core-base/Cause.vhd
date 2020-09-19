----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:38:40 05/21/2018 
-- Design Name: 
-- Module Name:    D_Flip_Flop - Behavioral 
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

entity D_Flip_Flop is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
			  WE : in STD_LOGIC;
			  Output : out STD_LOGIC_VECTOR (31 downto 0));
end D_Flip_Flop;

architecture Behavioral of D_Flip_Flop is

signal tmp : STD_LOGIC_VECTOR(31 downto 0);

begin

Process(Clk)
begin
      if (Clk'EVENT AND Clk='1') THEN 
		    if(we='1') then
		       tmp <= Input;
			 else
			    tmp <= tmp;
		    end if;  
		end if;  
end process;

Output <= tmp;

end Behavioral;

