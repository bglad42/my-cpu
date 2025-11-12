module zero_extend #(parameter WIDTH = 1) (out, in);
	input logic [WIDTH-1:0] in;
	output logic [63:0] out;
	
	genvar i;
	generate begin
		for (i = 0, i < WIDTH, i++) begin : wiring
			assign out[i] = in[i];
		end
		assign out[63:WIDTH] = 0;
	endgenerate
	
endmodule 