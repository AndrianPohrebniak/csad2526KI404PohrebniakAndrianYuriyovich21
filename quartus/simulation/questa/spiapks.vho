-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 24.1std.0 Build 1077 03/04/2025 SC Standard Edition"

-- DATE "11/01/2025 18:03:13"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	spi_master IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	start : IN std_logic;
	tx_data : IN std_logic_vector(7 DOWNTO 0);
	rx_data : OUT std_logic_vector(7 DOWNTO 0);
	busy : OUT std_logic;
	done : OUT std_logic;
	sck : OUT std_logic;
	mosi : OUT std_logic;
	miso : IN std_logic;
	cs_n : OUT std_logic
	);
END spi_master;

-- Design Ports Information
-- rx_data[0]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[1]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[2]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[3]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[4]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[5]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[6]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[7]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- busy	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- done	=>  Location: PIN_T20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sck	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mosi	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cs_n	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- miso	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[7]	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[6]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[5]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[4]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[3]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[2]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[1]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[0]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF spi_master IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_tx_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_rx_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_busy : std_logic;
SIGNAL ww_done : std_logic;
SIGNAL ww_sck : std_logic;
SIGNAL ww_mosi : std_logic;
SIGNAL ww_miso : std_logic;
SIGNAL ww_cs_n : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \miso~input_o\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \st.ST_DONE~q\ : std_logic;
SIGNAL \WideOr6~0_combout\ : std_logic;
SIGNAL \bit_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \bit_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \div_cnt~2_combout\ : std_logic;
SIGNAL \div_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \div_cnt~1_combout\ : std_logic;
SIGNAL \div_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \sck_i~q\ : std_logic;
SIGNAL \sck_i~0_combout\ : std_logic;
SIGNAL \sck_i~DUPLICATE_q\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \Selector9~1_combout\ : std_logic;
SIGNAL \bit_cnt[3]~DUPLICATE_q\ : std_logic;
SIGNAL \mosi_i~0_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \fsm_next~1_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \bit_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \fsm_next~0_combout\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \done_i~q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \st.ST_DEASSERT_CS~q\ : std_logic;
SIGNAL \st.ST_DONE~DUPLICATE_q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \st.ST_IDLE~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \st.ST_LOAD~q\ : std_logic;
SIGNAL \st.ST_ASSERT_CS~DUPLICATE_q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \st.ST_TRANSFER~q\ : std_logic;
SIGNAL \div_cnt~3_combout\ : std_logic;
SIGNAL \div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \sck_en~0_combout\ : std_logic;
SIGNAL \sck_en~q\ : std_logic;
SIGNAL \sh_rx[0]~0_combout\ : std_logic;
SIGNAL \st.ST_ASSERT_CS~q\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \busy_i~q\ : std_logic;
SIGNAL \done_i~DUPLICATE_q\ : std_logic;
SIGNAL \tx_data[7]~input_o\ : std_logic;
SIGNAL \tx_data[6]~input_o\ : std_logic;
SIGNAL \tx_data[5]~input_o\ : std_logic;
SIGNAL \tx_data[4]~input_o\ : std_logic;
SIGNAL \tx_data[3]~input_o\ : std_logic;
SIGNAL \tx_data[2]~input_o\ : std_logic;
SIGNAL \tx_data[1]~input_o\ : std_logic;
SIGNAL \tx_data[0]~input_o\ : std_logic;
SIGNAL \sh_tx[0]~1_combout\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \sh_tx[6]~0_combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Selector8~1_combout\ : std_logic;
SIGNAL \mosi_i~q\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \cs_n_i~q\ : std_logic;
SIGNAL div_cnt : std_logic_vector(2 DOWNTO 0);
SIGNAL sh_rx : std_logic_vector(7 DOWNTO 0);
SIGNAL bit_cnt : std_logic_vector(3 DOWNTO 0);
SIGNAL sh_tx : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_sck_i~q\ : std_logic;
SIGNAL ALT_INV_div_cnt : std_logic_vector(2 DOWNTO 0);
SIGNAL ALT_INV_bit_cnt : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_WideOr6~0_combout\ : std_logic;
SIGNAL ALT_INV_sh_tx : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_st.ST_DONE~q\ : std_logic;
SIGNAL \ALT_INV_fsm_next~0_combout\ : std_logic;
SIGNAL \ALT_INV_st.ST_TRANSFER~q\ : std_logic;
SIGNAL \ALT_INV_Selector8~0_combout\ : std_logic;
SIGNAL \ALT_INV_busy_i~q\ : std_logic;
SIGNAL \ALT_INV_mosi_i~q\ : std_logic;
SIGNAL \ALT_INV_cs_n_i~q\ : std_logic;
SIGNAL \ALT_INV_st.ST_DEASSERT_CS~q\ : std_logic;
SIGNAL \ALT_INV_done_i~q\ : std_logic;
SIGNAL \ALT_INV_st.ST_LOAD~q\ : std_logic;
SIGNAL \ALT_INV_sck_en~q\ : std_logic;
SIGNAL \ALT_INV_st.ST_ASSERT_CS~q\ : std_logic;
SIGNAL \ALT_INV_bit_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_bit_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_tx_data[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_mosi_i~0_combout\ : std_logic;
SIGNAL \ALT_INV_tx_data[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_tx_data[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_st.ST_ASSERT_CS~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_fsm_next~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector9~0_combout\ : std_logic;
SIGNAL \ALT_INV_div_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_st.ST_DONE~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_st.ST_IDLE~q\ : std_logic;
SIGNAL \ALT_INV_tx_data[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_tx_data[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_tx_data[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_div_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_bit_cnt[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_sck_i~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_tx_data[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_bit_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_div_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_tx_data[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_start~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
ww_start <= start;
ww_tx_data <= tx_data;
rx_data <= ww_rx_data;
busy <= ww_busy;
done <= ww_done;
sck <= ww_sck;
mosi <= ww_mosi;
ww_miso <= miso;
cs_n <= ww_cs_n;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_sck_i~q\ <= NOT \sck_i~q\;
ALT_INV_div_cnt(1) <= NOT div_cnt(1);
ALT_INV_bit_cnt(2) <= NOT bit_cnt(2);
\ALT_INV_WideOr6~0_combout\ <= NOT \WideOr6~0_combout\;
ALT_INV_sh_tx(7) <= NOT sh_tx(7);
ALT_INV_sh_tx(6) <= NOT sh_tx(6);
\ALT_INV_st.ST_DONE~q\ <= NOT \st.ST_DONE~q\;
ALT_INV_bit_cnt(1) <= NOT bit_cnt(1);
\ALT_INV_fsm_next~0_combout\ <= NOT \fsm_next~0_combout\;
\ALT_INV_st.ST_TRANSFER~q\ <= NOT \st.ST_TRANSFER~q\;
\ALT_INV_Selector8~0_combout\ <= NOT \Selector8~0_combout\;
\ALT_INV_busy_i~q\ <= NOT \busy_i~q\;
\ALT_INV_mosi_i~q\ <= NOT \mosi_i~q\;
\ALT_INV_cs_n_i~q\ <= NOT \cs_n_i~q\;
\ALT_INV_st.ST_DEASSERT_CS~q\ <= NOT \st.ST_DEASSERT_CS~q\;
ALT_INV_bit_cnt(0) <= NOT bit_cnt(0);
\ALT_INV_done_i~q\ <= NOT \done_i~q\;
ALT_INV_div_cnt(2) <= NOT div_cnt(2);
ALT_INV_div_cnt(0) <= NOT div_cnt(0);
\ALT_INV_st.ST_LOAD~q\ <= NOT \st.ST_LOAD~q\;
\ALT_INV_sck_en~q\ <= NOT \sck_en~q\;
\ALT_INV_st.ST_ASSERT_CS~q\ <= NOT \st.ST_ASSERT_CS~q\;
ALT_INV_bit_cnt(3) <= NOT bit_cnt(3);
\ALT_INV_bit_cnt[0]~DUPLICATE_q\ <= NOT \bit_cnt[0]~DUPLICATE_q\;
ALT_INV_sh_tx(0) <= NOT sh_tx(0);
\ALT_INV_bit_cnt[1]~DUPLICATE_q\ <= NOT \bit_cnt[1]~DUPLICATE_q\;
ALT_INV_sh_tx(2) <= NOT sh_tx(2);
\ALT_INV_tx_data[4]~input_o\ <= NOT \tx_data[4]~input_o\;
\ALT_INV_mosi_i~0_combout\ <= NOT \mosi_i~0_combout\;
\ALT_INV_tx_data[5]~input_o\ <= NOT \tx_data[5]~input_o\;
\ALT_INV_tx_data[2]~input_o\ <= NOT \tx_data[2]~input_o\;
\ALT_INV_st.ST_ASSERT_CS~DUPLICATE_q\ <= NOT \st.ST_ASSERT_CS~DUPLICATE_q\;
\ALT_INV_fsm_next~1_combout\ <= NOT \fsm_next~1_combout\;
\ALT_INV_Selector9~0_combout\ <= NOT \Selector9~0_combout\;
\ALT_INV_div_cnt[0]~DUPLICATE_q\ <= NOT \div_cnt[0]~DUPLICATE_q\;
\ALT_INV_st.ST_DONE~DUPLICATE_q\ <= NOT \st.ST_DONE~DUPLICATE_q\;
\ALT_INV_st.ST_IDLE~q\ <= NOT \st.ST_IDLE~q\;
ALT_INV_sh_tx(5) <= NOT sh_tx(5);
ALT_INV_sh_tx(4) <= NOT sh_tx(4);
ALT_INV_sh_tx(1) <= NOT sh_tx(1);
\ALT_INV_tx_data[6]~input_o\ <= NOT \tx_data[6]~input_o\;
\ALT_INV_tx_data[3]~input_o\ <= NOT \tx_data[3]~input_o\;
\ALT_INV_tx_data[0]~input_o\ <= NOT \tx_data[0]~input_o\;
\ALT_INV_div_cnt[1]~DUPLICATE_q\ <= NOT \div_cnt[1]~DUPLICATE_q\;
\ALT_INV_bit_cnt[3]~DUPLICATE_q\ <= NOT \bit_cnt[3]~DUPLICATE_q\;
ALT_INV_sh_tx(3) <= NOT sh_tx(3);
\ALT_INV_sck_i~DUPLICATE_q\ <= NOT \sck_i~DUPLICATE_q\;
\ALT_INV_tx_data[1]~input_o\ <= NOT \tx_data[1]~input_o\;
\ALT_INV_bit_cnt[2]~DUPLICATE_q\ <= NOT \bit_cnt[2]~DUPLICATE_q\;
\ALT_INV_div_cnt[2]~DUPLICATE_q\ <= NOT \div_cnt[2]~DUPLICATE_q\;
\ALT_INV_tx_data[7]~input_o\ <= NOT \tx_data[7]~input_o\;
\ALT_INV_start~input_o\ <= NOT \start~input_o\;

-- Location: IOOBUF_X89_Y8_N5
\rx_data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sh_rx(0),
	devoe => ww_devoe,
	o => ww_rx_data(0));

-- Location: IOOBUF_X89_Y9_N5
\rx_data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sh_rx(1),
	devoe => ww_devoe,
	o => ww_rx_data(1));

-- Location: IOOBUF_X89_Y6_N5
\rx_data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sh_rx(2),
	devoe => ww_devoe,
	o => ww_rx_data(2));

-- Location: IOOBUF_X89_Y6_N56
\rx_data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sh_rx(3),
	devoe => ww_devoe,
	o => ww_rx_data(3));

-- Location: IOOBUF_X89_Y9_N56
\rx_data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sh_rx(4),
	devoe => ww_devoe,
	o => ww_rx_data(4));

-- Location: IOOBUF_X89_Y4_N62
\rx_data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sh_rx(5),
	devoe => ww_devoe,
	o => ww_rx_data(5));

-- Location: IOOBUF_X89_Y8_N56
\rx_data[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sh_rx(6),
	devoe => ww_devoe,
	o => ww_rx_data(6));

-- Location: IOOBUF_X89_Y6_N39
\rx_data[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sh_rx(7),
	devoe => ww_devoe,
	o => ww_rx_data(7));

-- Location: IOOBUF_X72_Y0_N36
\busy~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \busy_i~q\,
	devoe => ww_devoe,
	o => ww_busy);

-- Location: IOOBUF_X89_Y4_N96
\done~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \done_i~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_done);

-- Location: IOOBUF_X89_Y4_N45
\sck~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sck_i~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_sck);

