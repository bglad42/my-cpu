module mux_64_2_1 (out, A, B, sel);
	output logic [63:0] out;
	input logic [63:0] in;
	input logic sel;
	
	genvar i;
	generate begin
		for (i = 0; i < 64; i++) begin : eachMux
			mux_2_1  (.out(out[i]), .i0(A[i]), .i1(B[i]), .sel(sel));
		end
	endgenerate
endmodule