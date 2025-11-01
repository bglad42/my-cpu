`timescale 1ps/1ps
module decoder_5_32 (out, in, RegWrite);
	output logic [31:0] out;
	input logic [4:0] in; // select register
	input logic RegWrite;
	
	
	logic [3:0] enables;
	
	decoder_2_4 td (.out(enables), .in(in[4:3]), .en(RegWrite));
	
	decoder_3_8 dec0 (.out(out[7:0]), .in(in[2:0]), .en(enables[0]));
	decoder_3_8 dec1 (.out(out[15:8]), .in(in[2:0]), .en(enables[1]));
	decoder_3_8 dec2 (.out(out[23:16]), .in(in[2:0]), .en(enables[2]));
	decoder_3_8 dec3 (.out(out[31:24]), .in(in[2:0]), .en(enables[3]));
	
endmodule

module decoder_5_32_testbench();

	logic [4:0] in;
	logic [31:0] out;
	logic RegWrite;
	
	decoder_5_32 dut (.in(in), .out(out), .RegWrite(RegWrite));
	
	initial begin
		
		integer i;
		RegWrite = 1'b1; #100;
		for (int i = 0; i < 32; i++) begin
			in = i; #5000;
		end
		RegWrite = 0; #100;
		for (int i = 0; i < 32; i++) begin
			in = i; #5000;
		end
	end
	
endmodule 