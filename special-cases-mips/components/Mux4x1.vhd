----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:21:52 04/20/2018 
-- Design Name: 
-- Module Name:    Mux4x1 - Behavioral 
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

entity Mux4x1 is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
			  C : in STD_LOGIC_VECTOR (31 downto 0);
			  D : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           Output : out STD_LOGIC_VECTOR (31 downto 0));
end Mux4x1;

architecture Behavioral of Mux4x1 is

begin

Output <= A when Sel = "00" else
			 B when Sel = "01" else
			 C when Sel = "10" else
			 D;

end Behavioral;

