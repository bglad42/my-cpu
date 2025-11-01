`timescale 1ps/1ps

module fullAdderSubtractor (A, B, Cout, Cin, sum, subtract);
	
	output logic Cout, sum;
	input logic A, B, Cin, subtract;
	
	wire bi, bin;
	
	not #50 (bi, B);
	mux2_1 sub (.out(bin), .i0(B), .i1(bi), .sel(subtract));
	fullAdder add (.sum(sum), .A(A), .B(bin), .Cout(Cout), .Cin(Cin));
	
endmodule 