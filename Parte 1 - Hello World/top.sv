module top(
    input logic clk,
    input logic rst,

    //input logic [31:0] leds_in,
    //input logic [31:0] display_seg_in,
//    input logic [31:0] switches_in,
//    input logic [31:0] gauss_in,
    //input logic [31:0] RAM_in,
    input logic UART_in,

//    output logic [31:0] leds_out,
//    output logic [31:0] display_seg_out,
//    output logic [31:0] switches_out,
//    output logic [31:0] gauss_out,
//    output logic [31:0] RAM_out,
    output logic UART_out
);

//Definicion se seÃ±ales intermedias
logic clk_10Mhz;
logic [31:0] salida_o_in;

logic reg_sel_i_in;
logic addr_i_in;

logic [1:0] select_in;

logic we_Mem_in;
logic we_Leds_in;
logic we_7seg_in;
logic we_Gauss_in;
logic we_Uart_in;

logic [31:0] DataIn_in;

logic we_o_in;
logic read_in;
logic [31:0] ProgAddress_o_in;
logic [31:0] DataAddress_o_in;
logic [31:0] DataOut_o_in;

logic [8:0] ProgAddress_o_trunc_in;

logic [31:0] spo_in;

////Instancia del reloj de 10 MHz
clk_wiz_0 unidad_clk_wiz(
    .clk_in1(clk),
    .clk_out1(clk_10Mhz)
);

//Instancia del IP de la ROM
ROM unidad_ROM (
    .a(ProgAddress_o_trunc_in),
    .spo(spo_in)
);

//Instancias de los perifÃ©ricos 
IPU unidad_IPU (
    .clk(clk_10Mhz),
    .rst(rst),
    .wr_i(we_Uart_in),
    .reg_sel_i(reg_sel_i_in),
    .entrada_i(DataOut_o_in),
    .addr_i(addr_i_in),
    .rx(UART_in),
    .salida_o(salida_o_in),
    .tx(UART_out)
);

deco_read unidad_deco_read(
    .Data_Address_o(DataAddress_o_in),
    .select(select_in)
);

deco_uart unidad_deco_uart(
    .Data_Address_o(DataAddress_o_in),
    .reg_sel_i(reg_sel_i_in),
    .addr_i(addr_i_in)
);

deco_write unidad_deco_write(
    .Data_Address_o(DataAddress_o_in),
    .we_o(we_o_in),
    .we_Mem(we_Mem_in),
    .we_Leds(we_Leds_in),
    .we_7seg(we_7seg_in),
    .we_Gauss(we_Gauss_in),
    .we_Uart(we_Uart_in)
);

logic [31:0] prueba;
assign prueba = 32'b00000000000000000000000000000000;

mux_read unidad_mux_read(
//    .RAM(RAM_out),
    .UART(salida_o_in),
//    .switches(switches_out),
//    .gauss(gauss_out),
    .select(select_in),
    .read(read_in),
    .DataIn_i(DataIn_in)
);

unicycle unidad_procesador(
    .clk(clk_10Mhz),
    .rst(rst),
    .instruction(spo_in),
    .DataIn_i(DataIn_in),
    .ProgAddress_o(ProgAddress_o_in),
    .DataAddress_o(DataAddress_o_in),
    .DataOut_o(DataOut_o_in),
    .read(read_in),
    .we_o(we_o_in)
);

truncador unidad_truncador(
    .ProgAddress_o(ProgAddress_o_in),
    .ProgAdress_o_corrida(ProgAddress_o_trunc_in)
);

//Instanciar demÃ¡s bloques para la prÃ³xima parte

endmodule

