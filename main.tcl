# Import Design
read_file -format verilog  "./CONV.v"

source -echo -verbose ./CONV.sdc

# Compile Design

set high_fanout_net_threshold 0

uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

compile_ultra 

report_timing

# Output Design

remove_unconnected_ports -blast_buses [get_cells -hierarchical *]

set bus_inference_style {%s[%d]}
set bus_naming_style {%s[%d]}
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
define_name_rules name_rule -case_insensitive
change_names -hierarchy -rules name_rule

report_area
report_power

write -format verilog -hierarchy -output "CONV_syn.v"
write_sdf -version 1.0 -context verilog -load_delay net CONV_syn.sdf



