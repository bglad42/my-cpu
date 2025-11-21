`timescale 1ns/1ps
module EX_MEM (Db, Daddr9Ext, MemWrite, MemToReg, FlagWrite, RegWrite, Rd, clk, reset, ALUResult, ALUResult_out,
					Db_out, Daddr9Ext_out, MemWrite_out, MemToReg_out, FlagWrite_out, RegWrite_out, Rd_out);
	
	input logic MemWrite, FlagWrite, RegWrite, MemToReg, clk, reset;
	input logic [4:0] Rd;
	input logic [63:0] Db, Daddr9Ext, ALUResult;
	output logic MemWrite_out, FlagWrite_out, RegWrite_out, MemToReg_out;
	output logic [4:0] Rd_out;
	output logic [63:0] Db_out, Daddr9Ext_out, ALUResult_out;
	
	D_FF MemWrite_EX (.q(MemWrite_out), .d(MemWrite), .reset, .clk);
	D_FF RegWrite_EX (.q(RegWrite_out), .d(RegWrite), .reset, .clk);
	D_FF FlagWrite_Ex (.q(FlagWrite_out), .d(FlagWrite), .reset, .clk);
	D_FF MemToReg_EX (.q(MemToReg_out), .d(MemToReg), .clk, .reset);
	
	regmodular #(.WIDTH(5)) Rd_EX (.out(Rd_out), .in(Rd), .clk, .reset);
	regmodular #(.WIDTH(64)) Db_EX (.out(Db_out), .in(Db), .clk, .reset);
	regmodular #(.WIDTH(64)) Daddr9Ext_EX (.out(Daddr9Ext_out), .in(Daddr9Ext), .clk, .reset);
	regmodular #(.WIDTH(64)) data_EX (.out(ALUResult_out), .in(ALUResult), .clk, .reset);

endmodule 