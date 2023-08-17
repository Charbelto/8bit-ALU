-- task 1
library IEEE;
use IEEE.std_logic_1164.all;

entity FA is
   port (x, y, Cin : in std_logic;
               S, Cout : out std_logic );
end FA;

architecture dataflow1 of FA is
begin
     S  <= (X XOR Y) XOR Cin ;

        Cout <= (X AND Y) OR (X AND CIN) OR (Y AND Cin);

end dataflow1;


-- as per the prof's words the 2's complement adder is the same as the regular 8 bit adder except it doesn't have cin input

library IEEE;
use IEEE.std_logic_1164.all;

entity complementAdder is
   port (X : in std_logic_vector(1 to 8);
		Y : in std_logic_vector(1 to 8);
		S : out std_logic_vector(1 to 8);
		Cout : out std_logic);
End complementAdder;


Architecture complementAdder of complementAdder is
component FA  port (x, y,cin : in std_logic;    S, Cout : out std_logic );
end component;
Signal Z: std_logic_vector (1 to 9);
Begin
    g1: for b in 8 downto 1  generate
              U1: FA port map ( X(b) , Y(b), Z(b+1), S(b), Z(b));
          end generate;
   Z(9)   <= '0';
   Cout  <= Z(1);
End complementAdder;

--task 2

library IEEE;
use IEEE.std_logic_1164.all;
entity incrementA is
port (A: in std_logic_vector(1 to 8);
		B:  out std_logic_vector(1 to 8));
end incrementA;

architecture incrementA_structural of incrementA is
component complementAdder 
   port (X : in std_logic_vector(1 to 8);
		Y : in std_logic_vector(1 to 8);
		S : out std_logic_vector(1 to 8);
		Cout : out std_logic);
end component;
signal incrementer : std_logic_vector(1 to 8);
signal cout : std_logic;
begin 
	incrementer <= "00000001";
	u1: complementAdder port map (A,incrementer,B,cout);
    --the cout is useless we just need it in order to call the prev entity, in case of overflow the number gets reseted that is if A = 11111111 we incremenet A to become 0000000
end incrementA_structural;

-- task 3



library IEEE;
use IEEE.std_logic_1164.all;

