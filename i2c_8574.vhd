library IEEE;
use IEEE.std_logic_1164.all;

entity i2c_8574 is
	port(
		SCL, SDA : in std_logic
	);
end;

architecture design of i2c_8574 is
	signal i2c_8574_condition : std_logic_vector(1 downto 0) := "00"; -- for condition
begin
	i2c_8574_process : process(SDA, SCL)
	begin
		if SCL = '1' then
			if falling_edge(SDA) then -- Start condition
				i2c_8574_condition(1) <= '1';
			elsif rising_edge(SDA) and i2c_8574_condition(1) = '1' then --  Stop Condition
				i2c_8574_condition(0) <= '1';
			end if;
		end if;
	end process;
end design;