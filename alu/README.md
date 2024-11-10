We build an ALU to handle Instruction Type R:

![image](https://github.com/user-attachments/assets/7f05de93-45ab-4183-aac7-69f416766985)


We create a constant file with these values that will be use as global constants for the RISCV. \
We here combine SIGNAL_BIT + FUNC3 from standard

```tcl
`ifndef RISCV_CONSTANTS
`define RISCV_CONSTANTS
//constants
`define ZERO            32'b0

// ALU operations
`define ALU_ADD     4'b0000
`define ALU_SUB     4'b1000
`define ALU_SLL     4'b0001
`define ALU_SLT     4'b0010
`define ALU_SLTU    4'b0011
`define ALU_XOR     4'b0100
`define ALU_SRL     4'b0111
`define ALU_SRA     4'b1000
`define ALU_OR      4'b1010
`define ALU_AND     4'b1011

`endif                        
```

We created a cocotb test for basic addition and subtration operation: \
(you can see in the alu_test.py for more detail) 

![image](https://github.com/user-attachments/assets/a7f80950-243a-4838-81f5-d041a6c82ed9)



