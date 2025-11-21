# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./mux2_1.sv"
vlog "./mux4_1.sv"
vlog "./mux8_1.sv"
vlog "./mux16_1.sv"
vlog "./mux32_1.sv"
vlog "./mux_64_2_1.sv"
vlog "./mux_64_32_1.sv"
vlog "./decoder_3_8.sv"
vlog "./decoder_2_4.sv"
vlog "./decoder_5_32.sv"
vlog "./D_FF.sv"
vlog "./alustim.sv"
vlog "./nor_16.sv"
vlog "./nor_64.sv"
vlog "./alu.sv"
vlog "./fullAdder.sv"
vlog "./fullAdderSubtractor.sv"
vlog "./regfile.sv"
vlog "./register_64.sv"
vlog "./sign_extend.sv"
vlog "./adder_64.sv"
vlog "./datamem.sv"
vlog "./instructmem.sv"
vlog "./programCounter.sv"
vlog "./pipelined.sv"
vlog "./controls.sv"
vlog "./zero_extend.sv"
vlog "./D_FF_en.sv"
vlog "./IF_ID.sv"
vlog "./ID_EX.sv"
vlog "./EX_MEM.sv"
vlog "./MEM_WR.sv"
vlog "./regmodular.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -novopt -voptargs="+acc" -lib work pipelined_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
