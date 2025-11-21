`timescale 1ns/1ps

module forwardingUnit (ForwardA, ForwardB, dest_reg, dest_mem); // must be able to forward from Execute and Mem stages
	input logic;
	output logic;
	
	always_comb begin
		if (RegWrite_EX) begin
			if (dest_reg != 5'd31) begin
				ForwardA = 1'b0;
				ForwardB = 1'b1;
			end else begin
				ForwardA = 1'b0;
				ForwardB = 1'b0;
			end
		end
	end
endmodule