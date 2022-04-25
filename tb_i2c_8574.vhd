library IEEE;
use IEEE.std_logic_1164.all;

entity tb_i2c_8574 is
end tb_i2c_8574;

architecture design of tb_i2c_8574 is
	component i2c_8574 is
		port(
			SCL, SDA : in std_logic
		);
	end component;

	signal SCL : std_logic := '1';
	signal SDA : std_logic := '1';
	signal tmp_delay : std_logic := '1';
	signal i2c_8574_condition : std_logic_vector(1 downto 0);
	signal one_round_chk : std_logic := '1';
	constant CLK_PERIOD : time := 1us;
begin
	U0 : i2c_8574 port map(
		SCL => SCL,
		SDA => SDA
	);

	clk_process : process
	begin
		if one_round_chk = '0' then
			wait for CLK_PERIOD/2;
		elsif one_round_chk = '1' then
			one_round_chk <= not one_round_chk;
			wait for CLK_PERIOD/2;
			SDA <= '0';
			wait for CLK_PERIOD/2;
			SCL <= '0';
			wait for CLK_PERIOD/2;
			SCL <= '1';
			wait for CLK_PERIOD/2;
			SDA <= '1';
		end if;
	end process;

end design;
