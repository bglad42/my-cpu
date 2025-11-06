module controls (Reg2Loc, UncondBr, BrTaken, RegWrite, MemWrite, ALUOp, ALUSrc, MemToReg, instr);
	output logic Reg2Loc, UncondBr, BrTaken, RegWrite, MemWrite, ALUSrc, MemToReg;
	input logic [31:0] instr;
	input logic zero;
	
	enum logic [10:0] {
		ADDS 	= 11'b10101011000,
		ADDI	= 11'b10010001000,
		AND 	= 11'b10001010000,
		SUBS 	= 11'b11001011000,
		LDUR	= 11'b11111000010,
		STUR 	= 11'b11111000000,
		B 		= 11'b000101XXXXX,
		CBZ 	= 11'b10110100XXX,
		BLT 	= 11'b01010100XXX,
		EOR 	= 11'b11001010000,
		LSR	= 11'b11010011011
	} OpCodes;
	
	always_comb begin
		case (instr[31:21]) begin
			ADDS: begin
				Reg2Loc 	= 1'b1;
				ALUSrc 	= 1'b0;
				MemToReg = 1'b0;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b010;
			end
			
			ADDI: begin
				Reg2Loc 	= 1'b1;
				ALUSrc 	= 1'b0;
				MemToReg = 1'b0;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b010;
			end
			
			SUBS: begin
				Reg2Loc 	= 1'b1;
				ALUSrc 	= 1'b0;
				MemToReg = 1'b0;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken  = 1'b0;
				UncondBr = 1'bX;
				ALUOp  	= 3'b011;
			end
			
			LDUR: begin
				Reg2Loc 	= 1'bX;
				ALUSrc 	= 1'b1;
				MemToReg = 1'b1;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b010;
			end
			
			STUR: beginfsdfsdf
				Reg2Loc 	= 1'b0;
				ALUSrc 	= 1'b1;
				MemToReg = 1'bX;
				RegWrite = 1'b0;
				MemWrite = 1'b1;
				BrTaken 	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b010;
			end
			
			B: begin
				Reg2Loc 	= 1'bX;
				ALUSrc 	= 1'bX;
				MemToReg = 1'bX;
				RegWrite = 1'b0;
				MemWrite = 1'b0;
				BrTaken 	= 1'b1;
				UncondBr = 1'b1;
				ALUOp 	= 3'bXXX;
			end
			
			CBZ: begin
				Reg2Loc 	= 1'b0;
				ALUSrc 	= 1'b0;
				MemToReg = 1'bX;
				RegWrite = 1'b0;
				MemWrite = 1'b0;
				BrTaken 	= zero;
				UncondBr = 1'b0;
				ALUOp 	= 3'b000; 
			end
		end
	end