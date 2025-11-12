`timescale 1ps/1ps
module mux_64_2_1 (out, A, B, sel);
	output logic [63:0] out;
	input logic [63:0] A, B;
	input logic sel;
	
	genvar i;
	generate 
		for (i = 0; i < 64; i++) begin : eachMux
			mux2_1 remux (.out(out[i]), .i0(A[i]), .i1(B[i]), .sel(sel));
		end
	endgenerate
endmodule

module mux_64_2_1_tb();
	logic [63:0] A, B, out;
	logic sel;
	
	mux_64_2_1 dut (.A, .B, .out, .sel);
	
	initial begin
		A = 64'd0; B = 64'hFFFFFFFFFFFFFFFF; sel = 1'b0; #1000;
		sel = 1'b1; #1000;
	end
endmodule
