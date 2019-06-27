# CHIP Level Constraint

set cycle 8.0                
# you can only modify the above parameter
set t_in  [expr $cycle/2]
set t_out 0.2

# clock constraints
create_clock -period $cycle    [get_ports clk]
set_dont_touch_network         [get_clocks clk]
set_fix_hold                   [get_clocks clk]
set_ideal_network              [get_ports clk]
set_clock_uncertainty  0.1     [get_clocks clk]
set_clock_latency      0.5     [get_clocks clk]
set_input_transition   0.5     [all_inputs]
set_clock_transition   0.1     [all_clocks]
set_input_delay  $t_in  -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay $t_out -clock clk [all_outputs]



# 6 environment settings
set_operating_conditions -min fast  -max slow
set_load   4   [all_outputs]
set_wire_load_model -name tsmc13_wl10 -library slow
