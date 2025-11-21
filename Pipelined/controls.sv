module controls (Reg2Loc, UncondBr, BrTaken, RegWrite, MemWrite, ALUOp, ALUSrc, MemToReg, instr, ALUz, zero, negative, overflow, flagWrite);
	output logic Reg2Loc, UncondBr, BrTaken, RegWrite, MemWrite, MemToReg, flagWrite;
	output logic [1:0] ALUSrc;
	output logic [2:0] ALUOp;	
	input logic [31:0] instr;
	input logic zero, negative, overflow, ALUz;
	
	enum logic [10:0] {
		ADDS 	= 11'b10101011000,
		ADDI	= 11'b10010001000,
		AND 	= 11'b10001010000,
		SUBS 	= 11'b11101011000,
		LDUR	= 11'b11111000010,
		STUR 	= 11'b11111000000,
		B 		= 11'b000101XXXXX,
		CBZ 	= 11'b10110100XXX,
		BLT 	= 11'b01010100XXX,
		EOR 	= 11'b11001010000,
		LSR	= 11'b11010011011
	} OpCodes;
	
	always_comb begin
		casex (instr[31:21])
			ADDS: begin
				Reg2Loc 	= 1'b1;
				ALUSrc 	= 2'b00;
				MemToReg = 1'b0;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b010;
				flagWrite = 1'b1;
			end
			
			ADDI: begin
				Reg2Loc 	= 1'b0;
				ALUSrc 	= 2'b10;
				MemToReg = 1'b0;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b010;
				flagWrite = 1'b0;
			end
			
			AND: begin
				Reg2Loc 	= 1'b1;
				ALUSrc 	= 2'b00;
				MemToReg = 1'b0;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b100;
				flagWrite = 1'b0;
			end
			
			EOR: begin
				Reg2Loc 	= 1'b1;
				ALUSrc 	= 2'b00;
				MemToReg = 1'b0;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b110;
				flagWrite = 1'b0;
			end
			
			SUBS: begin
				Reg2Loc 	= 1'b1;
				ALUSrc 	= 2'b00;
				MemToReg = 1'b0;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken  = 1'b0;
				UncondBr = 1'bX;
				ALUOp  	= 3'b011;
				flagWrite = 1'b1;
			end
			
			LDUR: begin
				Reg2Loc 	= 1'bX;
				ALUSrc 	= 2'b01;
				MemToReg = 1'b1;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b010;
				flagWrite = 1'b0;
			end
			
			STUR: begin
				Reg2Loc 	= 1'b0;
				ALUSrc 	= 2'b01;
				MemToReg = 1'bX;
				RegWrite = 1'b0;
				MemWrite = 1'b1;
				BrTaken 	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b010;
				flagWrite = 1'b0;
			end
			
			B: begin
				Reg2Loc 	= 1'bX;
				ALUSrc 	= 2'bX;
				MemToReg = 1'bX;
				RegWrite = 1'b0;
				MemWrite = 1'b0;
				BrTaken 	= 1'b1;
				UncondBr = 1'b1;
				ALUOp 	= 3'bXXX;
				flagWrite = 1'b0;
			end
			
			CBZ: begin
				Reg2Loc 	= 1'b0;
				ALUSrc 	= 2'b00;
				MemToReg = 1'bX;
				RegWrite = 1'b0;
				MemWrite = 1'b0;
				BrTaken 	= ALUz;
				UncondBr = 1'b0;
				ALUOp 	= 3'b000;
				flagWrite = 1'b0;	
			end
			
			BLT: begin
				Reg2Loc 	= 1'b0;
				ALUSrc 	= 2'b00;
				MemToReg = 1'bX;
				RegWrite = 1'b0;
				MemWrite = 1'b0;
				BrTaken 	= (negative != overflow);
				UncondBr = 1'b0;
				ALUOp 	= 3'bXXX;
				flagWrite = 1'b0;	
			end
			
			LSR: begin
				Reg2Loc 	= 1'bX;
				ALUSrc 	= 2'b11;
				MemToReg = 1'b0;
				RegWrite = 1'b1;
				MemWrite = 1'b0;
				BrTaken 	= 1'b0;
				UncondBr = 1'bX;
				ALUOp 	= 3'b000; 
				flagWrite = 1'b0;
			end
			
			default: begin
				Reg2Loc 	= 1'bX;
				ALUSrc 	= 2'bXX;
				MemToReg = 1'bX;
				RegWrite = 1'b0;
				MemWrite = 1'b0;
				BrTaken 	= 1'bX;
				UncondBr = 1'bX;
				ALUOp 	= 3'bXXX; 
				flagWrite = 1'b0;
			end
		endcase
	end 
endmodule 