`timescale 1ns/1ps
module ID_EX (//controls
					RegWrite, MemWrite, ALUOp, ALUSrc, MemToReg, flagWrite, 
					RegWrite_out, MemWrite_out, ALUOp_out, ALUSrc_out, MemToReg_out, flagWrite_out,
					// operations/operators
					Imm12Ext, Daddr9Ext, LS, Rd, Da, Db,
					Imm12Ext_out, Daddr9Ext_out, LS_out, Rd_out, Da_out, Db_out,
					// inputs
					clk, reset);
	
	input logic RegWrite, MemWrite, MemToReg, flagWrite, clk, reset;
	input logic [1:0] ALUSrc;
	input logic [2:0] ALUOp;
	input logic [4:0] Rd;
	input logic [63:0] Da, Db, LS, Imm12Ext, Daddr9Ext; 
	output logic RegWrite_out, MemWrite_out, MemToReg_out, flagWrite_out;
	output logic [1:0] ALUSrc_out;
	output logic [2:0] ALUOp_out;
	output logic [4:0] Rd_out;
	output logic [63:0] Da_out, Db_out, LS_out, Imm12Ext_out, Daddr9Ext_out;
					
	
	D_FF RegWrite_ID (.q(RegWrite_out), .d(RegWrite), .clk, .reset);
	D_FF MemWrite_ID (.q(MemWrite_out), .d(MemWrite), .clk, .reset);
	D_FF FlagWrite_ID (.q(flagWrite_out), .d(flagWrite), .clk, .reset);
	D_FF MemToReg_ID (.q(MemToReg_out), .d(MemToReg), .clk, .reset);
	
	
	regmodular #(.WIDTH(2)) ALUSrcReg_ID (.out(ALUSrc_out), .in(ALUSrc), .clk, .reset);
	regmodular #(.WIDTH(3)) ALUOpReg_ID (.out(ALUOp_out), .in(ALUOp), .clk, .reset);
	regmodular #(.WIDTH(64)) DaReg_ID (.out(Da_out), .in(Da), .clk, .reset);
	regmodular #(.WIDTH(64)) DbReg_ID (.out(Db_out), .in(Db), .clk, .reset);
	regmodular #(.WIDTH(64)) LS_ID (.out(LS_out), .in(LS), .clk, .reset);
	regmodular #(.WIDTH(64)) Imm12Ext_ID (.out(Imm12Ext_out), .in(Imm12Ext), .clk, .reset);
	regmodular #(.WIDTH(64)) Daddr9Ext_ID (.out(Daddr9Ext_out), .in(Daddr9Ext), .clk, .reset);

endmodule 