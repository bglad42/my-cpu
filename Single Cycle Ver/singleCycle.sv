module singleCycle (clk, reset);
	input logic clk, reset;
	output logic;
	
	// generate instruction!
	
	logic [31:0] instr;
	wire [63:0] pc, newpc;
	logic UncondBr, BrTaken, Reg2Loc, RegWrite, ALUSrc, MemWrite, MemToReg; // controls
	logic [2:0] ALUOp; // more control
	logic [3:0] ALUSrc; // more
	
	// flags
	
	logic zero, overflow, carryout, negative;
	
	D_FF zeroFlag 		(.q(zero), 		.d(ALUz), .clk(clk), .reset(reset));
	D_FF overflowFlag (.q(overflow), .d(ALUo), .clk(clk), .reset(reset));
	D_FF carryoutFlag (.q(carryout), .d(ALUc), .clk(clk), .reset(reset));
	D_FF negativeFlag (.q(negative), .d(ALUn), .clk(clk), .reset(reset));
	
	instructmem instruction (.out(instr), .in(pc), .clk(clk));
	
	controls broisthethinker (.Reg2Loc(Reg2Loc), .UncondBr(UncondBr), .BrTaken(BrTaken), .RegWrite(RegWrite),
									  .MemWrite(MemWrite), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .MemToReg(MemToReg), .instr(instr)); // gen control signals
									  
	/* BIG IFETCH BLOCK start*/
	
	programCounter current (.q(pc), .d(newpc), .clk(clk), .reset(reset)); // out to pc, in from newpc
	
	wire [63:0] updateloc, uncond, cond, branch, nobranch;
	
	sign_extend #(.WIDTH(26)) unc (.out(uncond), .in(instr[25:0])); // se BrAddr26
	sign_extend #(.WIDTH(19)) con (.out(cond), .in(instr[23:5])); // se CondAddr19
	
	mux_64_2_1 CondUncond (.out(updateloc), .A(cond), .B(uncond), .sel(UncondBr)); // selecting UncondBranch or not
	shifter shifty (.value(updateloc), .direction(1'b0), .distance(6'd2), .result(branch)); //shift result 2 for branch addition
	adder_64 BranchPCUpdate (.out(branchPC), .A(pc), .B(branch)); // add branch to pc, send to branchPC for update
	adder_64 PCUpdate (.out(nobranch), .A(pc), .B(64'd4)); // update pc on no branch
	mux_64_2_1 branchOrNot (.out(newpc), .A(nobranch), .B(branchPC), .sel(BrTaken)); // select new pc address 
	
	/* BIG IFETCH BLOCK END */
	
	/* ////////////////////////////////////////////////////////////////////////////// */
	
	/* the rest of the owl */
	
	logic [4:0] Rd, Rm, Rn;
	assign Rd = instr[4:0];
	assign Rn = instr[9:5];
	assign Rm = instr[20:16];
	
	wire [63:0] Dw;
	wire [4:0] Ain
	
	genvar i;
	generate begin
		for (i = 0; i < 5; i++): eachMux
			mux_2_1 whichin (.out(Ain[i]), .i0(Rn[i]), .i1(Rm[i]), .sel(Reg2Loc)); 
		end
	endgenerate
	
	regfile reggie (.ReadData1(Da), .ReadData2(Db), .WriteData(Dw), .ReadRegister1(Ain),
						ReadRegister2(Rn), .WriteRegister(Rd), .RegWrite(RegWrite), .clk(clk), .reset(reset)); // figure out wite data and put here
						
	wire [63:0] ALUResult, DAddr, ALUBin, Imm;
	
	sign_extend #(.WIDTH(9)) Addr (.out(DAddr), .in(instr[20:12])); // Prepare address for LDUR/STUR
	
	// mux_64_2_1 ALUBinputSrc (.out(ALUBin), .A(Db), .B(DAddr), .sel(ALUSrc)); // replace for imm12
	
	zero_extend #(.WIDTH(12)) Imm12 (.out(Imm), .in(instr[21:10]));
	
	generate begin
		for (i = 0; i < 64; i++): each4Mux
			wire [3:0] temp;
			assign temp[0] = Db[i];
			assign temp[1] = DAddr[i];
			assign temp[2] = Imm[i];
			assign temp[3] = 1'bX;
			mux_4_1(.out(ALUBin), .in(temp), .sel(ALUSrc));
		end
	endgenerate
	
	wire ALUz, ALUo, ALUc, ALUn;
	
	alu ALU (.result(ALUResult), .A(Da), .B(ALUBin), .cntrl(ALUOp), .negative(ALUn), .zero(ALUz), .overflow(ALUo), .carry_out(ALUc)); //might need flag registers?
	
	wire [63:0] dataOut;
	datamem dataMemory (.address(ALUResult), .write_enable(MemWrite), .read_enable(1'b1) /*temp*/, // read up on xfer size, read enable reqs
								.write_data(Db), .clk(clk), .xfer_size(1'b1), .read_data(dataOut));
								*
	mux_64_2_1 toReg (.out(Dw), .A(ALUResult), .B(dataOut), .sel(MemToReg));

endmodule
	
	