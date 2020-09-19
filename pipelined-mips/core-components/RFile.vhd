----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:19:30 03/05/2018 
-- Design Name: 
-- Module Name:    RFile - Behavioral 
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

entity RFile is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC);
end RFile;


architecture Structural of RFile is

component Compare is 
    Port ( cArd : in  STD_LOGIC_VECTOR (4 downto 0);
           cAwr : in  STD_LOGIC_VECTOR (4 downto 0);
           cOut : out  STD_LOGIC);
end component;

component decoder is 
    Port ( Dawr : in  STD_LOGIC_VECTOR (4 downto 0);
           DecOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Regi is 
    Port ( Clk : in  STD_LOGIC;
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC);
end component;

component Mux is 
    Port ( Sel : in  STD_LOGIC_VECTOR (4 downto 0);
           R0 : in  STD_LOGIC_VECTOR (31 downto 0);
           R1 : in  STD_LOGIC_VECTOR (31 downto 0);
           R2 : in  STD_LOGIC_VECTOR (31 downto 0);
           R3 : in  STD_LOGIC_VECTOR (31 downto 0);
           R4 : in  STD_LOGIC_VECTOR (31 downto 0);
           R5 : in  STD_LOGIC_VECTOR (31 downto 0);
           R6 : in  STD_LOGIC_VECTOR (31 downto 0);
           R7 : in  STD_LOGIC_VECTOR (31 downto 0);
           R8 : in  STD_LOGIC_VECTOR (31 downto 0);
           R9 : in  STD_LOGIC_VECTOR (31 downto 0);
           R10 : in  STD_LOGIC_VECTOR (31 downto 0);
           R11 : in  STD_LOGIC_VECTOR (31 downto 0);
           R12 : in  STD_LOGIC_VECTOR (31 downto 0);
           R13 : in  STD_LOGIC_VECTOR (31 downto 0);
           R14 : in  STD_LOGIC_VECTOR (31 downto 0);
           R15 : in  STD_LOGIC_VECTOR (31 downto 0);
           R16 : in  STD_LOGIC_VECTOR (31 downto 0);
           R17 : in  STD_LOGIC_VECTOR (31 downto 0);
           R18 : in  STD_LOGIC_VECTOR (31 downto 0);
           R19 : in  STD_LOGIC_VECTOR (31 downto 0);
           R20 : in  STD_LOGIC_VECTOR (31 downto 0);
           R21 : in  STD_LOGIC_VECTOR (31 downto 0);
           R22 : in  STD_LOGIC_VECTOR (31 downto 0);
           R23 : in  STD_LOGIC_VECTOR (31 downto 0);
           R24 : in  STD_LOGIC_VECTOR (31 downto 0);
           R25 : in  STD_LOGIC_VECTOR (31 downto 0);
           R26 : in  STD_LOGIC_VECTOR (31 downto 0);
           R27 : in  STD_LOGIC_VECTOR (31 downto 0);
           R28 : in  STD_LOGIC_VECTOR (31 downto 0);
           R29 : in  STD_LOGIC_VECTOR (31 downto 0);
           R30 : in  STD_LOGIC_VECTOR (31 downto 0);
           R31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Mout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux2x1 is 
    Port ( mDin : in  STD_LOGIC_VECTOR (31 downto 0);
           mMux : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           mOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal dectmp : std_logic_vector(31 downto 0);
signal reg0 : std_logic_vector(31 downto 0);
signal reg1 : std_logic_vector(31 downto 0);
signal reg2 : std_logic_vector(31 downto 0);
signal reg3 : std_logic_vector(31 downto 0);
signal reg4 : std_logic_vector(31 downto 0);
signal reg5 : std_logic_vector(31 downto 0);
signal reg6 : std_logic_vector(31 downto 0);
signal reg7 : std_logic_vector(31 downto 0);
signal reg8 : std_logic_vector(31 downto 0);
signal reg9 : std_logic_vector(31 downto 0);
signal reg10 : std_logic_vector(31 downto 0);
signal reg11 : std_logic_vector(31 downto 0);
signal reg12 : std_logic_vector(31 downto 0);
signal reg13 : std_logic_vector(31 downto 0);
signal reg14 : std_logic_vector(31 downto 0);
signal reg15 : std_logic_vector(31 downto 0);
signal reg16 : std_logic_vector(31 downto 0);
signal reg17 : std_logic_vector(31 downto 0);
signal reg18 : std_logic_vector(31 downto 0);
signal reg19 : std_logic_vector(31 downto 0);
signal reg20 : std_logic_vector(31 downto 0);
signal reg21 : std_logic_vector(31 downto 0);
signal reg22 : std_logic_vector(31 downto 0);
signal reg23 : std_logic_vector(31 downto 0);
signal reg24 : std_logic_vector(31 downto 0);
signal reg25 : std_logic_vector(31 downto 0);
signal reg26 : std_logic_vector(31 downto 0);
signal reg27 : std_logic_vector(31 downto 0);
signal reg28 : std_logic_vector(31 downto 0);
signal reg29 : std_logic_vector(31 downto 0);
signal reg30 : std_logic_vector(31 downto 0);
signal reg31 : std_logic_vector(31 downto 0);
signal write_enable : std_logic_vector(31 downto 0);
signal MuxToMux1 : std_logic_vector(31 downto 0);
signal MuxToMux2 : std_logic_vector(31 downto 0);
signal compSig1 :  STD_LOGIC;
signal compSig2 :  STD_LOGIC;

begin

  decode : Decoder Port map ( Dawr => Awr,
                              DecOut => dectmp );
										
  Reg_0 : Regi Port map ( Clk => Clk,
                         Data => "00000000000000000000000000000000",
								 WE => '1',
								 Dout => reg0);

  register_generation :
  for i in 1 to 31 generate
     write_enable(i) <= WrEn AND dectmp(i);
	  end generate;
	  
	  
	Reg_1 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(1),
								  Dout => reg1);
								  
	Reg_2 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(2),
								  Dout => reg2);							  
								  
	Reg_3 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(3),
								  Dout => reg3);							  										
 
   Reg_4 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(4),
								  Dout => reg4);   
   
   Reg_5 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(5),
								  Dout => reg5);	
								  
	Reg_6 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(6),
								  Dout => reg6);	

	Reg_7 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(7),
								  Dout => reg7);	

   Reg_8 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(8),
								  Dout => reg8);

   Reg_9 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(9),
								  Dout => reg9);
								  
   Reg_10 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(10),
								   Dout => reg10);
								  						  
	Reg_11 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(11),
								   Dout => reg11);							  
								  
	Reg_12 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(12),
								   Dout => reg12);							  

   Reg_13 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(13),
								   Dout => reg13);

   Reg_14 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(14),
								   Dout => reg14);
								  
	Reg_15 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(15),
								   Dout => reg15);	

	Reg_16 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(16),
								   Dout => reg16);	
								  
   Reg_17 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(17),
								   Dout => reg17);
								  
	Reg_18 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(18),
								   Dout => reg18);	
  
   Reg_19 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(19),
								   Dout => reg19);
								  
	Reg_20 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(20),
								   Dout => reg20);		

   Reg_21 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(21),
								   Dout => reg21); 								  
	
   Reg_22 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(22),
								   Dout => reg22);	
									
	Reg_23 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(23),
								   Dout => reg23);
									
	Reg_24 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(24),
								   Dout => reg24);		
	
	Reg_25 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(25),
							 	  Dout => reg25);
								  
	Reg_26 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(26),
								   Dout => reg26);
										
	Reg_27 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(27),
								   Dout => reg27);	

   Reg_28 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(28),
								   Dout => reg28);	

   Reg_29 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(29),
								   Dout => reg29);

   Reg_30 : Regi Port map ( Clk => Clk,
	                        Data => Din,
								   WE => write_enable(30),
								   Dout => reg30);

   Reg_31 : Regi Port map ( Clk => Clk,
	                       Data => Din,
								  WE => write_enable(31),
								  Dout => reg31);
								  
   Mux32_1 : Mux Port map( Sel => Ard1,
									R0 => reg0,
									R1 => reg1,
									R2 => reg2,
									R3 => reg3,
									R4 => reg4,
									R5 => reg5,
									R6 => reg6,
									R7 => reg7,
									R8 => reg8,
									R9 => reg9,
									R10 => reg10,
									R11 => reg11,
									R12 => reg12,
									R13 => reg13,
									R14 => reg14,
									R15 => reg15,
									R16 => reg16,
									R17 => reg17,
									R18 => reg18,
									R19 => reg19,
									R20 => reg20,
									R21 => reg21,
									R22 => reg22,
									R23 => reg23,
									R24 => reg24,
									R25 => reg25,
									R26 => reg26,
									R27 => reg27,
									R28 => reg28,
									R29 => reg29,
									R30 => reg30,
									R31 => reg31,
									Mout => MuxToMux1);
									
	Mux32_2 : Mux Port map( Sel => Ard2,
									R0 => reg0,
									R1 => reg1,
									R2 => reg2,
									R3 => reg3,
									R4 => reg4,
									R5 => reg5,
									R6 => reg6,
									R7 => reg7,
									R8 => reg8,
									R9 => reg9,
									R10 => reg10,
									R11 => reg11,
									R12 => reg12,
									R13 => reg13,
									R14 => reg14,
									R15 => reg15,
									R16 => reg16,
									R17 => reg17,
									R18 => reg18,
									R19 => reg19,
									R20 => reg20,
									R21 => reg21,
									R22 => reg22,
									R23 => reg23,
									R24 => reg24,
									R25 => reg25,
									R26 => reg26,
									R27 => reg27,
									R28 => reg28,
									R29 => reg29,
									R30 => reg30,
									R31 => reg31,
									Mout => MuxToMux2);
									
	ComparePart1 : Compare Port map( cArd => Ard1,
												cAwr => Awr,
												cOut => compSig1);
												
	ComparePart2 : Compare Port map( cArd => Ard2,
												cAwr => Awr,
												cOut => compSig2);
												
	FinalMux1 : Mux2x1 Port map( mDin => Din,
										  mMux => MuxtoMux1,
										  sel => compSig1,
										  mOut => Dout1);
										 
	FinalMux2 : Mux2x1 Port map( mDin => Din,
										  mMux => MuxtoMux2,
										  sel => compSig2,
										  mOut => Dout2);
   								  
end Structural;

