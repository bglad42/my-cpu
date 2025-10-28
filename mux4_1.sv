`timescale 1ps/1ps
module mux4_1(i0, i1, i2, i3, sel0, sel1, out);
	input logic i0, i1, i2, i3, sel0, sel1;
	output logic out;
	logic s0, s1;
	mux2_1 r0(.i0(i0), .i1(i1), .sel(sel0), .out(s0));
	mux2_1 r1(.i0(i2), .i1(i3), .sel(sel0), .out(s1));
	mux2_1 r2(.i0(s0), .i1(s1), .sel(sel1), .out(out));
endmodule 