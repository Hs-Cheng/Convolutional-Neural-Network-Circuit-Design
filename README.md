# Convolutional-Neural-Network-Circuit-Design
Final project of Integrated Circuit Design

# 1. RTL level design methodology
We maintain a table, which has a size of 4x66, to store the input data from the testbench. The width of the table is 66 because we can set all element of this table to zero at the reset stage of the program, and store the input data from table[1] to table[64]. By doing so, the zero-padding task is fulfilled automatically. After that, we calculate the result of convolution, then do the "ReLU" step, and store the result into the testbench. We request the input data from the testbench by using the address signal in the following order: 0, 64, 1, 65, 2, 66, ...... This can make sure that we can output the result to layer 0, layer 1, and layer 2 continuously. When all the data are generated successfully, the program will go to the idle state, waiting for the next image to process. The program will start to process the next image when the "ready" signal is triggered again.
Our RTL code can pass the simulation successfully.
  
# 2. Gate level simulation
Our CONV_syn.v can also pass the simulation under a clock cycle of 6ns. The following
are the area report and the simulation result.
   
# 3. Transistor level simulation
Our CONV_APR.v can pass the simulation under a clock cycle of 10.7ns. During
simulation, there will be lots of glitch suppression warnings. But that is acceptable during transistor level simulation. The following are the simulation result and the core area report.
   
