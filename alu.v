`include "constants.v"

module alu (
    input signed   [31:0] input_a,
    input signed [31:0] input_b,
    input   [3:0]  op_code,
    output logic [31:0] result
);

    always @* begin
        case (op_code)
           `ALU_ADD:   result = input_a +    input_b;
           `ALU_SUB:    result = input_a -    input_b;
           `ALU_SLL:    result = input_a <<   input_b[4:0];
           `ALU_SRL:    result = input_a >>   input_b[4:0];
           `ALU_SRA:    result = input_a >>>  input_b[4:0];
           `ALU_SEQ:    result = {31'b0, input_a == input_b};
           `ALU_SLT:    result = {31'b0, input_a < input_b};
           `ALU_SLTU:   result = {31'b0, $unsigned(input_a) < $unsigned(input_b)};
           `ALU_XOR:    result = input_a ^    input_b;
           `ALU_OR:     result = input_a |    input_b;
           `ALU_AND:    result = input_a &    input_b;
            default: result= `ZERO;
        endcase

    end

      // Dump waves
  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu);
    #1;
  end
endmodule
