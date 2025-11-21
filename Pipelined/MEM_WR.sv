`timescale 1ns/1ps
module MEM_WR (RegWrite, RegWrite_out, Rd, Rd_out, WriteData, WriteData_out, clk, reset);
	input logic RegWrite, clk, reset;
	input logic [4:0] Rd;
	input logic [63:0] WriteData;
	output logic RegWrite_out;
	output logic [4:0] Rd_out;
	output logic [63:0] WriteData_out;
	
	D_FF RegWrite_MEM (.q(RegWrite_out), .d(RegWrite), .clk, .reset);
	regmodular #(.WIDTH(5)) Rd_MEM (.out(Rd_out), .in(Rd), .clk, .reset);	
	regmodular #(.WIDTH(64)) WriteData_MEM (.out(WriteData_out), .in(WriteData), .clk, .reset);
	
endmodule
	
	
	