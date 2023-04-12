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

ENTITY block_ram_mem_module IS
    PORT ( 
		en            : IN STD_LOGIC;
		rst           : IN STD_LOGIC;
        re            : IN STD_LOGIC;
        clk           : IN STD_LOGIC;
        d0            : IN STD_LOGIC;
        d1            : IN STD_LOGIC;
        d2            : IN STD_LOGIC;
        d3            : IN STD_LOGIC;
        d4            : IN STD_LOGIC;
        d5            : IN STD_LOGIC;
        d6            : IN STD_LOGIC;
        d7            : IN STD_LOGIC;
        stop_clk      : IN STD_LOGIC;
        stop_data_in0 : IN STD_LOGIC;
        stop_data_in1 : IN STD_LOGIC;

        data_out1     : OUT STD_LOGIC;
        data_out2     : OUT STD_LOGIC;
        stop_data_out : OUT STD_LOGIC;
        data_full2    : OUT STD_LOGIC;
        stop_full     : OUT STD_LOGIC;
        stop_done     : OUT STD_LOGIC
        
    );

END block_ram_mem_module;

ARCHITECTURE Behavioral OF block_ram_mem_module IS

COMPONENT address_controller 
    PORT (
        en    : IN STD_LOGIC;
		rst   : IN STD_LOGIC;
        re    : IN STD_LOGIC;
		clk   : IN STD_LOGIC;

        start : INOUT STD_LOGIC;

        address  : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        count    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        full     : OUT STD_LOGIC;
        done     : OUT STD_LOGIC;
        wait_sig : OUT STD_LOGIC;
		we       : OUT STD_LOGIC

    );

END COMPONENT;

COMPONENT block_ram 
    PORT (
        clk  : IN STD_LOGIC;
        we   : IN STD_LOGIC;
        en   : IN STD_LOGIC;
        di   : IN STD_LOGIC_VECTOR(3 downto 0);
        addr : IN STD_LOGIC_VECTOR(11 downto 0);

        do : OUT STD_LOGIC_VECTOR(3 downto 0)

    );

END COMPONENT;

COMPONENT concatenation 
    PORT (
        d0 : IN STD_LOGIC;
        d1 : IN STD_LOGIC;
        d2 : IN STD_LOGIC;
        d3 : IN STD_LOGIC;

        data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

    );

END COMPONENT;

COMPONENT outmux41 
    PORT (
        data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		sel     : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		clk     : IN STD_LOGIC;

        data_out : OUT STD_LOGIC

    );

END COMPONENT;

COMPONENT stop_address_controller
    PORT (
        en  : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        re  : IN STD_LOGIC;
        clk : IN STD_LOGIC;

        start : INOUT STD_LOGIC;

        address  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        full     : OUT STD_LOGIC;
        done     : OUT STD_LOGIC;
        wait_sig : OUT STD_LOGIC;
        count    : OUT STD_LOGIC;
        we       : OUT STD_LOGIC 
    
    );

END COMPONENT;

COMPONENT stop_block_ram
    PORT (
        clk  : IN STD_LOGIC;
		we   : IN STD_LOGIC;
		en   : IN STD_LOGIC;
        di   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

		do : OUT  STD_LOGIC_vector(1 DOWNTO 0)
    );
END COMPONENT;

COMPONENT stop_concatenation
    PORT (
        d0 : IN STD_LOGIC;
        d1 : IN STD_LOGIC;

        data_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END COMPONENT;

COMPONENT outmux21
    PORT (
        data_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		sel     : IN STD_LOGIC;
		clk     : IN STD_LOGIC;

        data_out : OUT STD_LOGIC
    );
END COMPONENT;

SIGNAL temp_addr : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL temp_we, temp_start, temp_count   : STD_LOGIC; 
SIGNAL temp_start1, temp_we1, temp_done1 : STD_LOGIC;
SIGNAL temp_start2, temp_we2, temp_done2 : STD_LOGIC;
SIGNAL temp_count1, temp_count2    : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL temp_dataOut1, temp_ramOut1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL temp_dataOut2, temp_ramOut2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL temp_addr1, temp_addr2      : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL temp_stopdata_out, temp_stopRam : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN

RM1 : address_controller PORT MAP (
    en       => en,
    rst      => rst,
    re       => re,
    clk      => clk,
    start    => temp_start1,
    address  => temp_addr1,
    count    => temp_count1,
    full     => OPEN,
    done     => temp_done1,
    wait_sig => OPEN,
    we       => temp_we1

);

RM2 : block_ram PORT MAP (
    clk  => clk,
    we   => temp_we1,
    en   => temp_start1,
    di   => temp_dataOut1,
    addr => temp_addr1,
    do   => temp_ramOut1

);

RM3 : concatenation PORT MAP ( 
    d0       => d3,
    d1       => d2,
    d2       => d1,
    d3       => d0,
    data_out => temp_dataOut1

);

RM4 : outmux41 PORT MAP ( 
    data_in  => temp_ramOut1,
    sel      => temp_count1,
    clk      => clk,
    data_out => data_out1

);

RM5 : address_controller PORT MAP (
    en       => en,
    rst      => rst,
    re       => temp_done1,
    clk      => clk,
    start    => temp_start2,
    address  => temp_addr2,
    count    => temp_count2,
    full     => data_full2,
    done     => temp_done2,
    wait_sig => OPEN,
    we       => temp_we2

);

RM6 : block_ram PORT MAP (
    clk  => clk,
    we   => temp_we2,
    en   => temp_start2,
    di   => temp_dataOut2,
    addr => temp_addr2,
    do   => temp_ramOut2

);

RM7 : concatenation PORT MAP ( 
    d0       => d7,
    d1       => d6,
    d2       => d5,
    d3       => d4,
    data_out => temp_dataOut2

);

RM8 : outmux41 PORT MAP ( 
    data_in  => temp_ramOut2,
    sel      => temp_count2,
    clk      => clk,
    data_out => data_out2

);

RM9 : stop_address_controller PORT MAP (
    en       => en,
    rst      => rst,
    re       => temp_done2,
    clk      => stop_clk,
    start    => temp_start,
    address  => temp_addr,
    full     => stop_full,
    done     => stop_done,
    wait_sig => OPEN,
    count    => temp_count,
    we       => temp_we

);

RM10 : stop_block_ram PORT MAP (
    clk  => stop_clk,
    we   => temp_we,
    en   => temp_start,
    di   => temp_stopdata_out,
    addr => temp_addr,
    do   => temp_stopRam

);

RM11 : stop_concatenation PORT MAP (
    d0       => stop_data_in0,
    d1       => stop_data_in1,
    data_out => temp_stopdata_out

);

RM12 : outmux21 PORT MAP (
    data_in  => temp_stopRam,
    sel      => temp_count,
    clk      => stop_clk,
    data_out => stop_data_out

);

END Behavioral;