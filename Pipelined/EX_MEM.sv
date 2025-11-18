module EX_MEM (Da, Db, Daddr9Ext, Imm12Ext, ALUOp, MemWrite, FlagWrite, RegWrite, Rd, clk, reset);
	
	input logic MemWrite, FlagWrite, RegWrite;
	input logic [4:0] Rd;
	input logic [2:0] ALUOp;
	input logic [63:0] Da, Db, Daddr9Ext, Imm12Ext;
	output logic MemWrite_out, FlagWrite_out, RegWrite_out;
	output logic [4:0] Rd_out;
	output logic [2:0] ALUOp_out;
	output logic [63:0] Da_out, Db_out, Daddr9Ext_out, Imm12Ext_out;
	
	D_FF MemWriteEX (.q(MemWrite_out), .d(MemWrite), .reset, .clk);
	D_FF RegWriteEX (.q(RegWrite_out), .d(RegWrite), .reset, .clk);
	D_FF FlagWriteEx (.q(FlagWrite_out), .d(FlagWrite), .reset, .clk);
	
	regmodular #(.WIDTH(5)) Rd_EX (.out(Rd_out), .in(Rd), .clk, .reset);
	regmodular #(.WIDTH(3)) ALUOp_EX (.out(Rd_out), .in(Rd), .clk, .reset);
	regmodular #(.WIDTH(64)) Da_EX (.out(Da_out), .in(Da), .clk, .reset);
	regmodular #(.WIDTH(64)) Db_EX (.out(Db_out), .in(Db), .clk, .reset);
