library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity registrador is
	port ( 
		clk,enable,reset,set : std_logic;
		d : in std_logic_vector (7 downto 0);
		q : out std_logic_vector (7 downto 0)
  );
  
end registrador;

architecture registro of registrador is

begin
  
  process(clk,reset,set)
    
    begin
      
      if (reset='1') then q <= (others => '0'); --qnd reset = 1 coloca zero na saida
      elsif (set='1') then q <= (others => '1'); --qnd set = 1 coloca 1 na saida
      elsif (clk'EVENT and clk = '1') then --qnd clock for 1
        if (enable ='1') then q <=d;  -- se enable for 1, passa o dado pra saida
          
        end if;
      end if;
    end process;
  end registro;
        