library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- entity
entity add4 is port 
(
	data1, data2	: in	std_logic_vector(3 downto 0);
	cin				: in	std_logic;
	cout			: out	std_logic;
	sum				: out	std_logic_vector(3 downto 0)
);
end entity add4;

-- architecture
architecture RTL of add4 is
	signal out5bit	:		std_logic_vector(4 downto 0);
begin
	out5bit <= ('0' & data1) + ('0' & data2) + cin;
	sum <= out5bit(3 downto 0);	-- 4bits
	cout <= out5bit(4);		-- 5th bit
end architecture RTL;