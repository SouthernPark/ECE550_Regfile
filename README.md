# ECE550_Regfile
Build up a register file which contains 32 registers(32bits). Two read port and one write port


# DFFE
DFFE means D-flip-flop with enbled digit. It is different from D-flip-flop.  
DFF change values when there is an rising edge/falling edge. (depends on which kind dff you use)  
DFFE change the output only when rising edge/faling edge and enable digit is enabled.  
DFFE is very useful when we wang to change the value of a specific register while keep other register unchange.  
When there is multiple register under the same clock, we can use decoder together with eanble digit to select the reg we want to change.  
