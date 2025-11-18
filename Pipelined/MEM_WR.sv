module MEM_WR (RegWrite, RegWrite_out, Rd, Rd_out, Data, DataOut, clk, reset);
	input logic RegWrite;
	input logic [4:0] Rd;
	input logic [63:0] Data;
	output logic RegWrite_out;
	output logic [4:0] Rd_out;
	output logic [63:0] Data_out;
	
	D_FF RegWrite_MEM (.q(RegWrite_out), .d(RegWrite), .clk, .reset);
	regmodular #(.WIDTH(5)) Rd_MEM (.out(Rd_out), .in(Rd), .clk, .reset);
	regmodular #(.WIDTH(64)) Rd_MEM (.out(Rd_out), .in(Rd), .clk, .reset);
	
endmodule
	
	
	