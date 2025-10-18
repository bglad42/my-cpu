`timescale 1ps/1ps
module decoder_3_8 (out, in, en);
	input logic [2:0] in;
	output logic [7:0] out;
	input logic en;
	logic [2:0] n;
	
	not #50 (n[0], in[0]);
	not #50 (n[1], in[1]);
	not #50 (n[2], in[2]);
	
	and #50 (out[0], n[0], n[1], n[2], en);
	and #50 (out[1], in[0], n[1], n[2], en);
	and #50 (out[2], n[0], in[1], n[2], en);
	and #50 (out[3], in[0], in[1], n[2], en);
	and #50 (out[4], n[0], n[1], in[2], en);
	and #50 (out[5], in[0], n[1], in[2], en);
	and #50 (out[6], n[0], in[1], in[2], en);
	and #50 (out[7], in[0], in[1], in[2], en);
	
endmodule

module decoder_3_8_testbench();

	logic [2:0] in;
	logic [7:0] out;
	logic en;
	
	decoder_3_8 dut (.in(in), .out(out), .en(en));
	
	initial begin
		integer i;
		in = 3'b000;
		en = 1'b1; #100;
		for (i = 0; i < 8; i++) begin
			in = i; #5000;
		end
	end
	
endmodule 
	
	