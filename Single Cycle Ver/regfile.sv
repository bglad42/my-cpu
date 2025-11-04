module regfile (ReadData1, ReadData2, WriteData, 
					 ReadRegister1, ReadRegister2, WriteRegister,
					 RegWrite, clk, reset);
					 
	output logic [63:0] ReadData1, ReadData2;
	input logic RegWrite, clk, reset;
	input logic [4:0] ReadRegister1, ReadRegister2, WriteRegister;		 
	input logic [63:0] WriteData;
	
	logic [31:0] w;
	logic [31:0][63:0] dat;
	
	// Decoder
	decoder_5_32 dec (.in(WriteRegister), .out(w), .RegWrite(RegWrite));
	
	// DFF registers
	genvar i;
	generate
		for (i = 0; i < 31; i++) begin : eachRegister
			register_64 reggie(.q(dat[i]), .d(WriteData), .clk(clk), .en(w[i]), .reset(reset)); // 0-30
		end
	endgenerate
	
	register_64 reggie31 (.q(dat[31]), .d(64'b0), .clk(clk), .en(w[31]), .reset(reset)); // 0 register
	
	// Multiplexors
	
	mux_64_32_1 mux1 (.out(ReadData1), .in(dat), .ReadRegister(ReadRegister1));
	mux_64_32_1 mux2 (.out(ReadData2), .in(dat), .ReadRegister(ReadRegister2));
	
endmodule 