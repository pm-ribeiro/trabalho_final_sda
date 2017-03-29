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
		clock		: in 	std_logic  := '1';
		address	: in 	std_logic_vector (10 downto 0);
		data		: in 	std_logic_vector (7 downto 0);
		wren		: in 	std_logic ;
		q			: out std_logic_vector (7 downto 0)
	);

end final_project;

architecture behavior of final_project is
signal data_out : std_logic_vector (DATA_WIDTH-1 downto 0);
signal address_1, address_2: std_logic_vector (10 downto 0);
signal clock_1, clock_2 : std_logic;
signal data_1, data_2 : std_logic_vector (7 downto 0);
signal wren_1, wren_2 : std_logic;
signal q_1, q_2 : std_logic_vector (7 downto 0);

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



-- Passos:
-- 1 - ler um por um os dados da memoria 1
-- 2 - aplicar algum "filtro" (ex: +2 no dado contido no endereço 10)
-- 3 - escrever na memoria 2
begin
ram_1: ram_1_read  port map(address_1, clock_1, data_1, wren_1, q_1);
ram_2: ram_2_write port map (address_2, clock_2, data_2, wren_2, q_2);

 -- Memory Read Block
 -- Read Operation : When we = 0
MEM_READ:
	process (clock_1) begin
 		if (rising_edge(clock_1)) then
 			if (wren_1 = '0') then
 				data_out <= address_1 + 2;
 			end if;
 		end if;
 end process;
 
-- Memory Write Block
-- Write Operation : When we = 1, cs = 1
MEM_WRITE:
	process (clock_2) begin
 		if (rising_edge(clock_2)) then
 			if (wren_2 = '1') then
 				address_2 <= data_out;
 			end if;
 		end if;
 	end process;
 

end behavior;