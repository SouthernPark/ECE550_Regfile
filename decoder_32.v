//decoder with 5-bits input and 32-bits one-hot represent
module decoder_32(in, out);
	input[4:0] in;
	output[31:0] out;
	
	wire[4:0] not_in;
	
	genvar i,j;
	generate
	for(i=0;i<5;i=i+1) begin: not_gate
         not not_(not_in[i], in[i]);
   end
	endgenerate
	
	//build a 32*4 wire table
	//col: in4 -> in0
	//out: 2 to the power of 5
	/*
					...000
					...001
					...010
					...011
					...100
					...101
					...110
					...111
	
	*/
	wire[4:0] table_ [31:0];
	
	//for the first column
	
	//fill not_in[4]
	generate
	for(i=0;i<16;i=i+1) begin: des1
         assign table_[i][4] = not_in[4];
   end
	endgenerate
	
	//fill in[4]
	generate
	for(i=16;i<32;i=i+1) begin: des2
         assign table_[i][4] = in[4];
   end
	endgenerate
	
	//for the second ccolumn
	//fill not_in[3]
	generate
	for(i=0;i<32;i=i+16) begin: des3
         for(j=0;j<8;j=j+1) begin: des4
				assign table_[i+j][3] = not_in[3];
			end
   end
	endgenerate
	
	//fill in[3]
	generate
	for(i=8;i<32;i=i+16) begin: des5
         for(j=0;j<8;j=j+1) begin: des6
				assign table_[i+j][3] = in[3];
			end
   end
	endgenerate
	
	//for the thrid column
	//fill not_in[2]
	generate
	for(i=0;i<32;i=i+8) begin: des7
         for(j=0;j<4;j=j+1) begin: des8
				assign table_[i+j][2] = not_in[2];
			end
   end
	endgenerate
	//fill in[2]
	generate
	for(i=4;i<32;i=i+8) begin: des9
         for(j=0;j<4;j=j+1) begin: des10
				assign table_[i+j][2] = in[2];
			end
   end
	endgenerate
	//for the forth column
	//fill not_in[1]
	generate
	for(i=0;i<32;i=i+4) begin: des11
         for(j=0;j<2;j=j+1) begin: des12
				assign table_[i+j][1] = not_in[1];
			end
   end
	endgenerate
	
	//fill in[1]
	generate
	for(i=2;i<32;i=i+4) begin: des13
         for(j=0;j<2;j=j+1) begin: des14
				assign table_[i+j][1] = in[1];
			end
   end
	endgenerate
	
	//fill not_in[0]
	generate
	for(i=0;i<32;i=i+2) begin: des15
         assign table_[i][0] = not_in[0];
   end
	endgenerate
	
	//fill in[0]
	generate
	for(i=1;i<32;i=i+2) begin: des16
         assign table_[i][0] = in[0];
   end
	endgenerate
	
	//add wire to and gate
	generate
	for(i=0;i<32;i=i+1) begin: and_gate
         and and_(out[i], table_[i][4],table_[i][3], table_[i][2], table_[i][1], table_[i][0]);
   end
	endgenerate
	
endmodule