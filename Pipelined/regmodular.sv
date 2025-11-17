module regmodular #(parameter WIDTH = 1) (out, in, clk, reset);
	output logic [WIDTH-1:0] out;
	input logic clk, reset;
	input logic [WIDTH-1:0] in;
	
	genvar i;
	generate
		for (i = 0; i < WIDTH; i++) begin : eachDFF
			D_FF val (.q(out[i]), .d(in[i]), .clk(clk), .reset(reset));
		end
	endgenerate
endmodule 