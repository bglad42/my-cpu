`timescale 1ns/1ps
module pipelined (clk, reset);
	input logic clk, reset;
	wire notClk;
	// generate instruction!
	
	wire [31:0] instr;
	wire [63:0] pc, newpc;
	logic UncondBr, BrTaken, Reg2Loc, MemWrite, MemToReg; // controls
	logic [2:0] ALUOp; // more control
	logic [1:0] ALUSrc; // more
	
	logic zero, overflow, carryout, negative;
	wire ALUz, ALUo, ALUc, ALUn, flagWrite_EX;
	
	D_FF_en zeroFlag 		(.q(zero), 		.d(ALUz), .clk, .reset, .en(flagWrite_EX));
	D_FF_en overflowFlag (.q(overflow), .d(ALUo), .clk, .reset, .en(flagWrite_EX));
	D_FF_en carryoutFlag (.q(carryout), .d(ALUc), .clk, .reset, .en(flagWrite_EX));
	D_FF_en negativeFlag (.q(negative), .d(ALUn), .clk, .reset, .en(flagWrite_EX));
	
	wire RegWrite_WR;
	wire [4:0] Rd_WR;
	wire [63:0] WriteData_WR;
	
	// Instruction fetch (IF)
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	programCounter current (.q(pc), .d(newpc), .clk(clk), .reset(reset)); // out to pc, in from newpc
	instructmem instruction (.instruction(instr), .address(pc), .clk(clk));
	
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	wire [63:0] pc_ID;
	wire [31:0] instr_ID;
	IF_ID IF_ID_register (.PCin(pc), .PCout(pc_ID), .instr(instr), .instr_out(instr_ID), .clk, .reset);
	
	
	// Register Fetch (ID)
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	wire [63:0] updateloc, uncond, cond, branch, nobranch, branchPC;
	
	sign_extend #(.WIDTH(26)) unc (.out(uncond), .in(instr_ID[25:0])); // se BrAddr26
	sign_extend #(.WIDTH(19)) con (.out(cond), .in(instr_ID[23:5])); // se CondAddr19
	
	mux_64_2_1 CondUncond (.out(updateloc), .A(cond), .B(uncond), .sel(UncondBr)); // selecting UncondBranch or not
	
	shifter shifty (.value(updateloc), .direction(1'b0), .distance(6'd2), .result(branch)); //shift result 2 for branch addition
	
	adder_64 BranchPCUpdate (.out(branchPC), .A(pc_ID), .B(branch)); // add branch to pc, send to branchPC for update
	adder_64 PCUpdate (.out(nobranch), .A(pc_ID), .B(64'd4)); // update pc on no branch
	mux_64_2_1 branchOrNot (.out(newpc), .A(nobranch), .B(branchPC), .sel(BrTaken)); // select new pc address 
	
	logic [4:0] Rd, Rm, Rn;
	assign Rd = instr_ID[4:0];
	assign Rn = instr_ID[9:5];
	assign Rm = instr_ID[20:16];
	wire [4:0] Bin;
	
	genvar i;
	generate
		for (i = 0; i < 5; i++) begin : eachMux
			mux2_1 whichin (.out(Bin[i]), .i0(Rd[i]), .i1(Rm[i]), .sel(Reg2Loc)); 
		end
	endgenerate
	
	wire [63:0] Da, Db;
						
	wire [63:0] DAddr, Imm, LSR;
	
	sign_extend #(.WIDTH(9)) Addr (.out(DAddr), .in(instr_ID[20:12]));
	zero_extend #(.WIDTH(12)) Imm12 (.out(Imm), .in(instr_ID[21:10]));
	
	shifter LogicalShiftRight (.value(Da), .direction(1'b1), .distance(instr_ID[15:10]), .result(LSR));
	
	not #50 clkHack (notClk, clk);
	
	wire ID_zero;
	nor_64 zeroCheckerEX (.out(ID_zero), .in(Db));
	
	regfile reggie (.ReadData1(Da), .ReadData2(Db), .WriteData(WriteData_WR), .ReadRegister1(Rn),
						.ReadRegister2(Bin), .WriteRegister(Rd_WR), .RegWrite(RegWrite_WR), .clk(notClk), .reset); // decide write signal at WB stage
	
	logic flagWrite;
	
	wire RegWrite_ID;
	controls broisthethinker (.Reg2Loc(Reg2Loc), .UncondBr(UncondBr), .BrTaken(BrTaken), .RegWrite(RegWrite_ID), 
									  .MemWrite(MemWrite), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .MemToReg(MemToReg), 
									  .instr(instr_ID), .zero(zero), .negative(negative), .overflow(overflow), // TODO: correct flags from register
									  .flagWrite(flagWrite), .ALUz(ID_zero));
	// end register fetch
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~					
	
	wire RegWrite_EX, MemWrite_EX, MemToReg_EX;
	wire [4:0] Rd_EX;
	wire [2:0] ALUOp_EX;
	wire [1:0] ALUSrc_EX;
	wire [63:0] Da_EX, Db_EX, LS_EX, Imm_EX, DAddr_EX;
	
	ID_EX ID_EX_register (.RegWrite(RegWrite_ID), .MemWrite(MemWrite), .ALUOp(ALUOp), .ALUSrc(ALUSrc), 
								.MemToReg(MemToReg), .flagWrite(flagWrite), 
								.RegWrite_out(RegWrite_EX), .MemWrite_out(MemWrite_EX), .ALUOp_out(ALUOp_EX), .ALUSrc_out(ALUSrc_EX),
								.MemToReg_out(MemToReg_EX), .flagWrite_out(flagWrite_EX),
								.Imm12Ext(Imm), .Daddr9Ext(DAddr), .LS(LSR), .Rd(Rd), .Da(Da), .Db(Db), 
								.Imm12Ext_out(Imm_EX), .Daddr9Ext_out(DAddr_EX), .LS_out(LS_EX), .Rd_out(Rd_EX),
								.Da_out(Da_EX), .Db_out(Db_EX), .clk, .reset);
								
	// Execute (EX)
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		
	wire [63:0] ALU_Bin, ALUResult;
	
	generate
		for (i = 0; i < 64; i++) begin : each4Mux
			wire [3:0] temp;
			assign temp[0] = Db_EX[i];
			assign temp[1] = DAddr_EX[i];
			assign temp[2] = Imm_EX[i];
			assign temp[3] = LS_EX[i];
			mux4_1 alusourcer (.out(ALU_Bin[i]), .in(temp), .sel(ALUSrc_EX));
		end
	endgenerate
	alu ALU (.result(ALUResult), .A(Da_EX), .B(ALU_Bin), .cntrl(ALUOp_EX), .negative(ALUn), 
				.zero(ALUz), .overflow(ALUo), .carry_out(ALUc));
	
		
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	wire RegWrite_MEM, MemWrite_MEM, MemToReg_MEM, flagWrite_MEM;
	wire [4:0] Rd_MEM;
	wire [63:0] Db_MEM, Daddr_MEM, ALUResult_MEM;
	
	EX_MEM EX_MEM_register (.Db(Db_EX), .Daddr9Ext(DAddr_EX), .MemWrite(MemWrite_EX), .MemToReg(MemToReg_EX), .FlagWrite(flagWrite_EX),
									.RegWrite(RegWrite_EX), .Rd(Rd_EX), .clk, .reset, 
									.Db_out(Db_MEM), .Daddr9Ext_out(Daddr_MEM), .MemWrite_out(MemWrite_MEM), .MemToReg_out(MemToReg_MEM),
									.FlagWrite_out(flagWrite_MEM), .RegWrite_out(RegWrite_MEM), .Rd_out(Rd_MEM), .ALUResult(ALUResult), 
									.ALUResult_out(ALUResult_MEM));
	

	// Data Memory (MEM)
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	wire [63:0] memDataOut, WriteData;
	datamem dataMemory (.address(ALUResult_MEM), .write_enable(MemWrite_MEM), .read_enable(1'b1), // read up on xfer size, read enable reqs
								.write_data(Db_MEM), .clk, .xfer_size(4'b1000), .read_data(memDataOut));
								
	mux_64_2_1 toReg (.out(WriteData), .A(ALUResult_MEM), .B(memDataOut), .sel(MemToReg_MEM)); 
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	MEM_WR MEM_WR_register (.RegWrite(RegWrite_MEM), .RegWrite_out(RegWrite_WR), .Rd(Rd_MEM), .Rd_out(Rd_WR), 
									.WriteData(WriteData), .WriteData_out(WriteData_WR), .clk, .reset);
	
	
endmodule

module pipelined_testbench();
	
	logic clk, reset;
	
	parameter ClockDelay = 10000;
	pipelined dut (.clk(clk), .reset(reset));
	
	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	int i;
	initial begin
		reset = 1;	@(posedge clk);
		reset = 0;	@(posedge clk);
		for (i = 0; i < 100; i++) begin
			@(posedge clk);
		end
		$stop;
	end
endmodule