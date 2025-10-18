`timescale 1ps/1ps
module mux8_1(out, i0, i1, i2, i3, i4, i5, i6, i7, sel0, sel1, sel2);
	output logic out;
	input logic i0, i1, i2, i3, i4, i5, i6, i7, sel0, sel1, sel2;
	
	logic s0, s1;
	mux4_1 r0 (.out(s0), .i0(i0), .i1(i1), .i2(i2), .i3(i3), .sel0(sel0), .sel1(sel1));
	mux4_1 r1 (.out(s1), .i0(i4), .i1(i5), .i2(i6), .i3(i7), .sel0(sel0), .sel1(sel1));
	mux2_1 result (.out(out), .i0(s0), .i1(s1), .sel(sel2));

endmodule 