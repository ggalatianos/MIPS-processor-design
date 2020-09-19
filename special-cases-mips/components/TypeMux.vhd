----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:31:47 03/11/2018 
-- Design Name: 
-- Module Name:    TypeMux - Behavioral 
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

entity TypeMux is
    Port ( IType : in  STD_LOGIC_VECTOR (4 downto 0);
           Rtype : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_B_sel : in  STD_LOGIC;
           Ard2 : out  STD_LOGIC_VECTOR (4 downto 0));
end TypeMux;

architecture Behavioral of TypeMux is

begin

Ard2 <= Rtype when RF_B_sel = '0' else
        IType;

end Behavioral;

