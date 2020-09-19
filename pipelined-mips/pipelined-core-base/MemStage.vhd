----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:32:29 03/13/2018 
-- Design Name: 
-- Module Name:    MemStage - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MemStage is
    Port (ALU_MEM_addr : in  STD_LOGIC_VECTOR (31 downto 0);
	       Output : out STD_LOGIC_VECTOR(10 downto 0));
end MemStage;

architecture Behavioral of MemStage is

signal tmp : std_logic_vector (31 downto 0);

begin

tmp <= ALU_MEM_Addr+4096;
Output <= tmp(12 downto 2);

end Behavioral;

