module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	
	/*create 32 bit decoder for the ctrl_writeReg bit (which register we are going to write)*/
	
	
	
	/*create 32 32-bits register*/
	wire[31:0] Q [31:0];
	generate
   genvar i;
	for(i=1;i<32;i=i+1) begin: reg_32
         reg_32 register(Q[i], data_readRegA, 1, clock, ctrl_reset);
   end
	endgenerate
	
	//set register 0
	reg_32 register0(Q[0], 32'h00000000, 1, clock, ctrl_reset);
	
	/*implement read port A*/
	
	
	/*implement read port B*/

endmodule
