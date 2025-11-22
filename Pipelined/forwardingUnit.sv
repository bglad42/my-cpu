`timescale 1ns/1ps

module forwardingUnit (Da_cntrl, Db_cntrl, AddrA, AddrB, Rd_EX, Rd_MEM, RegWrite_EX, RegWrite_MEM); // must be able to forward from Execute and Mem stages
	input logic [4:0] AddrA, AddrB, Rd_EX, Rd_MEM;
	input logic RegWrite_EX, RegWrite_MEM;
	output logic [1:0] Da_cntrl, Db_cntrl;
	
	// 00 - normal operation, 01 - from EX , 10 - from MEM 
	always_comb begin
    
    Da_cntrl = 2'b00;
    Db_cntrl = 2'b00;

    
    if (RegWrite_EX && (Rd_EX != 5'd31) && (AddrA == Rd_EX)) begin
        Da_cntrl = 2'b01; // from EX
    end else if (RegWrite_MEM && (Rd_MEM != 5'd31) && (AddrA == Rd_MEM)) begin
        Da_cntrl = 2'b10; // from MEM
    end

    
    if (RegWrite_EX && (Rd_EX != 5'd31) && (AddrB == Rd_EX)) begin
        Db_cntrl = 2'b01; // from EX
    end else if (RegWrite_MEM && (Rd_MEM != 5'd31) && (AddrB == Rd_MEM)) begin
        Db_cntrl = 2'b10; // from MEM
    end
end
endmodule