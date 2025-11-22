`timescale 1ns/1ps
module mux4_1(out, in, sel);
	input logic [3:0] in;
	input logic [1:0] sel;
	output logic out;
	logic s0, s1;
	mux2_1 r0(.i0(in[0]), .i1(in[1]), .sel(sel[0]), .out(s0));
	mux2_1 r1(.i0(in[2]), .i1(in[3]), .sel(sel[0]), .out(s1));
	mux2_1 r2(.i0(s0), .i1(s1), .sel(sel[1]), .out(out));
endmodule 

module mux4_1_testbench();
	logic [3:0] in;
	logic [1:0] sel;
	logic out;
	
	mux4_1 dut (out, in , sel);
	initial begin 
		in = 4'b1010; 	#1000;
		sel = 2'b00; 	#50;
		sel = 2'b01; 	#50;
		sel = 2'b10; 	#50;
		sel = 2'b11;	#50;
	end
endmodule