-- Location: IOOBUF_X89_Y4_N79
\mosi~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \mosi_i~q\,
	devoe => ww_devoe,
	o => ww_mosi);

-- Location: IOOBUF_X72_Y0_N2
\cs_n~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_cs_n_i~q\,
	devoe => ww_devoe,
	o => ww_cs_n);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G9
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y8_N38
\miso~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_miso,
	o => \miso~input_o\);

-- Location: IOIBUF_X89_Y6_N21
\rst_n~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

-- Location: IOIBUF_X72_Y0_N52
\start~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: FF_X88_Y5_N5
\st.ST_DONE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \st.ST_DEASSERT_CS~q\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \st.ST_DONE~q\);

-- Location: MLABCELL_X87_Y5_N24
\WideOr6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr6~0_combout\ = ( !\st.ST_LOAD~q\ & ( (!\st.ST_DEASSERT_CS~q\ & !\st.ST_DONE~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_st.ST_DEASSERT_CS~q\,
	datad => \ALT_INV_st.ST_DONE~q\,
	dataf => \ALT_INV_st.ST_LOAD~q\,
	combout => \WideOr6~0_combout\);

-- Location: FF_X87_Y5_N8
\bit_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector10~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_cnt(2));

-- Location: FF_X87_Y5_N28
\bit_cnt[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector11~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_cnt[1]~DUPLICATE_q\);

-- Location: MLABCELL_X87_Y5_N6
\Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = ( bit_cnt(2) & ( \bit_cnt[1]~DUPLICATE_q\ & ( (!\WideOr6~0_combout\) # (\st.ST_TRANSFER~q\) ) ) ) # ( bit_cnt(2) & ( !\bit_cnt[1]~DUPLICATE_q\ & ( (!\WideOr6~0_combout\) # ((\st.ST_TRANSFER~q\ & ((!\mosi_i~0_combout\) # 
-- (\bit_cnt[0]~DUPLICATE_q\)))) ) ) ) # ( !bit_cnt(2) & ( !\bit_cnt[1]~DUPLICATE_q\ & ( (!\bit_cnt[0]~DUPLICATE_q\ & (\mosi_i~0_combout\ & \st.ST_TRANSFER~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001100101010101111101100000000000000001010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideOr6~0_combout\,
	datab => \ALT_INV_bit_cnt[0]~DUPLICATE_q\,
	datac => \ALT_INV_mosi_i~0_combout\,
	datad => \ALT_INV_st.ST_TRANSFER~q\,
	datae => ALT_INV_bit_cnt(2),
	dataf => \ALT_INV_bit_cnt[1]~DUPLICATE_q\,
	combout => \Selector10~0_combout\);

