----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:54:26 03/12/2018 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC);
end PC;

architecture Behavioral of PC is

signal tmp : std_logic_vector(31 downto 0):= (others => '0');

begin

process(Clk,Reset)
begin 
	if Reset = '1' then     
		tmp <= "00000000000000000000000000000000";
		
	elsif Clk'event and Clk = '1' then
		if PC_LdEn='1' then 
			tmp <= Input;
		else 
			tmp <= tmp;
		end if;
	end if;
end process;  

Output <= tmp;

end Behavioral;

