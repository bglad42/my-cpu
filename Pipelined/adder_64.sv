`timescale 1ns/1ps
module adder_64 (out, A, B);
	input logic [63:0] A, B;
	output logic [63:0] out;
	
	wire [63:0] last;
	
	fullAdder addyFirst (.sum(out[0]), .A(A[0]), .B(B[0]), .Cin(1'b0), .Cout(last[0]));
	genvar i;
	generate
		for (i = 1; i < 64; i++) begin : eachadder
			fullAdder addy (.sum(out[i]), .A(A[i]), .B(B[i]), .Cin(last[i-1]), .Cout(last[i]));
		end
	endgenerate
endmodule 

module adder_64_tb();
	logic [63:0] out, A, B;
	
	adder_64 dut(.out(out), .A(A), .B(B));
	
	int i;
	initial begin
		A = 64'd4;B = 64'd2;	#500;
	end
endmodule
		