-- Location: FF_X87_Y5_N7
\bit_cnt[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector10~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_cnt[2]~DUPLICATE_q\);

-- Location: FF_X88_Y5_N19
\div_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \div_cnt~1_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_cnt(2));

-- Location: FF_X88_Y5_N23
\div_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \div_cnt~2_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_cnt(0));

-- Location: LABCELL_X88_Y5_N21
\div_cnt~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \div_cnt~2_combout\ = ( div_cnt(2) & ( (\div_cnt[1]~DUPLICATE_q\ & (\st.ST_TRANSFER~q\ & !div_cnt(0))) ) ) # ( !div_cnt(2) & ( (\st.ST_TRANSFER~q\ & !div_cnt(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000000010001000000000001000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_div_cnt[1]~DUPLICATE_q\,
	datab => \ALT_INV_st.ST_TRANSFER~q\,
	datad => ALT_INV_div_cnt(0),
	dataf => ALT_INV_div_cnt(2),
	combout => \div_cnt~2_combout\);

-- Location: FF_X88_Y5_N22
\div_cnt[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \div_cnt~2_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div_cnt[0]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y5_N18
\div_cnt~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \div_cnt~1_combout\ = ( \div_cnt[0]~DUPLICATE_q\ & ( (\st.ST_TRANSFER~q\ & (!\div_cnt[1]~DUPLICATE_q\ $ (!div_cnt(2)))) ) ) # ( !\div_cnt[0]~DUPLICATE_q\ & ( (\st.ST_TRANSFER~q\ & (\div_cnt[1]~DUPLICATE_q\ & div_cnt(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000000000000001100000011001100000000001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_st.ST_TRANSFER~q\,
	datac => \ALT_INV_div_cnt[1]~DUPLICATE_q\,
	datad => ALT_INV_div_cnt(2),
	dataf => \ALT_INV_div_cnt[0]~DUPLICATE_q\,
	combout => \div_cnt~1_combout\);

