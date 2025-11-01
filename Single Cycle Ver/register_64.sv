`timescale 1ps/1ps
module register_64 (q, d, clk, en);
	output logic [63:0] q;
	input logic [63:0] d;
	input logic clk, en;

	genvar i;
	generate
		for (i = 0; i < 64; i++) begin: eachDFF
			wire temp;
			mux2_1 muxxy (.out(temp), .i0(q[i]), .i1(d[i]), .sel(en));
         D_FF flippyflop (.q(q[i]), .d(temp), .clk(clk));
		end
	endgenerate
endmodule 