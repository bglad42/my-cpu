`timescale 1ps/1ps
module mux_64_32_1 (out, in, ReadRegister);
	
	output logic [63:0] out;
	input logic [31:0][63:0] in;
	input logic [4:0] ReadRegister;
	
	
	genvar i, j;
	generate
		for (i = 0; i < 64; i++) begin: eachMux // for every multiplexor
			logic [31:0] r;
			for (j = 0; j < 32; j++) begin: col
				assign r[j] = in[j][i]; 
			end
			mux32_1 muxxy (.out(out[i]), .i(r), .sel(ReadRegister)); 
		end
	endgenerate
endmodule

module mux_64_32_1_testbench();
	logic [31:0][63:0] in;
	logic [63:0] out;
	logic [4:0] ReadRegister;
	mux_64_32_1 dut (.out, .in, .ReadRegister);
	
	initial begin
		integer i;
		for (i = 0; i < 32; i++) begin
			in[i] = i;
		end #10
		for (i = 0; i < 32; i++) begin
			ReadRegister = i; #10;
		end
	end
endmodule 


	
	