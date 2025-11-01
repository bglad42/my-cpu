module singleCycle (clk);
	input logic clk, reset;
	output logic;
	
	// generate instruction!
	
	logic [31:0] instr;
	wire [63:0] pc, newpc, bor4, four, branch;
	
	assign four = 64'd4;
	genvar i;
	generate begin
		for (i = 0; i < 64; i++) begin
			mux_2_1 brtaken (.out(bor4), .i0(branch[i]), .i1(four[i]), .sel(branchTaken)); // define this flag
		end
	endgenerate
	
	adder_64 next (.out(newpc), .A(pc), .B(bor4));
	programCounter current (.q(pc), .d(newpc), .clk(clk), .reset(reset));
	
	