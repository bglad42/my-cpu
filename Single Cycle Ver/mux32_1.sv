module mux32_1(out, in, sel);
	output logic out;
	input logic [31:0] in;
	input logic [4:0] sel;
	
	logic [3:0] s;
	mux8_1 r0 (.out(s[0]), .in(in[7:0]), 	.sel(sel[2:0]));
	mux8_1 r1 (.out(s[1]), .in(in[15:8]),  .sel(sel[2:0]));
	mux8_1 r2 (.out(s[2]), .in(in[23:16]), .sel(sel[2:0]));
	mux8_1 r3 (.out(s[3]), .in(in[31:24]), .sel(sel[2:0]));
	mux4_1 result (.out(out), .in(s[3:0]), .sel(sel[4:3]));

endmodule 

module mux32_1_testbench();
	logic [31:0] in;
	logic out;
	logic [4:0] sel;
	mux32_1 dut (.out, .in, .sel);
	initial begin
		sel= 5'b00000; in = 32'b00000000000000000000000000000001; #10;
		sel= 5'b00001; in = 32'b00000000000000000000000000000010; #10;
		sel= 5'b00010; in = 32'b00000000000000000000000000000100; #10;
		sel= 5'b11111; in = 32'b10000000000000000000000000000000; #10;
	end
endmodule 