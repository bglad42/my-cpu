`timescale 1ns/1ps

module nor_16 (out, in);

	input logic [15:0] in;
	output logic out;
	
	wire a, b, c, d;
	nor #50 (a, in[0], in[1], in[2], in[3]);
	nor #50 (b, in[4], in[5], in[6], in[7]);
	nor #50 (c, in[8], in[9], in[10], in[11]);
	nor #50 (d, in[12], in[13], in[14], in[15]);
	and #50 (out, a, b, c, d);
	
endmodule 