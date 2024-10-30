`timescale 1ns/1ps

module tb_top_gauss;

  // Señales del testbench
  reg clk;
  reg rst;
  
  reg select;
  reg we;
  reg [31:0] entrada_i;

  wire [31:0] salida_o;

  // Instancia del módulo bajo prueba (DUT)
  top_gauss dut (
    .clk(clk),
    .rst(rst),
    .select(select),
    .we(we),
    .entrada_i(entrada_i),
    .salida_o(salida_o)
  );

  // Generación del reloj
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Periodo de reloj de 10 unidades de tiempo (10 ns)
  end

  // Inicialización y secuencia de prueba
  initial begin

    $dumpfile("top_gauss_tb.vcd");
    $dumpvars(0, tb_top_gauss);

    // Inicialización de señales
    rst = 0;
    select = 0;
    we = 0;
    entrada_i = 32'h00000000;

    // Aplicar reset
    rst = 1;
    #10;
    rst = 0;
    #10;

    // Simulación de secuencia de prueba
    we = 1;
    entrada_i = 32'h00000001;
    select = 0;
    
    #10;
    entrada_i = 32'h00000001;
    select = 1;
    // Enviar algunos datos de prueba con temporización explícita
    entrada_i = 32'h000000FF;
    #10;
    entrada_i = 32'h000000A7;
    #10;
    entrada_i = 32'h000000C2;
    #10;
    entrada_i = 32'h000000F2;
    #10;
    entrada_i = 32'h000000B7;
    #10;
    entrada_i = 32'h000000B2;
    #10;
    entrada_i = 32'h000000E1;
    #10;
    entrada_i = 32'h000000A7;
    #10;
    entrada_i = 32'h000000D9;
    #10;

    select = 0;
    entrada_i = 32'h00000000;

    #50;

    select = 1;
    entrada_i = 32'h00000000;

    // Esperar a que el procesamiento termine
    #100;

    we = 1;
    entrada_i = 32'h00000001;
    select = 0;
    
    #10;
    entrada_i = 32'h00000001;
    select = 1;
    // Enviar algunos datos de prueba con temporización explícita
    entrada_i = 32'h00000023;
    #10;
    entrada_i = 32'h00000087;
    #10;
    entrada_i = 32'h00000011;
    #10;
    entrada_i = 32'h0000000A;
    #10;
    entrada_i = 32'h000000F6;
    #10;
    entrada_i = 32'h00000089;
    #10;
    entrada_i = 32'h000000A0;
    #10;
    entrada_i = 32'h00000065;
    #10;
    entrada_i = 32'h000000B4;
    #10;

    select = 0;
    entrada_i = 32'h00000000;

    #50;

    select = 1;
    entrada_i = 32'h00000000;

    // Esperar a que el procesamiento termine
    #100;

    // Finalizar la simulación
    $finish;
  end

endmodule


