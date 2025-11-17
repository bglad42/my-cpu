`timescale 1ps/1ps
module sign_extend #(parameter WIDTH = 1) (out, in);
	input logic [WIDTH-1:0] in;
	output logic [63:0] out;
	
	logic msb;
	assign msb = in[WIDTH-1];
	  
	genvar i;
	generate
		for (i = 0; i < WIDTH; i++) begin : old
			assign out[i] = in[i];
		end
	
		for (i = WIDTH; i < 64; i++) begin : upper
			assign out[i] = msb;
		end
	endgenerate
	
endmodule

module sign_extend_tb();
	logic [63:0] out;
	logic [4:0] in;
	
	
	sign_extend #(.WIDTH(5)) dut (.out, .in);
	
	initial begin
		in = 5'b10011; #10;
		in = 5'b00011; #10;
	end
endmodule