entity twos_complement is
port(A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
end twos_complement;

architecture twos_complement_arch of twos_complement is
begin 
	process(A)
    	variable first : integer;
    begin
    first := 0;
    B<=A;
    g1: for i in 1 to 8 loop
          if A(i) = '1' then first := i; -- locating the first one afterwhich we start flipping 1s and 0s to produce the two's complement
          end if;
	end loop;
    
    g2: for j in 1 to (first-1) loop
          if A(j) = '1' then
              B(j) <= '0';
          else
              B(j) <= '1';
          end if;
        end loop;
    end process;
end twos_complement_arch;
    
	
    		

library IEEE;
use IEEE.std_logic_1164.all;


entity complementSubstractor is

port(X,Y: in std_logic_vector(1 to 8);
	S: out std_logic_vector(1 to 8);
    cout : out std_logic);
    
end complementSubstractor;


Architecture complementSubstractor_arch of complementSubstractor is

component complementAdder
   port (X : in std_logic_vector(1 to 8);
		Y : in std_logic_vector(1 to 8);
		S : out std_logic_vector(1 to 8);
		Cout : out std_logic);
end component;

component twos_complement
	port(A: in std_logic_vector(1 to 8);
    	B: out std_logic_vector(1 to 8));
end component;

signal complement: std_logic_vector(1 to 8);
-- To substract B from A, it is equivalent to adding B's twos complement to A
begin 
	U1: twos_complement port map (Y,complement);
    U2: complementAdder port map (X,complement,S,cout);
end complementSubstractor_arch; 
	
    
-- task 4


library IEEE;
use IEEE.std_logic_1164.all;

entity decrementA is 

port (A: in std_logic_vector(1 to 8);
		B: out std_logic_vector(1 to 8));
        
end decrementA;


architecture decrementA_arch of decrementA is
component complementSubstractor
port(X,Y: in std_logic_vector(1 to 8);
	S: out std_logic_vector(1 to 8);
    cout : out std_logic);
end component;

signal decrementer: std_logic_vector(1 to 8):= "00000001";
signal cout: std_logic;
begin
	U1: complementSubstractor port map(A,decrementer,B,cout);
end decrementA_arch;



-- task 5 minimum A and B 

library IEEE;
use IEEE.std_logic_1164.all;
entity minimum is 

port(A,B: in std_logic_vector(1 to 8);
	C: out std_logic_vector(1 to 8));

end minimum;


architecture minimum_arch of minimum is 
begin 
	process(A,B)
    begin
    C<= A;
    if A(1) ='1' and B (1)= '0' then 
    	C <= A;
        
    elsif A(1) = '0' and B(1) = '1' then 
    C <= B;
    else -- whether the numbers are both positives or both negatives the one with the most significant one that is not present in the second vector is the biggest number.
    	g1 : for i in 2 to 8 loop
              if (A(i) = '1' and B(i) = '0') then 
              C <= B;
            	exit; -- minimum, not in absolute value
            elsif (A(i) = '0' and B(i) = '1') then
              C<=A;
              exit;
            end if;
         end loop;
     end if;
	end process;
end minimum_arch;
         
	

-- task 6


        
library IEEE;
use IEEE.std_logic_1164.all;
entity maximum is 

port(A,B: in std_logic_vector(1 to 8);
	C: out std_logic_vector(1 to 8));

end maximum;


architecture maximum_arch of maximum is 
begin 
	process(A,B)
    begin
    C<= A;
    if A(1) ='1' and B (1) = '0' then 
    	C <= B;
        
    elsif A(1) = '0' and B(1) = '1' then 
    C <= A;
    else
    	g1 : for i in 2 to 8 loop
              if (A(i) = '1' and B(i) = '0') then 
              C <= A;
            	exit; -- maximum, not in absolute value
            	elsif (A(i) = '0' and B(i) = '1') then
              C<=B;
              exit;
            end if;
         end loop;
     end if;
	end process;
end maximum_arch;

-- task 7
        
library IEEE;
use IEEE.std_logic_1164.all;

entity circular_right_shift is

port (A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));

end circular_right_shift;
    
architecture circular_right_arch of circular_right_shift is 
begin 
	B(1) <= A(8);
	g1: for i in 1 to 7 generate
    	B(i+1) <= A(i);
        end generate;

end circular_right_arch;



-- task 8

library IEEE;
use IEEE.std_logic_1164.all;

entity circular_left_shift is

port (A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));

end circular_left_shift;
    
architecture circular_left_arch of circular_left_shift is 
begin 
	B(8) <= A(1);
	g1: for i in 2 to 8 generate
    	B(i-1) <= A(i);
        end generate;

end circular_left_arch;

-- task 9
library IEEE;
use IEEE.std_logic_1164.all;
entity circular_right_shift_feed is 

