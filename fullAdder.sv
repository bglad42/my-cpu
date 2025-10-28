`timescale 1ps/1ps

module fullAdder (sum, Cout, Cin, A, B);
	output logic sum, Cout;
	input logic A, B, Cin;
	
	wire AC, AB, BC;
	xor #50 (sum, A, B, Cin);
	
	nand #50 (AC, A, Cin);
	nand #50 (AB, A, B);
	nand #50 (BC, B, Cin);
	
	nand #50 (Cout, AC, AB, BC);
	
endmodule 