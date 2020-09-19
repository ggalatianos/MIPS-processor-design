----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:45:57 05/21/2018 
-- Design Name: 
-- Module Name:    Minus4 - Behavioral 
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
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Minus4 is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Output1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Output2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Minus4;

architecture Behavioral of Minus4 is

begin

Output1 <= Input-"00000000000000000000000000000100";
Output2 <= Input-"00000000000000000000000000001000";

end Behavioral;

