library IEEE;
use IEEE.std_logic_1164.all;

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

architecture comportamento of final_project is
signal data_out : std_logic_vector (DATA_WIDTH-1 downto 0);

-- declaração dos componentes memorio 1 leitura, memoria 2 escrita
-- memoria 1 já esta inicializada com uma amostra de audio
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


begin
-- Passos:
-- 1 - ler um por um os dados da memoria 1
-- 2 - aplicar algum "filtro" (ex: +2 no dado contido no endereço 10)
-- 3 - escrever na memoria 2


end comportamento;