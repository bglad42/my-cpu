`timescale 1ns/1ps
module mux8_1(out, in, sel);
	output logic out;
	input logic [7:0] in;
	input logic [2:0] sel;
	
	logic s0, s1;
	mux4_1 r0 (.out(s0), .in(in[3:0]), .sel(sel[1:0]));
	mux4_1 r1 (.out(s1), .in(in[7:4]), .sel(sel[1:0]));
	mux2_1 result (.out(out), .i0(s0), .i1(s1), .sel(sel[2]));

endmodule 