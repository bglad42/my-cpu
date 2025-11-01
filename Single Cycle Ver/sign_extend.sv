module sign_extend #(parameter WIDTH = 1) (out, in);
	input logic [WIDTH-1:0] in;
	output logic [63:0] out;
	
	logic msb;
	assign msb = in[WIDTH-1];
	  
	genvar i;
	generate
		for (i = 0; i < WIDTH-1; i++) begin : old
			assign out[i] = in[i];
		end
	
		for (i = WIDTH-1; i < 64; i++) begin : upper
			assign out[i] = msb;
		end
	endgenerate
	
endmodule
