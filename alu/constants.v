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
`define ALU_SEQ     4'b1111

`endif        
