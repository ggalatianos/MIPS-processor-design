----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:45:15 03/05/2018 
-- Design Name: 
-- Module Name:    Compare - Behavioral 
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

entity Compare is
    Port ( cArd : in  STD_LOGIC_VECTOR (4 downto 0);
           cAwr : in  STD_LOGIC_VECTOR (4 downto 0);
           cOut : out  STD_LOGIC);
end Compare;

architecture Behavioral of Compare is

signal supp : std_logic;

begin 

supp <= '1' when(cArd=cAwr) else '0';

with supp select 

cOut <= '1' when '1',
        '0' when others;

end Behavioral;

