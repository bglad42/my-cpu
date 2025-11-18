module ID_EX (//controls
					RegWrite, MemWrite, ALUOp, ALUSrc, MemToReg, flagWrite, 
					RegWrite_out, MemWrite_out, ALUOp_out, ALUSrc_out, MemToReg_out, instr_out, flagWrite_out
					// operations/operators
					Imm12Ext, Daddr9Ext, LS, Rd, dA, dB,
					Imm12Ext_out, Daddr9Ext_out, LS_out, Rd_out, dA_out, dB_out,
					// inputs
					clk, reset);
	
	input logic RegWrite, MemWrite, MemToReg, flagWrite, clk, reset;
	input logic [1:0] ALUSrc;
	input logic [2:0] ALUOp;
	input logic [4:0] Rd;
	input logic [63:0] dA, dB, LS; 
	output logic RegWrite_out, MemWrite_out, ALUOp_out, ALUSrc_out, MemToReg_out, instr_out, flagWrite_out;
	output logic
					
	
	D_FF (.q(RegWrite_out), .d(RegWrite), .clk, .reset);
	D_FF (.q(MemWrite_out), .d(MemWrite), .clk, .reset);
	D_FF (.q(flagWrite_out), .d(flagWrite), .clk, .reset);
	
	regmodular #(.WIDTH(2)) (.out(ALUSrc_out), .in(ALUSrc), .clk, .reset);
	regmodular #(.WIDTH(3)) (.out(ALUOp_out), .in(ALUOp), .clk, .reset);
	regmodular #(.WIDTH(64)) (.out(dA_out), .in(dA), .clk, .reset);
	regmodular #(.WIDTH(64)) (.out(dB_out), .in(dB), .clk, .reset);
endmodule 