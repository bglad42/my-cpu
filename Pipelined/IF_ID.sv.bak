module IF_ID (clk, PCin, PCout, instr, instr_out, reset);
	input logic clk, reset;
	input logic [63:0] PCin;
	input logic [31:0] instr; // instruction
	output logic [63:0] PCout; // 
	output logic [31:0] instr_out; // instruction out
	
	regmodular #(.WIDTH(64))	PC		(.out(PCout), 		.in(PCin), 	.clk,	.reset);
	regmodular #(.WIDTH(32))	instr (.out(instr_out), .in(instr), .clk, .reset);
	
		
	
endmodule
	
	