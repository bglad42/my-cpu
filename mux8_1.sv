`timescale 1ps/1ps
module mux8_1(out, in, sel);
	output logic out;
	input logic [7:0] in;
	input logic [2:0] sel;
	
	logic s0, s1;
	mux4_1 r0 (.out(s0), .i0(in[0]), .i1(in[1]), .i2(in[2]), .i3(in[3]), .sel0(sel[0]), .sel1(sel[1]));
	mux4_1 r1 (.out(s1), .i0(in[4]), .i1(in[5]), .i2(in[6]), .i3(in[7]), .sel0(sel[0]), .sel1(sel[1]));
	mux2_1 result (.out(out), .i0(s0), .i1(s1), .sel(sel[2]));

endmodule 