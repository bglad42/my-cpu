module D_FF_en (q, d, clk, reset, en);
	input logic d, clk, reset, en;
	output logic q;
	
	logic temp;
	mux2_1 hold (.out(temp), .i0(1'b0), .i1(d), .sel(en));
	D_FF val (.q(q), .d(temp), .reset(reset), .clk(clk));
	
endmodule 