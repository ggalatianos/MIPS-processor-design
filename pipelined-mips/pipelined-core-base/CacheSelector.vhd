----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:26 05/22/2018 
-- Design Name: 
-- Module Name:    CacheSelector - Behavioral 
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

entity CacheSelector is
    Port ( Word : in  STD_LOGIC_VECTOR (31 downto 0);
           Tag : in  STD_LOGIC_VECTOR (2 downto 0);
			  Tag_ALU : in STD_LOGIC_VECTOR (2 downto 0);
           Valid : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end CacheSelector;

architecture Behavioral of CacheSelector is

signal tmp : STD_LOGIC_VECTOR (31 downto 0);

begin

process(Word,Tag,Tag_ALU,Valid)
begin
if((Tag /= Tag_ALU) OR (Valid = '0')) then
	tmp <= "00000000000000000000000000000000";
else
	tmp <= Word;
end if;
end process;

Output <= tmp;

end Behavioral;

