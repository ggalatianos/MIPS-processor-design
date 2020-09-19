----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:52 03/11/2018 
-- Design Name: 
-- Module Name:    Extension - Behavioral 
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

entity Extension is
    Port ( Op : in  STD_LOGIC_VECTOR (5 downto 0);
           Instr : in  STD_LOGIC_VECTOR (15 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Extension;

architecture Behavioral of Extension is

signal extend : std_logic_vector (31 downto 0);

begin
process(Instr,Op)
begin
	if(Op="110010" OR Op="110011") then --Filling with zero's
		extend(31 downto 16) <= (others => '0');
		extend(15 downto 0) <= Instr; 
	elsif(Op="111001") then --Shift left 16 and Zero filling
		extend(31 downto 16) <= Instr;
		extend(15 downto 0) <= (others => '0'); 
	elsif(Op="111000" OR Op="110000" OR Op="000011" OR Op="000111" OR Op="001111" OR Op="011111") then --sign extend
		extend(31 downto 16) <= (others => Instr(15));
		extend(15 downto 0) <= Instr; 
	elsif(Op="000000" OR Op="000001" OR Op="111111") then 
		extend(31 downto 18) <= (others => Instr(15)); --sign extend
		extend(17 downto 2) <= Instr; 
		extend(1 downto 0) <= "00"; -- shift left 2
	end if;
end process;
	Output <= extend; -- Immed 32 bits

end Behavioral;

