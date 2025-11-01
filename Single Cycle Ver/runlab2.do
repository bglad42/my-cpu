# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./mux2_1.sv"
vlog "./mux4_1.sv"
vlog "./mux8_1.sv"
vlog "./mux32_1.sv"
vlog "./mux_64_32_1.sv"
vlog "./decoder_2_4.sv"
vlog "./decoder_3_8.sv"
vlog "./decoder_5_32.sv"
vlog "./D_FF.sv"
vlog "./register_64.sv"
vlog "./regstim.sv"
vlog "./regfile.sv"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work decoder_2_4_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do mux2_1_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
