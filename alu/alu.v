`include "constants.v"

module alu (
    input signed   [31:0] input_a,
    input signed [31:0] input_b,
    input   [3:0]  op_code,
    output logic [31:0] result
);

    always @* begin
        case (op_code)
           `ALU_ADD:   result = input_a +    input_b; //addition
           `ALU_SUB:    result = input_a -    input_b; //subtraction
           `ALU_SLL:    result = input_a <<   input_b[4:0]; //Shift less than 
           `ALU_SRL:    result = input_a >>   input_b[4:0]; //Shift Right logic
           `ALU_SRA:    result = input_a >>>  input_b[4:0]; //Shift Right Aritmetic
           `ALU_SEQ:    result = {31'b0, input_a == input_b}; //Set qual
           `ALU_SLT:    result = {31'b0, input_a < input_b}; //Set less Than (signed)
           `ALU_SLTU:   result = {31'b0, $unsigned(input_a) < $unsigned(input_b)}; //set less than (unsigned)
           `ALU_XOR:    result = input_a ^    input_b; //Logical XOR
           `ALU_OR:     result = input_a |    input_b; //Logical OR
           `ALU_AND:    result = input_a &    input_b; //Logical AND
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
