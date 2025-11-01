module mux32_1(out, i, sel);
	output logic out;
	input logic [31:0] i;
	input logic [4:0] sel;
	
	logic s0, s1, s2, s3;
	mux8_1 r0 (.out(s0), .i0(i[0]), .i1(i[1]), .i2(i[2]), .i3(i[3]), .i4(i[4]), .i5(i[5]), .i6(i[6]), .i7(i[7]),
				.sel0(sel[0]), .sel1(sel[1]), .sel2(sel[2]));
	mux8_1 r1 (.out(s1), .i0(i[8]), .i1(i[9]), .i2(i[10]), .i3(i[11]), .i4(i[12]), .i5(i[13]), .i6(i[14]), .i7(i[15]),
				.sel0(sel[0]), .sel1(sel[1]), .sel2(sel[2]));
	mux8_1 r2 (.out(s2), .i0(i[16]), .i1(i[17]), .i2(i[18]), .i3(i[19]), .i4(i[20]), .i5(i[21]), .i6(i[22]), .i7(i[23]),
				.sel0(sel[0]), .sel1(sel[1]), .sel2(sel[2]));
	mux8_1 r3 (.out(s3), .i0(i[24]), .i1(i[25]), .i2(i[26]), .i3(i[27]), .i4(i[28]), .i5(i[29]), .i6(i[30]), .i7(i[31]),
				.sel0(sel[0]), .sel1(sel[1]), .sel2(sel[2]));
	mux4_1 result (.out(out), .i0(s0), .i1(s1), .i2(s2), .i3(s3), .sel0(sel[3]), .sel1(sel[4]));

endmodule 

module mux32_1_testbench();
	logic [31:0] i;
	logic out;
	logic [4:0] sel;
	mux32_1 dut (.out, .i, .sel);
	initial begin
		sel= 5'b00000; i = 32'b00000000000000000000000000000001; #10;
		sel= 5'b00001; i = 32'b00000000000000000000000000000010; #10;
		sel= 5'b00010; i = 32'b00000000000000000000000000000100; #10;
		sel= 5'b11111; i = 32'b10000000000000000000000000000000; #10;
	end
endmodule 