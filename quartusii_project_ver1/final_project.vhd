library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity final_project is
	generic
	(
		DATA_WIDTH : integer := 8; --tamanho da word
      DATA_DEPTH : integer := 175987 --numero de words
	);
	
	port
	(
		clock		: in 	std_logic;
		address	: in 	std_logic_vector (10 downto 0);
		data		: in 	std_logic_vector (7 downto 0);
		wren		: in 	std_logic ;
		q			: out std_logic_vector (7 downto 0)
	);

end final_project;

architecture behavior of final_project is
--sinais
signal address_1, address_2: std_logic_vector (10 downto 0);
signal data_1, data_2: std_logic_vector (7 downto 0);
signal wren_1, wren_2 : std_logic;
signal q_1, q_2 : std_logic_vector (7 downto 0);
signal enable,reset,set : std_logic;
signal d : std_logic_vector (7 downto 0);
signal q_3 : std_logic_vector (7 downto 0);
------------------------------------------------------------

-- componentes
component ram_1_read
	port
	(
		address	: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

component ram_2_write
	port
	(
		address	: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

component registrador
	port ( 
		clk,enable,reset,set : std_logic;
		d : in std_logic_vector (7 downto 0);
		q : out std_logic_vector (7 downto 0)
  );
end component;

------------------------------------------------------------------------------
begin
ram_1	: ram_1_read  port map(address_1, clock, data_1, wren_1, q_1);
ram_2	: ram_2_write port map (address_2, clock, data_2, wren_2, q_2);
reg	: registrador port map (clock, enable, reset, set, d, q_3);

  process(clock,reset,set)
    variable contador: integer range 0 to 2048;
	 begin  
		contador:= 0;
		if (clock'EVENT and clock = '1') then
				d <= q_1; --dado da ram passa para a entrada do registrador
				
				address_1 <= address_1 + contador; --endereço = 0 o endereço vai receber o ende atual + o contador
				-- por ex se o endereço for 0 e contador 0 endereço = 0
				-- se endereço = 0 e contador = 1, endereço = 1 e assim por diante
				
				contador := contador + 1; --incrementa o contador
				if (enable = '1') then
					-- passa o dado da entrada do reg para a saida do reg
					q_3 <= d;
				end if;
				if(wren_2 = '1') then
					data_2 <= q_3;
					address_2 <= address_2 + contador;
					contador := contador + 1 ; --incrementa o contador
				end if;
      end if;
    end process;
	 
	 --temos q colocar a saida aqui
	 q <= data_2;
end behavior;