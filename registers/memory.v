module memory_reg(
    input wire [4:0] address, // Dirección de memoria de 5 bits
    input wire write_enable, // Habilitar escritura asincrona
    input wire [31:0] data_in, // Datos de entrada para escritura asincrona
    input wire clk, // Señal de reloj
    output wire [31:0] data_out // Salida de lectura sincrona
);

  reg [31:0] memory [0:31]; // Banco de memoria de 32 direcciones de 32 bits cada una
  
  // Escritura asincrona
  assign data_out = memory[address];
  
  // escritura sincrona
  always @(posedge clk) begin
      if (write_enable) begin
        memory[address] <= data_in;
      end
  end

  // Dump waves
  initial begin
    $dumpfile("memory_reg.vcd");
    $dumpvars(0, memory_reg);
    #1;
  end

endmodule