-- Location: FF_X88_Y5_N20
\div_cnt[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \div_cnt~1_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div_cnt[2]~DUPLICATE_q\);

-- Location: FF_X88_Y5_N50
sck_i : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sck_i~0_combout\,
	clrn => \rst_n~input_o\,
	sclr => \ALT_INV_st.ST_TRANSFER~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sck_i~q\);

-- Location: LABCELL_X88_Y5_N48
\sck_i~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sck_i~0_combout\ = ( div_cnt(1) & ( \sck_i~q\ ) ) # ( !div_cnt(1) & ( !\sck_i~q\ $ (((!\div_cnt[2]~DUPLICATE_q\) # (div_cnt(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000010101111010100001010111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_div_cnt[2]~DUPLICATE_q\,
	datac => ALT_INV_div_cnt(0),
	datad => \ALT_INV_sck_i~q\,
	dataf => ALT_INV_div_cnt(1),
	combout => \sck_i~0_combout\);

-- Location: FF_X88_Y5_N49
\sck_i~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sck_i~0_combout\,
	clrn => \rst_n~input_o\,
	sclr => \ALT_INV_st.ST_TRANSFER~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sck_i~DUPLICATE_q\);

-- Location: LABCELL_X88_Y5_N36
\Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = ( !\bit_cnt[1]~DUPLICATE_q\ & ( \sck_en~q\ & ( (!\bit_cnt[2]~DUPLICATE_q\ & (!\bit_cnt[0]~DUPLICATE_q\ & !\sck_i~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bit_cnt[2]~DUPLICATE_q\,
	datac => \ALT_INV_bit_cnt[0]~DUPLICATE_q\,
	datad => \ALT_INV_sck_i~DUPLICATE_q\,
	datae => \ALT_INV_bit_cnt[1]~DUPLICATE_q\,
	dataf => \ALT_INV_sck_en~q\,
	combout => \Selector9~0_combout\);

-- Location: FF_X87_Y5_N53
\bit_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector9~1_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_cnt(3));

-- Location: MLABCELL_X87_Y5_N51
\Selector9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector9~1_combout\ = ( \st.ST_TRANSFER~q\ & ( ((bit_cnt(3) & ((!\Selector9~0_combout\) # (!\WideOr6~0_combout\)))) # (\st.ST_ASSERT_CS~DUPLICATE_q\) ) ) # ( !\st.ST_TRANSFER~q\ & ( ((!\WideOr6~0_combout\ & bit_cnt(3))) # (\st.ST_ASSERT_CS~DUPLICATE_q\) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111110011001100111111001100110011111110110011001111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector9~0_combout\,
	datab => \ALT_INV_st.ST_ASSERT_CS~DUPLICATE_q\,
	datac => \ALT_INV_WideOr6~0_combout\,
	datad => ALT_INV_bit_cnt(3),
	dataf => \ALT_INV_st.ST_TRANSFER~q\,
	combout => \Selector9~1_combout\);

-- Location: FF_X87_Y5_N52
\bit_cnt[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector9~1_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_cnt[3]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y5_N30
\mosi_i~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mosi_i~0_combout\ = ( !\sck_i~DUPLICATE_q\ & ( \sck_en~q\ & ( (((\bit_cnt[3]~DUPLICATE_q\) # (\bit_cnt[1]~DUPLICATE_q\)) # (\bit_cnt[2]~DUPLICATE_q\)) # (\bit_cnt[0]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bit_cnt[0]~DUPLICATE_q\,
	datab => \ALT_INV_bit_cnt[2]~DUPLICATE_q\,
	datac => \ALT_INV_bit_cnt[1]~DUPLICATE_q\,
	datad => \ALT_INV_bit_cnt[3]~DUPLICATE_q\,
	datae => \ALT_INV_sck_i~DUPLICATE_q\,
	dataf => \ALT_INV_sck_en~q\,
	combout => \mosi_i~0_combout\);

-- Location: FF_X87_Y5_N14
\bit_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector12~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_cnt(0));

-- Location: MLABCELL_X87_Y5_N27
\Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = ( \st.ST_TRANSFER~q\ & ( (!\mosi_i~0_combout\ & (((bit_cnt(1))))) # (\mosi_i~0_combout\ & ((!bit_cnt(0) & ((!\WideOr6~0_combout\) # (!bit_cnt(1)))) # (bit_cnt(0) & ((bit_cnt(1)))))) ) ) # ( !\st.ST_TRANSFER~q\ & ( 
-- (!\WideOr6~0_combout\ & bit_cnt(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000110000111011110011000011101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideOr6~0_combout\,
	datab => \ALT_INV_mosi_i~0_combout\,
	datac => ALT_INV_bit_cnt(0),
	datad => ALT_INV_bit_cnt(1),
	dataf => \ALT_INV_st.ST_TRANSFER~q\,
	combout => \Selector11~0_combout\);

-- Location: FF_X87_Y5_N29
\bit_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector11~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_cnt(1));

-- Location: MLABCELL_X87_Y5_N30
\fsm_next~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsm_next~1_combout\ = ( !bit_cnt(2) & ( (!bit_cnt(1) & (!bit_cnt(0) & !bit_cnt(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_bit_cnt(1),
	datab => ALT_INV_bit_cnt(0),
	datac => ALT_INV_bit_cnt(3),
	dataf => ALT_INV_bit_cnt(2),
	combout => \fsm_next~1_combout\);

-- Location: MLABCELL_X87_Y5_N12
\Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = ( bit_cnt(0) & ( \st.ST_TRANSFER~q\ & ( (!\WideOr6~0_combout\) # (((!\sck_en~q\) # (\sck_i~q\)) # (\fsm_next~1_combout\)) ) ) ) # ( !bit_cnt(0) & ( \st.ST_TRANSFER~q\ & ( (!\fsm_next~1_combout\ & (\sck_en~q\ & !\sck_i~q\)) ) ) ) # 
-- ( bit_cnt(0) & ( !\st.ST_TRANSFER~q\ & ( !\WideOr6~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000001100000000001111101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideOr6~0_combout\,
	datab => \ALT_INV_fsm_next~1_combout\,
	datac => \ALT_INV_sck_en~q\,
	datad => \ALT_INV_sck_i~q\,
	datae => ALT_INV_bit_cnt(0),
	dataf => \ALT_INV_st.ST_TRANSFER~q\,
	combout => \Selector12~0_combout\);

-- Location: FF_X87_Y5_N13
\bit_cnt[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector12~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_cnt[0]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y5_N51
\fsm_next~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsm_next~0_combout\ = ( !\bit_cnt[3]~DUPLICATE_q\ & ( (!\bit_cnt[1]~DUPLICATE_q\ & !\bit_cnt[2]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_bit_cnt[1]~DUPLICATE_q\,
	datad => \ALT_INV_bit_cnt[2]~DUPLICATE_q\,
	dataf => \ALT_INV_bit_cnt[3]~DUPLICATE_q\,
	combout => \fsm_next~0_combout\);

-- Location: LABCELL_X88_Y5_N42
\Selector21~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = ( \bit_cnt[0]~DUPLICATE_q\ & ( \sck_en~q\ & ( ((\fsm_next~0_combout\ & (\st.ST_TRANSFER~q\ & !\sck_i~q\))) # (\st.ST_DONE~DUPLICATE_q\) ) ) ) # ( !\bit_cnt[0]~DUPLICATE_q\ & ( \sck_en~q\ & ( \st.ST_DONE~DUPLICATE_q\ ) ) ) # ( 
-- \bit_cnt[0]~DUPLICATE_q\ & ( !\sck_en~q\ & ( \st.ST_DONE~DUPLICATE_q\ ) ) ) # ( !\bit_cnt[0]~DUPLICATE_q\ & ( !\sck_en~q\ & ( \st.ST_DONE~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110001000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_fsm_next~0_combout\,
	datab => \ALT_INV_st.ST_TRANSFER~q\,
	datac => \ALT_INV_sck_i~q\,
	datad => \ALT_INV_st.ST_DONE~DUPLICATE_q\,
	datae => \ALT_INV_bit_cnt[0]~DUPLICATE_q\,
	dataf => \ALT_INV_sck_en~q\,
	combout => \Selector21~0_combout\);

-- Location: FF_X88_Y5_N44
done_i : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector21~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \done_i~q\);

-- Location: LABCELL_X88_Y5_N9
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( !\bit_cnt[1]~DUPLICATE_q\ & ( \st.ST_TRANSFER~q\ & ( (!\bit_cnt[0]~DUPLICATE_q\ & (\done_i~q\ & (!\bit_cnt[3]~DUPLICATE_q\ & !\bit_cnt[2]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bit_cnt[0]~DUPLICATE_q\,
	datab => \ALT_INV_done_i~q\,
	datac => \ALT_INV_bit_cnt[3]~DUPLICATE_q\,
	datad => \ALT_INV_bit_cnt[2]~DUPLICATE_q\,
	datae => \ALT_INV_bit_cnt[1]~DUPLICATE_q\,
	dataf => \ALT_INV_st.ST_TRANSFER~q\,
	combout => \Selector4~0_combout\);

-- Location: FF_X88_Y5_N2
\st.ST_DEASSERT_CS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector4~0_combout\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \st.ST_DEASSERT_CS~q\);

-- Location: FF_X88_Y5_N4
\st.ST_DONE~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \st.ST_DEASSERT_CS~q\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \st.ST_DONE~DUPLICATE_q\);

-- Location: LABCELL_X85_Y5_N24
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( !\st.ST_DONE~DUPLICATE_q\ & ( (\st.ST_IDLE~q\) # (\start~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_start~input_o\,
	datad => \ALT_INV_st.ST_IDLE~q\,
	dataf => \ALT_INV_st.ST_DONE~DUPLICATE_q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X85_Y5_N26
\st.ST_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector0~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \st.ST_IDLE~q\);

-- Location: LABCELL_X85_Y5_N27
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( !\st.ST_IDLE~q\ & ( \start~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_start~input_o\,
	dataf => \ALT_INV_st.ST_IDLE~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X87_Y5_N20
\st.ST_LOAD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector1~0_combout\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \st.ST_LOAD~q\);

-- Location: FF_X87_Y5_N17
\st.ST_ASSERT_CS~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \st.ST_LOAD~q\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \st.ST_ASSERT_CS~DUPLICATE_q\);

-- Location: MLABCELL_X87_Y5_N42
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \fsm_next~1_combout\ & ( ((!\done_i~q\ & \st.ST_TRANSFER~q\)) # (\st.ST_ASSERT_CS~DUPLICATE_q\) ) ) # ( !\fsm_next~1_combout\ & ( (\st.ST_TRANSFER~q\) # (\st.ST_ASSERT_CS~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011111100110011001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_st.ST_ASSERT_CS~DUPLICATE_q\,
	datac => \ALT_INV_done_i~q\,
	datad => \ALT_INV_st.ST_TRANSFER~q\,
	dataf => \ALT_INV_fsm_next~1_combout\,
	combout => \Selector3~0_combout\);

-- Location: FF_X87_Y5_N44
\st.ST_TRANSFER\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector3~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \st.ST_TRANSFER~q\);

-- Location: FF_X88_Y5_N25
\div_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \div_cnt~3_combout\,
	clrn => \rst_n~input_o\,
	sclr => \ALT_INV_st.ST_TRANSFER~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => div_cnt(1));

-- Location: LABCELL_X88_Y5_N24
\div_cnt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \div_cnt~3_combout\ = ( \div_cnt[0]~DUPLICATE_q\ & ( !div_cnt(1) ) ) # ( !\div_cnt[0]~DUPLICATE_q\ & ( div_cnt(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_div_cnt(1),
	dataf => \ALT_INV_div_cnt[0]~DUPLICATE_q\,
	combout => \div_cnt~3_combout\);

-- Location: FF_X88_Y5_N26
\div_cnt[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \div_cnt~3_combout\,
	clrn => \rst_n~input_o\,
	sclr => \ALT_INV_st.ST_TRANSFER~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div_cnt[1]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y5_N15
\sck_en~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sck_en~0_combout\ = ( !div_cnt(0) & ( \st.ST_TRANSFER~q\ & ( (!\div_cnt[1]~DUPLICATE_q\ & \div_cnt[2]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_div_cnt[1]~DUPLICATE_q\,
	datad => \ALT_INV_div_cnt[2]~DUPLICATE_q\,
	datae => ALT_INV_div_cnt(0),
	dataf => \ALT_INV_st.ST_TRANSFER~q\,
	combout => \sck_en~0_combout\);

-- Location: FF_X88_Y5_N11
sck_en : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \sck_en~0_combout\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sck_en~q\);

-- Location: LABCELL_X88_Y5_N54
\sh_rx[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sh_rx[0]~0_combout\ = ( \sck_i~DUPLICATE_q\ & ( \st.ST_TRANSFER~q\ & ( \sck_en~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_sck_en~q\,
	datae => \ALT_INV_sck_i~DUPLICATE_q\,
	dataf => \ALT_INV_st.ST_TRANSFER~q\,
	combout => \sh_rx[0]~0_combout\);

-- Location: FF_X88_Y5_N35
\sh_rx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \miso~input_o\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \sh_rx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_rx(0));

-- Location: FF_X88_Y5_N56
\sh_rx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => sh_rx(0),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \sh_rx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_rx(1));

-- Location: FF_X88_Y5_N32
\sh_rx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => sh_rx(1),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \sh_rx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_rx(2));

-- Location: FF_X88_Y5_N17
\sh_rx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => sh_rx(2),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \sh_rx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_rx(3));

-- Location: FF_X88_Y5_N13
\sh_rx[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => sh_rx(3),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \sh_rx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_rx(4));

-- Location: FF_X88_Y5_N58
\sh_rx[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => sh_rx(4),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \sh_rx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_rx(5));

-- Location: FF_X88_Y5_N38
\sh_rx[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => sh_rx(5),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \sh_rx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_rx(6));

-- Location: FF_X88_Y5_N40
\sh_rx[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => sh_rx(6),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \sh_rx[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_rx(7));

-- Location: FF_X87_Y5_N16
\st.ST_ASSERT_CS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \st.ST_LOAD~q\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \st.ST_ASSERT_CS~q\);

-- Location: LABCELL_X85_Y5_N48
\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = ( \busy_i~q\ & ( \st.ST_LOAD~q\ ) ) # ( !\busy_i~q\ & ( \st.ST_LOAD~q\ ) ) # ( \busy_i~q\ & ( !\st.ST_LOAD~q\ & ( ((\st.ST_TRANSFER~q\) # (\st.ST_DEASSERT_CS~q\)) # (\st.ST_ASSERT_CS~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000011111110111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_st.ST_ASSERT_CS~q\,
	datab => \ALT_INV_st.ST_DEASSERT_CS~q\,
	datac => \ALT_INV_st.ST_TRANSFER~q\,
	datae => \ALT_INV_busy_i~q\,
	dataf => \ALT_INV_st.ST_LOAD~q\,
	combout => \Selector7~0_combout\);

-- Location: FF_X85_Y5_N49
busy_i : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector7~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \busy_i~q\);

-- Location: FF_X88_Y5_N43
\done_i~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector21~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \done_i~DUPLICATE_q\);

-- Location: IOIBUF_X70_Y0_N18
\tx_data[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(7),
	o => \tx_data[7]~input_o\);

-- Location: IOIBUF_X89_Y35_N44
\tx_data[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(6),
	o => \tx_data[6]~input_o\);

-- Location: IOIBUF_X89_Y9_N38
\tx_data[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(5),
	o => \tx_data[5]~input_o\);

-- Location: IOIBUF_X72_Y0_N18
\tx_data[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(4),
	o => \tx_data[4]~input_o\);

-- Location: IOIBUF_X89_Y9_N21
\tx_data[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(3),
	o => \tx_data[3]~input_o\);

-- Location: IOIBUF_X70_Y0_N35
\tx_data[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(2),
	o => \tx_data[2]~input_o\);

-- Location: IOIBUF_X70_Y0_N1
\tx_data[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(1),
	o => \tx_data[1]~input_o\);

-- Location: IOIBUF_X89_Y8_N21
\tx_data[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(0),
	o => \tx_data[0]~input_o\);

-- Location: LABCELL_X88_Y5_N27
\sh_tx[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sh_tx[0]~1_combout\ = ( \mosi_i~0_combout\ & ( (!\st.ST_TRANSFER~q\ & ((!\st.ST_LOAD~q\ & ((sh_tx(0)))) # (\st.ST_LOAD~q\ & (\tx_data[0]~input_o\)))) ) ) # ( !\mosi_i~0_combout\ & ( (!\st.ST_LOAD~q\ & (((sh_tx(0))))) # (\st.ST_LOAD~q\ & 
-- ((!\st.ST_TRANSFER~q\ & (\tx_data[0]~input_o\)) # (\st.ST_TRANSFER~q\ & ((sh_tx(0)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000010111111000100001011111100010000101100000001000010110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_st.ST_LOAD~q\,
	datab => \ALT_INV_tx_data[0]~input_o\,
	datac => \ALT_INV_st.ST_TRANSFER~q\,
	datad => ALT_INV_sh_tx(0),
	dataf => \ALT_INV_mosi_i~0_combout\,
	combout => \sh_tx[0]~1_combout\);

-- Location: FF_X88_Y5_N29
\sh_tx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sh_tx[0]~1_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_tx(0));

-- Location: MLABCELL_X87_Y5_N45
\Selector19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (!\st.ST_TRANSFER~q\ & (\tx_data[1]~input_o\)) # (\st.ST_TRANSFER~q\ & ((sh_tx(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111010100000101111101010000010111110101000001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_tx_data[1]~input_o\,
	datac => \ALT_INV_st.ST_TRANSFER~q\,
	datad => ALT_INV_sh_tx(0),
	combout => \Selector19~0_combout\);

-- Location: MLABCELL_X87_Y5_N57
\sh_tx[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sh_tx[6]~0_combout\ = ( \fsm_next~1_combout\ & ( (\st.ST_LOAD~q\ & !\st.ST_TRANSFER~q\) ) ) # ( !\fsm_next~1_combout\ & ( (!\st.ST_TRANSFER~q\ & (\st.ST_LOAD~q\)) # (\st.ST_TRANSFER~q\ & (((!\sck_i~q\ & \sck_en~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001110100010001000111010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_st.ST_LOAD~q\,
	datab => \ALT_INV_st.ST_TRANSFER~q\,
	datac => \ALT_INV_sck_i~q\,
	datad => \ALT_INV_sck_en~q\,
	dataf => \ALT_INV_fsm_next~1_combout\,
	combout => \sh_tx[6]~0_combout\);

-- Location: FF_X87_Y5_N32
\sh_tx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector19~0_combout\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \sh_tx[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_tx(1));

-- Location: MLABCELL_X87_Y5_N33
\Selector18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = ( sh_tx(1) & ( (\tx_data[2]~input_o\) # (\st.ST_TRANSFER~q\) ) ) # ( !sh_tx(1) & ( (!\st.ST_TRANSFER~q\ & \tx_data[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_st.ST_TRANSFER~q\,
	datad => \ALT_INV_tx_data[2]~input_o\,
	dataf => ALT_INV_sh_tx(1),
	combout => \Selector18~0_combout\);

-- Location: FF_X87_Y5_N35
\sh_tx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector18~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \sh_tx[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_tx(2));

-- Location: MLABCELL_X87_Y5_N36
\Selector17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = ( sh_tx(2) & ( (\tx_data[3]~input_o\) # (\st.ST_TRANSFER~q\) ) ) # ( !sh_tx(2) & ( (!\st.ST_TRANSFER~q\ & \tx_data[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_st.ST_TRANSFER~q\,
	datac => \ALT_INV_tx_data[3]~input_o\,
	dataf => ALT_INV_sh_tx(2),
	combout => \Selector17~0_combout\);

-- Location: FF_X87_Y5_N38
\sh_tx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector17~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \sh_tx[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_tx(3));

-- Location: MLABCELL_X87_Y5_N3
\Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = ( sh_tx(3) & ( (\tx_data[4]~input_o\) # (\st.ST_TRANSFER~q\) ) ) # ( !sh_tx(3) & ( (!\st.ST_TRANSFER~q\ & \tx_data[4]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_st.ST_TRANSFER~q\,
	datad => \ALT_INV_tx_data[4]~input_o\,
	dataf => ALT_INV_sh_tx(3),
	combout => \Selector16~0_combout\);

-- Location: FF_X87_Y5_N4
\sh_tx[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector16~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \sh_tx[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_tx(4));

-- Location: MLABCELL_X87_Y5_N0
\Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = ( sh_tx(4) & ( (\tx_data[5]~input_o\) # (\st.ST_TRANSFER~q\) ) ) # ( !sh_tx(4) & ( (!\st.ST_TRANSFER~q\ & \tx_data[5]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_st.ST_TRANSFER~q\,
	datac => \ALT_INV_tx_data[5]~input_o\,
	dataf => ALT_INV_sh_tx(4),
	combout => \Selector15~0_combout\);

-- Location: FF_X87_Y5_N2
\sh_tx[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector15~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \sh_tx[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_tx(5));

-- Location: MLABCELL_X87_Y5_N54
\Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = ( sh_tx(5) & ( (\tx_data[6]~input_o\) # (\st.ST_TRANSFER~q\) ) ) # ( !sh_tx(5) & ( (!\st.ST_TRANSFER~q\ & \tx_data[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_st.ST_TRANSFER~q\,
	datac => \ALT_INV_tx_data[6]~input_o\,
	dataf => ALT_INV_sh_tx(5),
	combout => \Selector14~0_combout\);

-- Location: FF_X87_Y5_N56
\sh_tx[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector14~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \sh_tx[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_tx(6));

-- Location: MLABCELL_X87_Y5_N39
\Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = ( sh_tx(6) & ( (\tx_data[7]~input_o\) # (\st.ST_TRANSFER~q\) ) ) # ( !sh_tx(6) & ( (!\st.ST_TRANSFER~q\ & \tx_data[7]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_st.ST_TRANSFER~q\,
	datad => \ALT_INV_tx_data[7]~input_o\,
	dataf => ALT_INV_sh_tx(6),
	combout => \Selector13~0_combout\);

-- Location: FF_X87_Y5_N41
\sh_tx[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector13~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \sh_tx[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sh_tx(7));

-- Location: MLABCELL_X87_Y5_N48
\Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = ( sh_tx(7) & ( \st.ST_ASSERT_CS~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_st.ST_ASSERT_CS~DUPLICATE_q\,
	dataf => ALT_INV_sh_tx(7),
	combout => \Selector8~0_combout\);

-- Location: MLABCELL_X87_Y5_N21
\Selector8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~1_combout\ = ( \mosi_i~q\ & ( \st.ST_TRANSFER~q\ & ( ((!\WideOr6~0_combout\) # ((!\mosi_i~0_combout\) # (sh_tx(6)))) # (\Selector8~0_combout\) ) ) ) # ( !\mosi_i~q\ & ( \st.ST_TRANSFER~q\ & ( ((\mosi_i~0_combout\ & sh_tx(6))) # 
-- (\Selector8~0_combout\) ) ) ) # ( \mosi_i~q\ & ( !\st.ST_TRANSFER~q\ & ( (!\WideOr6~0_combout\) # (\Selector8~0_combout\) ) ) ) # ( !\mosi_i~q\ & ( !\st.ST_TRANSFER~q\ & ( \Selector8~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101110111011101110101010101010111111111110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector8~0_combout\,
	datab => \ALT_INV_WideOr6~0_combout\,
	datac => \ALT_INV_mosi_i~0_combout\,
	datad => ALT_INV_sh_tx(6),
	datae => \ALT_INV_mosi_i~q\,
	dataf => \ALT_INV_st.ST_TRANSFER~q\,
	combout => \Selector8~1_combout\);

-- Location: FF_X87_Y5_N22
mosi_i : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector8~1_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mosi_i~q\);

-- Location: LABCELL_X85_Y5_N54
\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ( \cs_n_i~q\ & ( \st.ST_DONE~DUPLICATE_q\ & ( (\st.ST_IDLE~q\ & !\st.ST_DEASSERT_CS~q\) ) ) ) # ( \cs_n_i~q\ & ( !\st.ST_DONE~DUPLICATE_q\ & ( (\st.ST_IDLE~q\ & !\st.ST_DEASSERT_CS~q\) ) ) ) # ( !\cs_n_i~q\ & ( 
-- !\st.ST_DONE~DUPLICATE_q\ & ( (\st.ST_IDLE~q\ & (!\st.ST_DEASSERT_CS~q\ & (!\st.ST_TRANSFER~q\ & !\st.ST_LOAD~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000010001000100010000000000000000000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_st.ST_IDLE~q\,
	datab => \ALT_INV_st.ST_DEASSERT_CS~q\,
	datac => \ALT_INV_st.ST_TRANSFER~q\,
	datad => \ALT_INV_st.ST_LOAD~q\,
	datae => \ALT_INV_cs_n_i~q\,
	dataf => \ALT_INV_st.ST_DONE~DUPLICATE_q\,
	combout => \Selector6~0_combout\);

-- Location: FF_X85_Y5_N55
cs_n_i : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector6~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cs_n_i~q\);

-- Location: LABCELL_X88_Y51_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


