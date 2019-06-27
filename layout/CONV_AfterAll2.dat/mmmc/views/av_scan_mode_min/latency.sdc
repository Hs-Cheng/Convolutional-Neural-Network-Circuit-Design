set_clock_latency 0.5  [get_clocks {clk}]
set_clock_latency -source -early -min -rise  0.110369 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -min -fall  0.100465 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -min -rise  0.110369 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -min -fall  0.100465 [get_ports {clk}] -clock clk 
