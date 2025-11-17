`timescale 1ps/1ps
module zero_extend #(parameter WIDTH = 1) (out, in);
	input logic [WIDTH-1:0] in;
	output logic [63:0] out;
	
	genvar i;
	generate
		for (i = 0; i < WIDTH; i++) begin : wiring
			assign out[i] = in[i];
		end
		assign out[63:WIDTH] = 0;
	endgenerate
	
endmodule 

module zero_extend_tb();
	logic [63:0] out;
	logic [11:0] in;
	
	
	zero_extend #(.WIDTH(12)) dut (.out, .in);
	
	initial begin
		in = 12'hFFF; #100;
	end
endmodule