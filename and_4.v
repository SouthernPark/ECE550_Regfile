module and_4(in, out);
	input wire[4:0] in;
	output out;
	
	and res(out, in[4], in[3], in[2], in[1], in[0]);
	
endmodule