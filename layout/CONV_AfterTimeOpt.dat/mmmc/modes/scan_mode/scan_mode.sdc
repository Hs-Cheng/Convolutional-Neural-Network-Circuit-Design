###############################################################
#  Generated by:      Cadence Innovus 17.11-s080_1
#  OS:                Linux x86_64(Host ID cad29)
#  Generated on:      Sat Jun 22 16:54:34 2019
#  Design:            CONV
#  Command:           saveDesign CONV_AfterTimeOpt
###############################################################
current_design CONV
create_clock [get_ports {clk}]  -name clk -period 8.000000 -waveform {0.000000 4.000000}
set_clock_transition  -rise -min 0.1 [get_clocks {clk}]
set_clock_transition  -rise -max 0.1 [get_clocks {clk}]
set_clock_transition  -fall -min 0.1 [get_clocks {clk}]
set_clock_transition  -fall -max 0.1 [get_clocks {clk}]
set_input_transition 0.5  [get_ports {clk}]
set_input_transition 0.5  [get_ports {reset}]
set_load -pin_load -max  1  [get_ports {busy}]
set_load -pin_load -min  1  [get_ports {busy}]
set_input_transition 0.5  [get_ports {ready}]
set_load -pin_load -max  1  [get_ports {iaddr[11]}]
set_load -pin_load -min  1  [get_ports {iaddr[11]}]
set_load -pin_load -max  1  [get_ports {iaddr[10]}]
set_load -pin_load -min  1  [get_ports {iaddr[10]}]
set_load -pin_load -max  1  [get_ports {iaddr[9]}]
set_load -pin_load -min  1  [get_ports {iaddr[9]}]
set_load -pin_load -max  1  [get_ports {iaddr[8]}]
set_load -pin_load -min  1  [get_ports {iaddr[8]}]
set_load -pin_load -max  1  [get_ports {iaddr[7]}]
set_load -pin_load -min  1  [get_ports {iaddr[7]}]
set_load -pin_load -max  1  [get_ports {iaddr[6]}]
set_load -pin_load -min  1  [get_ports {iaddr[6]}]
set_load -pin_load -max  1  [get_ports {iaddr[5]}]
set_load -pin_load -min  1  [get_ports {iaddr[5]}]
set_load -pin_load -max  1  [get_ports {iaddr[4]}]
set_load -pin_load -min  1  [get_ports {iaddr[4]}]
set_load -pin_load -max  1  [get_ports {iaddr[3]}]
set_load -pin_load -min  1  [get_ports {iaddr[3]}]
set_load -pin_load -max  1  [get_ports {iaddr[2]}]
set_load -pin_load -min  1  [get_ports {iaddr[2]}]
set_load -pin_load -max  1  [get_ports {iaddr[1]}]
set_load -pin_load -min  1  [get_ports {iaddr[1]}]
set_load -pin_load -max  1  [get_ports {iaddr[0]}]
set_load -pin_load -min  1  [get_ports {iaddr[0]}]
set_input_transition 0.5  [get_ports {idata[19]}]
set_input_transition 0.5  [get_ports {idata[18]}]
set_input_transition 0.5  [get_ports {idata[17]}]
set_input_transition 0.5  [get_ports {idata[16]}]
set_input_transition 0.5  [get_ports {idata[15]}]
set_input_transition 0.5  [get_ports {idata[14]}]
set_input_transition 0.5  [get_ports {idata[13]}]
set_input_transition 0.5  [get_ports {idata[12]}]
set_input_transition 0.5  [get_ports {idata[11]}]
set_input_transition 0.5  [get_ports {idata[10]}]
set_input_transition 0.5  [get_ports {idata[9]}]
set_input_transition 0.5  [get_ports {idata[8]}]
set_input_transition 0.5  [get_ports {idata[7]}]
set_input_transition 0.5  [get_ports {idata[6]}]
set_input_transition 0.5  [get_ports {idata[5]}]
set_input_transition 0.5  [get_ports {idata[4]}]
set_input_transition 0.5  [get_ports {idata[3]}]
set_input_transition 0.5  [get_ports {idata[2]}]
set_input_transition 0.5  [get_ports {idata[1]}]
set_input_transition 0.5  [get_ports {idata[0]}]
set_load -pin_load -max  1  [get_ports {cwr}]
set_load -pin_load -min  1  [get_ports {cwr}]
set_load -pin_load -max  1  [get_ports {caddr_wr[11]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[11]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[10]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[10]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[9]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[9]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[8]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[8]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[7]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[7]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[6]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[6]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[5]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[5]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[4]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[4]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[3]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[3]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[2]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[2]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[1]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[1]}]
set_load -pin_load -max  1  [get_ports {caddr_wr[0]}]
set_load -pin_load -min  1  [get_ports {caddr_wr[0]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[19]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[19]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[18]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[18]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[17]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[17]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[16]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[16]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[15]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[15]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[14]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[14]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[13]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[13]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[12]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[12]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[11]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[11]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[10]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[10]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[9]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[9]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[8]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[8]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[7]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[7]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[6]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[6]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[5]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[5]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[4]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[4]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[3]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[3]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[2]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[2]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[1]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[1]}]
set_load -pin_load -max  1  [get_ports {cdata_wr[0]}]
set_load -pin_load -min  1  [get_ports {cdata_wr[0]}]
set_load -pin_load -max  1  [get_ports {crd}]
set_load -pin_load -min  1  [get_ports {crd}]
set_load -pin_load -max  1  [get_ports {caddr_rd[11]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[11]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[10]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[10]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[9]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[9]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[8]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[8]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[7]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[7]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[6]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[6]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[5]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[5]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[4]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[4]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[3]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[3]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[2]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[2]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[1]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[1]}]
set_load -pin_load -max  1  [get_ports {caddr_rd[0]}]
set_load -pin_load -min  1  [get_ports {caddr_rd[0]}]
set_input_transition 0.5  [get_ports {cdata_rd[19]}]
set_input_transition 0.5  [get_ports {cdata_rd[18]}]
set_input_transition 0.5  [get_ports {cdata_rd[17]}]
set_input_transition 0.5  [get_ports {cdata_rd[16]}]
set_input_transition 0.5  [get_ports {cdata_rd[15]}]
set_input_transition 0.5  [get_ports {cdata_rd[14]}]
set_input_transition 0.5  [get_ports {cdata_rd[13]}]
set_input_transition 0.5  [get_ports {cdata_rd[12]}]
set_input_transition 0.5  [get_ports {cdata_rd[11]}]
set_input_transition 0.5  [get_ports {cdata_rd[10]}]
set_input_transition 0.5  [get_ports {cdata_rd[9]}]
set_input_transition 0.5  [get_ports {cdata_rd[8]}]
set_input_transition 0.5  [get_ports {cdata_rd[7]}]
set_input_transition 0.5  [get_ports {cdata_rd[6]}]
set_input_transition 0.5  [get_ports {cdata_rd[5]}]
set_input_transition 0.5  [get_ports {cdata_rd[4]}]
set_input_transition 0.5  [get_ports {cdata_rd[3]}]
set_input_transition 0.5  [get_ports {cdata_rd[2]}]
set_input_transition 0.5  [get_ports {cdata_rd[1]}]
set_input_transition 0.5  [get_ports {cdata_rd[0]}]
set_load -pin_load -max  1  [get_ports {csel[2]}]
set_load -pin_load -min  1  [get_ports {csel[2]}]
set_load -pin_load -max  1  [get_ports {csel[1]}]
set_load -pin_load -min  1  [get_ports {csel[1]}]
set_load -pin_load -max  1  [get_ports {csel[0]}]
set_load -pin_load -min  1  [get_ports {csel[0]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[1]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[14]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[19]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[7]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[10]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[15]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[3]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[19]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[11]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[6]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[2]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[8]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[15]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[4]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[11]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[16]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[0]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[12]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[7]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[3]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[16]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {ready}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[9]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[12]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[17]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[5]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[13]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[8]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[1]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[4]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[17]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[0]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[18]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {reset}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[6]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[13]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[9]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[2]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[14]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[18]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {idata[10]}]
set_input_delay -add_delay 4 -clock [get_clocks {clk}] [get_ports {cdata_rd[5]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[0]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[5]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[11]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[8]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[1]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[7]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[9]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {csel[1]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[4]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[5]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[3]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[10]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[16]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[0]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[1]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[12]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[6]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {busy}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[9]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[2]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[8]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[10]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {csel[2]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[5]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {crd}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[6]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[17]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[4]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[11]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[1]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[10]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[2]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[7]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[0]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[13]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[3]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[9]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[11]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[6]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[7]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[5]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cwr}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[18]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[2]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[11]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[3]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[1]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[14]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[8]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[10]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[4]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[7]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[19]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[0]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[6]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[8]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {csel[0]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_rd[3]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[4]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {cdata_wr[15]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {iaddr[9]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {caddr_wr[2]}]
set_clock_uncertainty 0.1 [get_clocks {clk}]
