`timescale 1ns/1ps

module nor_64 (in, out);
	input logic [63:0] in;
	output logic out;
	
	wire a, b, c, d;
	
	nor_16 one (.out(a), .in(in[15:0]));
	nor_16 two (.out(b), .in(in[31:16]));
	nor_16 three (.out(c), .in(in[47:32]));
	nor_16 four (.out(d), .in(in[63:48]));
	
	and #50 (out, a, b, c, d);
	
endmodule 