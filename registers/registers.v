
module registers (
    input  clock,
    input  we,
    input  [4:0] reg_to_write_addr,
    input  [4:0] reg_stored_1_addr,
    input  [4:0] reg_stored_2_addr,
    input  [31:0] reg_to_write_data,
    output [31:0] reg_stored_1_data,
    output [31:0] reg_stored_2_data
);

    // 32 regs with  32bit width each one
    logic [31:0] regs [0:31];
   
    // Read ports for reg_stored_1 and reg_stored_2
    assign reg_stored_1_data = regs[reg_stored_1_addr];
    assign reg_stored_2_data = regs[reg_stored_2_addr];

    // Register x0 is always 0
    initial regs[0] = 32'b0;

    // Write port for reg_to_write
    always @(posedge clock)
        if (we && (reg_to_write_addr != 5'b0)) 
		regs[reg_to_write_addr] <= reg_to_write_data;

  // Dump waves
  initial begin
    $dumpfile("registers.vcd");
    $dumpvars(0, registers);
    #1;
  end

endmodule
