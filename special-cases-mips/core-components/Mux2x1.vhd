----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:52:39 03/05/2018 
-- Design Name: 
-- Module Name:    Mux2x1 - Behavioral 
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

entity Mux2x1 is
    Port ( mDin : in  STD_LOGIC_VECTOR (31 downto 0);
           mMux : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           mOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux2x1;

architecture Behavioral of Mux2x1 is

begin

mOut <= mMux when sel = '0' else
        mDin;

end Behavioral;

