module flagregister (flagWrite, zero_in, negative_in, overflow_in, carryout_in, zero, negative, overflow, carryout, clk, reset);

	input logic flagWrite, zero_in, negative_in, overflow_in, carryout_in, clk, reset;
	output logic zero, negative, overflow, carryout;
	
	logic neg_temp, zero_temp, over_temp, carry_temp;
	
	mux2_1 negative_register (.out(negative), .i0(neg_temp), .i1(negative_in), .sel(flagWrite));
	mux2_1 overflow_register (.out(overflow), .i0(over_temp), .i1(overflow_in), .sel(flagWrite));
	mux2_1 zero_register		 (.out(zero), 		.i0(zero_temp), .i1(zero_in), .sel(flagWrite));
	mux2_1 carryout_register (.out(carryout), .i0(carry_temp), .i1(carryout_in), .sel(flagWrite));
	
	D_FF theNegative (.q(neg_temp), .d(negative), .clk, .reset);
	D_FF theOverflow (.q(over_temp), .d(overflow), .clk, .reset);
	D_FF theZero	  (.q(zero_temp), .d(zero),	  .clk, .reset);
	D_FF theCarryout (.q(carry_temp), .d(carryout), .clk, .reset);
	
endmodule 