`timescale 1ns/1ps
`include "../src/unicycle.sv"

module unicycle_tb;

    // Parámetros y variables
    parameter W = 32;
    
    logic clk;
    logic rst;
    // Instancia del módulo a probar
    unicycle #(.W(W)) dut (
        .clk(clk),
        .rst(rst)
    );
    
    // Generador de reloj
    initial begin
    $dumpfile("unicycle_tb.vcd");
    $dumpvars(0, unicycle_tb);
    end
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