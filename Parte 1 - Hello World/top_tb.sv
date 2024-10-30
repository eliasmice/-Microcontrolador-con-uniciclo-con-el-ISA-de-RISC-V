`timescale 1ns/1ps

module top_tb;

    // Parámetros y variables
    parameter W = 32;
    
    logic clk;
    logic rst;
    logic UART_in;
    logic UART_out;
    // Instancia del módulo a probar
    top dut (
        .clk(clk),
        .rst(rst),
        .UART_in(UART_in),
        .UART_out(UART_out)
    );
    
    // Generador de reloj
    initial begin
    clk = 0;
    forever begin
        #10 clk = ~clk;
    end
    end
    initial begin
    rst=1;
    #12;
    rst=0;
    #10000;
    $finish;
    end
endmodule