`timescale 1ps/1ps
module programCounter (q, d, clk, reset);
	output logic [63:0] q;
	input logic [63:0] d;
	input logic clk, en;

	genvar i;
	generate
		for (i = 0; i < 64; i++) begin: eachDFF
         D_FF flippyflop (.q(q[i]), .d(d[i]), .clk(clk), .reset(reset));
		end
	endgenerate
endmodule 