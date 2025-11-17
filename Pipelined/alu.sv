`timescale 1ns/1ps
module alu (result, A, B, cntrl, negative, zero, overflow, carry_out);

	output logic [63:0] result;
	output logic negative, zero, overflow, carry_out;
	input logic [63:0] A, B;
	input logic [2:0] cntrl;
	
	logic [63:0] ops [0:7]; // all possible operation results
	assign ops[0] = B;
	
	// Addition and subtraction unit
	
	wire [63:0] last; // last carry in
	logic [63:0] as;
	
	fullAdderSubtractor addsubZero (.A(A[0]), .B(B[0]), .Cin(cntrl[0]), .Cout(last[0]),
												.sum(as[0]), .subtract(cntrl[0])); 						// correctly process potential subtraction op
	
	genvar i, j;
	generate
		for (i = 1; i < 64; i++) begin : eachBit
			fullAdderSubtractor addsub (.A(A[i]), .B(B[i]), .Cin(last[i-1]), .Cout(last[i]), 
												.sum(as[i]), .subtract(cntrl[0]));
		end
	endgenerate	
												
	assign carry_out = last[63];								// correctly set carry_out flag	
	xor #50 (overflow, last[63], last[62]); 				// set overflow flag
	
	
	assign ops[2] = as; // addition
	assign ops[3] = as; // subtraction	
	
	// Logical operations + final out?
	logic [63:0] finout;
	generate
		for (j = 0; j < 64; j++) begin : eachLog
			wire [7:0] connector;
			and #50 (ops[4][j], A[j], B[j]);
			or  #50 (ops[5][j], A[j], B[j]);
			xor #50 (ops[6][j], A[j], B[j]);
			for (i = 0; i < 8; i++) begin : loader
				assign connector[i] = ops[i][j]; // load in specific bit of specific operation
			end
			mux8_1 finalsel (.out(finout[j]), .in(connector), .sel(cntrl)); // select the operation
		end
	endgenerate
	
	assign negative = finout[63];	
	nor_64 zeroFlag (.out(zero), .in(finout));
	assign result = finout;
	
endmodule 