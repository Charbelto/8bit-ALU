library IEEE;
use IEEE.std_logic_1164.all;

entity alu_test is 
end alu_test;

architecture arch of alu_test is

component alu
port (A,B: in std_logic_vector(1 to 8);
		C: in std_logic_vector(1 to 4);
        result: out std_logic_vector(1 to 8);
        cout : out std_logic);
end component;

signal A: std_logic_vector(1 to 8):= "00000000";
signal B: std_logic_vector(1 to 8):= "11111110";
signal C: std_logic_vector(1 to 4):= "0001";
signal result: std_logic_vector(1 to 8);
signal cout : std_logic;

begin 

aluutt: alu port map (A,B,C,result,cout);

proc: process
begin 

a<= "00000000";
b<= "11111110";
c<= "0001";
wait for 10 ns;
a<= "00110010";
b<= "00110010";
wait for 10 ns;
a<= "00110010";
b<= "01001011";
wait for 10 ns;
a<= "11001110";
b<= "10110101";
wait for 10 ns;
a<= "01100100";
b<= "10011100";
wait for 10 ns;
a<= "00000000";
b<= "11111110";
c<= "0010";
wait for 10 ns;
a<= "00110010";
b<= "00110010";
wait for 10 ns;
a<= "00110010";
b<= "01001011";
wait for 10 ns;
a<= "11001110";
b<= "10110101";
wait for 10 ns;
a<= "01100100";
b<= "10011100";
wait for 10 ns;
a<= "00000000";
b<= "11111110";
c<= "0011";
wait for 10 ns;
a<= "00110010";
b<= "00110010";
wait for 10 ns;
a<= "00110010";
b<= "01001011";
wait for 10 ns;
a<= "11001110";
b<= "10110101";
wait for 10 ns;
a<= "01100100";
b<= "10011100";
wait for 10 ns;
a<= "00000000";
b<= "11111110";
c<= "0100";
wait for 10 ns;
a<= "00110010";
b<= "00110010";
wait for 10 ns;
a<= "00110010";
b<= "01001011";
wait for 10 ns;
a<= "11001110";
b<= "10110101";
wait for 10 ns;
a<= "01100100";
b<= "10011100";
wait for 10 ns;
a<= "00000000";
b<= "11111110";
c<= "0101";
wait for 10 ns;
a<= "00110010";
b<= "00110010";
wait for 10 ns;
a<= "00110010";
b<= "01001011";
wait for 10 ns;
a<= "11001110";
b<= "10110101";
wait for 10 ns;
a<= "01100100";
b<= "10011100";
wait for 10 ns;
a<= "00000000";
b<= "11111110";
c<= "0110";
wait for 10 ns;
a<= "00110010";
b<= "00110010";
wait for 10 ns;
a<= "00110010";
b<= "01001011";
wait for 10 ns;
a<= "11001110";
b<= "10110101";
wait for 10 ns;
a<= "01100100";
b<= "10011100";

wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
c<= "0111";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
c<= "1000";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
c<= "1001";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";

wait for 10 ns;

a<= "11001101";
b<= "XXXXXXXX";
c<= "1010";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
c<= "1011";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";

wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
c<= "1100";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "11001101";
b<= "XXXXXXXX";
wait for 10 ns;
a<= "01010101";
b<= "XXXXXXXX";
wait for 10 ns;

wait ;
end process;
end arch;
