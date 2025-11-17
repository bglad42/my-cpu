`timescale 1ps/1ps
module decoder_2_4 (out, in, en);
	input logic [1:0] in;
	output logic [3:0] out;
	input en;
	
	logic n[1:0];
	not #50 (n[0], in[0]);
	not #50 (n[1], in[1]);
	
	and #50 (out[0], n[0], n[1], en);
	and #50 (out[1], in[0], n[1], en);
	and #50 (out[2], n[0], in[1], en);
	and #50 (out[3], in[0], in[1], en);
	
endmodule 

module decoder_2_4_testbench();

	logic [1:0] in;
	logic [3:0] out;
	logic en;
	
	decoder_2_4 dut (.in(in), .out(out), .en(en));
	
	initial begin
		en = 1;
		in = 2'b00; #5000;
		in = 2'b01; #5000;
		in = 2'b10; #5000;
		in = 2'b11; #5000;
		en = 0;		#5000;
		in = 2'b00; #5000;
		in = 2'b01; #5000;
		in = 2'b10; #5000;
		in = 2'b11; #5000;
	end
	
endmodule 