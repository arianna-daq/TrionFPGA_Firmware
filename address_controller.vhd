----------------------------------------------------------------------------------
---	sync.vhd
---
--- Created By:	Manuel Pasqual Paul
---
---	Original Design By:	Tarun Prakash
---
--- Description:
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY address_controller IS
    PORT ( 
		en  : IN STD_LOGIC;
		rst : IN STD_LOGIC;
        re  : IN STD_LOGIC;
		clk : IN STD_LOGIC;

        start : INOUT STD_LOGIC;

        address  : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        count    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        full     : OUT STD_LOGIC;
        done     : OUT STD_LOGIC;
        wait_sig : OUT STD_LOGIC;
		we       : OUT STD_LOGIC
              
    );

END address_controller;

ARCHITECTURE Behavioral OF address_controller IS

SIGNAL addr    : std_logic_vector(11 DOWNTO 0) := "000000000000";
SIGNAL r_addr  : std_logic_vector(12 DOWNTO 0) := "0000000000000";
SIGNAL count_f : std_logic_vector(1 DOWNTO 0) := "00";
SIGNAL r_count : std_logic_vector(1 DOWNTO 0) := "00";
SIGNAL full_f  : std_logic := '0';
SIGNAL done_f  : std_logic := '0';
SIGNAL wait_f  : std_logic := '0';

BEGIN

    AC1 : PROCESS(clk, rst) 
        BEGIN 
            IF rst = '1' THEN
                addr    <= "000000000000";
                r_addr  <= "0000000000000";
                full_f  <= '0';
                done_f  <= '0';
                wait_f  <= '0';
                r_count <= "00";

            ELSE
                IF falling_edge(clk) THEN
                    IF en = '1' THEN
                        IF start = '1' THEN
                            CASE re IS
                                WHEN '0' => IF addr < "111111111111" THEN 
                                                addr <= addr + 1;

                                            ELSE
                                                addr <= "000000000000";
                                                full_f <= '1';
                                                wait_f <= '1';

                                            END IF;

                                WHEN '1' => IF r_count < "11" THEN							
                                                IF r_addr < "1000000000000" THEN 
                                                    r_addr <= r_addr + 1;

                                                ELSE
                                                    r_addr  <= "0000000000000";
                                                    r_count <= r_count +1;

                                                END IF;

                                            ELSE
                                                IF r_addr < "0111111111111" THEN
                                                    r_addr <= r_addr + 1;

                                                ELSE
                                                    r_addr  <= "0000000000000";
                                                    r_count <="00";
                                                    done_f  <= '1';
                                                    wait_f  <= '1';

                                                END IF;
                                            END IF;

                                WHEN OTHERS => NULL;

                            END CASE;

                        ELSE
                            addr   <= "000000000000";
                            r_addr <= "0000000000000";

                            IF re = '0' AND full_f = '1' THEN
                                wait_f <= '1';

                            ELSIF re = '1' AND done_f = '1' THEN
                                wait_f <= '1';

                            ELSE
                                wait_f <= '0';

                            END IF;
                        END IF;

                    ELSE
                        wait_f <= '1';

                    END IF;
                END IF;
            END IF;
        END PROCESS;

    full     <= full_f;
    done     <= done_f;
    wait_sig <= wait_f;
    start    <= NOT wait_f;
    we       <= NOT re;
    count    <= r_count;
    address  <= addr WHEN re = '0' ELSE r_addr(11 DOWNTO 0);

END Behavioral;