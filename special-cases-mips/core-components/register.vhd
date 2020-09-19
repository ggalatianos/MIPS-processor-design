----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:38 03/03/2018 
-- Design Name: 
-- Module Name:    register - Behavioral 
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

entity register is
    Port ( Clk : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC);
end register;

architecture Behavioral of register is

signal tmp: std_logic_vector(31 downto 0);

begin

Process(Clk)

begin
      if (if (CLK'EVENT AND Clk='1') THEN 
		    if(we='1') then 
		       tmp<= DATA; 
		    ELSE  
		       tmp <= tmp;  
		    end if;  
		end IF;  
end process;  

Dout <=tmp;  

end Behavioral;

architecture Behavioral of register is

signal tmp: std_logic_vector(31 downto 0);

begin

Process(Clk)

begin
      if (if (CLK'EVENT AND Clk='1') THEN 
		    if(we='1') then 
		       tmp<= DATA; 
		    ELSE  
		       tmp <= tmp;  
		    end if;  
		end IF;  
end process;  

Dout <=tmp;  

end Behavioral;