port(A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
    
end circular_right_shift_feed;

architecture arch of circular_right_shift_feed is
begin 
	B(1) <= '0';
    g1: for i in 2 to 8 generate
    	B(i) <= A(i-1);
	end generate;
end arch;
    
-- task 10

library IEEE;
use IEEE.std_logic_1164.all;
entity circular_left_shift_feed is 

port(A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
    
end circular_left_shift_feed;

architecture arch of circular_left_shift_feed is
begin 
	B(8) <= '0';
    g1: for i in 2 to 8 generate
    	B(i-1) <= A(i);
	end generate;
end arch;

-- task 11

library IEEE;
use IEEE.std_logic_1164.all;
entity right_replication is
port (A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
end right_replication;

architecture right_replication_arch of right_replication is

begin 
    B(1) <= A(1);
    g1: for i in 2 to 8 generate
    	B(i) <= A(i-1);
	end generate;
end right_replication_arch;

-- task 12 

library IEEE;
use IEEE.std_logic_1164.all;
entity left_replication is
port (A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
end left_replication;

architecture left_replication_arch of left_replication is
begin 
    B(8) <= A(8);
    g1: for i in 2 to 8 generate
    	B(i-1) <= A(i);
	end generate;
    
end left_replication_arch;



-- ALU ARITHMETIC UNIT



library IEEE;
use IEEE.std_logic_1164.all;

entity alu is
port (A,B: in std_logic_vector(1 to 8);
		C: in std_logic_vector(1 to 4);
        result: out std_logic_vector(1 to 8);
        cout : out std_logic);
        
end alu;


architecture alu_arch of alu is

component complementAdder
   port (X : in std_logic_vector(1 to 8);
		Y : in std_logic_vector(1 to 8);
		S : out std_logic_vector(1 to 8);
		Cout : out std_logic);
end component;

component incrementA
port (A: in std_logic_vector(1 to 8);
		B:  out std_logic_vector(1 to 8));
end component;

component complementSubstractor
port(X,Y: in std_logic_vector(1 to 8);
	S: out std_logic_vector(1 to 8);
    cout : out std_logic);
end component;

component decrementA
port (A: in std_logic_vector(1 to 8);
		B: out std_logic_vector(1 to 8));
end component;

component minimum
port(A,B: in std_logic_vector(1 to 8);
	C: out std_logic_vector(1 to 8));
end component;

component maximum 
port(A,B: in std_logic_vector(1 to 8);
	C: out std_logic_vector(1 to 8));
end component;

component circular_right_shift
port (A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
end component;

component circular_left_shift
port (A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
end component;

component circular_right_shift_feed
port(A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
end component;

component circular_left_shift_feed
port(A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
end component;

component right_replication
port (A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
end component;

component left_replication
port(A: in std_logic_vector(1 to 8);
	B: out std_logic_vector(1 to 8));
end component;



signal result1 : std_logic_vector(1 to 8);
signal result2 : std_logic_vector(1 to 8);
signal result3 : std_logic_vector(1 to 8);
signal result4 : std_logic_vector(1 to 8);
signal result5 : std_logic_vector(1 to 8);
signal result6 : std_logic_vector(1 to 8);
signal result7 : std_logic_vector(1 to 8);
signal result8 : std_logic_vector(1 to 8);
signal result9 : std_logic_vector(1 to 8);
signal result10 : std_logic_vector(1 to 8);
signal result11 : std_logic_vector(1 to 8);
signal result12 : std_logic_vector(1 to 8);

signal cout1: std_logic;
signal cout3: std_logic;


begin 
	
    
    	U1:complementAdder port map(A,B,result1,cout1);
        U2:incrementA port map(A,result2);
        U3:complementSubstractor port map(A,B,result3,cout3);
        U4:decrementA port map (A,result4);
        U5: minimum port map(A,B,result5);
        U6: maximum port map(A,B,result6);
        U7: circular_right_shift port map(A,result7);
        U8: circular_left_shift port map (A,result8);
        U9: circular_right_shift_feed port map (A,result9);
        U10: circular_left_shift_feed port map (A,result10);
        U11: right_replication port map (A,result11);
       	U12: left_replication port map (A,result12);


    	proc: process (A,B,C,result1,result2,result3,result4,result5,result6,result7,result8,result9,result10,result11)
        begin
            case C is
                when "0001" => result <= result1;
                when "0010" => result <= result2;
                when "0011" => result <= result3;
                when "0100" => result <= result4;
                when "0101" => result <= result5;
                when "0110" => result <= result6;
                when "0111" => result <= result7;
                when "1000" => result <= result8;
                when "1001" => result <= result9;
                when "1010" => result <= result10;
                when "1011" => result <= result11;
              	when "1100" => result <= result12;
                when others => result <="XXXXXXXX";
            end case;
        case C is 
        	when "0001" => cout <= cout1;
            when "0011" => cout <= cout3;
            when others => cout <='0';
		end case;

        
	end process;
    
end alu_arch;
