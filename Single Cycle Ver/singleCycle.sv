module singleCycle (clk);
	input logic clk;
	output logic;
	
	// generate instruction!
	
	logic [31:0] instr;
	wire [63:0] pc, newpc, bor4, branch;
	logic UncondBr, BrTaken, Reg2Loc, RegWrite, ALUSrc, MemWrite, MemToReg; // controls
	
	programCounter current (.q(pc), .d(newpc), .clk(clk), .reset(reset)); // out to pc, in from newpc
	
	wire [63:0] updateloc, uncond, cond;
	sign_extend #(.WIDTH(26)) unc (.out(), .in(instr[25:0]))
	mux_64_2_1 CondUncond (.out(updateloc), .A(), .B(), .sel(UncondBr)); 
	
	wire [63:0] noBrPc, BrPc;
	adder_64 noBr (.out(noBrPc), .A(pc), .B());
	adder_64 Br (.out(BrPc), .A(pc), .B(64'd4));
	
	mux_64_2_1 BranchContinue
endmodule
	
	