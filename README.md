# ECE550_Regfile
Build up a register file which contains 32 registers(32bits). Two read port and one write port


# DFFE
DFFE means D-flip-flop with enbled digit. It is different from D-flip-flop.  
DFF change values when there is an rising edge/falling edge. (depends on which kind dff you use)  
DFFE change the output only when rising edge/faling edge and enable digit is enabled.  
The enable digit is very useful when we wang to change the value of a specific register while keep other register unchange.  
When there is multiple register under the same clock, we can use decoder together with eanble digit to select the reg we want to change.  
The implementation of DFFE is given in dffe_ref.v .  

# 32-bit register
32-bit register is constructed by putting 32 DFFE under the same clock, enable, clear digit. Besides, the input should receive 32-bits data and the output will be 32 bit wire as well.  

# regfile
The storage part of regfile is constructed by 32 32-bit-register. Each input data is the write data and there will be 32 32-bit outputs.  

# write operation
Write operation is implemented using decoder together with the enable digit of 32-bit register. Given the 5-bits selection code, the decoder will help us transform it to one hot format which is 32 bits with one 1-bit is 1 and the rest are 0. The only 1 in the one-hot will select which register we want to write. The write operations happens only when the enable digit is on, which tell us the enable digit and the one hot have to be input into an AND gate.

# read operation
Read operation is implemented using decoder together and tri-state. Decoder will transform the 5-bits selection code into 32-bits one hot format. This one hot will tell the tristate which register output will be set as high impede. Totally, there will be 31 registers' output set as high impede, leaving only one register ouput connected to the read result.  This read result is what we wanted.  

# 32-bits decoder
The input of this 32-bits decoder is 5-bits selection code. The output of this decoder is 32-bits one hot. The decoder is constructed by drawing the truth table between the input and output. For every output digit, its formular is constructed using the sum of product method. With these 32 formulars, we can construc the decoder.  

# How fast can be clocked
We run the test case on time-based simulation, our Regfile gives the correct output on 50MHz clock.  
