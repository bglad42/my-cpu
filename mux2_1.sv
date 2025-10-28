`timescale 1ps/1ps

module mux2_1(out, i0, i1, sel);
	output logic out;
	input logic i0, i1, sel;
	logic t0, t1, t2;
	not #50 (t0, sel);
	and #50 r0 (t1, i1, sel);
	and #50 r1 (t2, i0, t0);
	or #50 result (out, t1, t2);
endmodule
