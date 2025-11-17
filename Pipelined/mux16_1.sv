module mux16_1(out, i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, sel0, sel1, sel2, sel3);
	output logic out;
	input logic i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, sel0, sel1, sel2, sel3;
	
	logic s0, s1;
	mux8_1 r0 (.out(s0), .i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7), .sel0(sel0), .sel1(sel1), .sel2(sel2));
	mux8_1 r1 (.out(s0), .i0(i8), .i1(i9), .i2(i10), .i3(i11), .i4(i12), .i5(i13), .i6(i14), .i7(i15), .sel0(sel0), .sel1(sel1), .sel2(sel2));
	mux2_1 result (.out(out), .i0(s0), .i1(s1), .sel(sel3));

endmodule 