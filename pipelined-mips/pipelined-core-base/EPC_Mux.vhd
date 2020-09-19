----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:23 05/21/2018 
-- Design Name: 
-- Module Name:    EPC_Mux - Behavioral 
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

entity EPC_Mux is
    Port ( PC_out : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end EPC_Mux;

architecture Behavioral of EPC_Mux is

begin

Output <= PC_out-4 when sel = '0' else
			 PC_out-8;

end Behavioral;

