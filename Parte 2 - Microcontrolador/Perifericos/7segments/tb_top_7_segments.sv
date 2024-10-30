`timescale 1ns / 1ps

module tb_module_top_7_segments;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in simulation time units

    // Input signals
    logic clk;
    logic rst;
    logic [31:0] activation;
    logic we_7seg;

    // Output signals
    logic a, b, c, d, e, f, g;
    logic [7:0] AN;

    // Instantiate the module under test (MUT)
    module_top_7_segments dut (
        .clk(clk),
        .rst(rst),
        .activation(activation),
        .we_7seg(we_7seg),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .AN(AN)
    );

    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;


    initial begin
        $dumpfile("tb_module_top_7_segments.vcd");
        $dumpvars(0, tb_module_top_7_segments);
    end

    // Test sequence
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;
        activation = 2'b00;
        we_7seg = 0;

        // Apply reset
        @(posedge clk);
        rst = 1;
        @(posedge clk);
        rst = 0;

        // Wait for some time before starting the test
        repeat (10) @(posedge clk);

        // El procesador quiere iniciar la cuenta 
        activation = 2'b01;
        we_7seg = 1;
        repeat (1) @(posedge clk);


        // Está realizando la cuenta 
        we_7seg = 0;
        repeat (100) @(posedge clk);


        // El procesador ordena que se termine la cuenta
        activation = 2'b10;
        we_7seg = 1;
        repeat (1) @(posedge clk);

        // Debería mostrarse el valor contado en los displays
        we_7seg = 0;
        repeat (30) @(posedge clk);

        
        // El procesador quiere iniciar la cuenta 
        activation = 2'b01;
        we_7seg = 1;
        repeat (1) @(posedge clk);


        // Está realizando la cuenta 
        we_7seg = 0;
        repeat (75) @(posedge clk);


        // El procesador ordena que se termine la cuenta
        activation = 2'b10;
        we_7seg = 1;
        repeat (1) @(posedge clk);

        // Debería mostrarse el valor contado en los displays
        we_7seg = 0;
        repeat (10) @(posedge clk);



        // Finish simulation
        $finish;
    end

    

endmodule
