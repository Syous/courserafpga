library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entity
entity add4 is 
	port (
		data1, data2	: in	std_logic_vector(3 downto 0);
		cin				: in	std_logic;
		cout			: out	std_logic;
		sum				: out	std_logic_vector(3 downto 0)
);
end entity add4;

-- architecture
architecture RTL of add4 is

	signal cin_temp 	 :	unsigned (4 downto 0); -- 5 bits due to carry bit + data bits
	signal data1_temp	 : 	unsigned (4 downto 0); -- 5 bits due to carry bit + data bits
	signal data2_temp	 : 	unsigned (4 downto 0); -- 5 bits due to carry bit + data bits
	signal sum_temp 	 : 	unsigned (4 downto 0); -- 5 bits due to carry bit + data bits
	signal sum_temp_conv :	unsigned (3 downto 0); -- 4 bits due to "removing" concatenate carry bit from data bits

begin

	cin_temp 		<= "0000" & cin; -- concatenate 0000 + cin -> 0000X
	data1_temp 		<= '0' & unsigned (data1);
	data2_temp 		<= '0' & unsigned (data2);
	sum_temp 		<= cin_temp + data1_temp + data2_temp;
	sum 			<= sum_temp(3 downto 0);
	cout			<= sum_temp(4);

end architecture RTL;