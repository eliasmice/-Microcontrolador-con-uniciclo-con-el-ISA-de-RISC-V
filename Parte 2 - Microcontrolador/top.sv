module top(
    input logic clk,
    input logic rst,

    input logic UART_in,
    input logic [19:0] switches_buttons,

    output logic [15:0] leds,
    output logic UART_out
    output logic a, b, c, d, e, f, g,
    output logic [7:0] AN // Puertos para controlar los nodos comunes
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

logic select_gauss;
logic [31:0] gauss_out;
logic [31:0] switches_out;

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

mux_read unidad_mux_read(
//    .RAM(RAM_out),
    .UART(salida_o_in),
    .switches(switches_out),
    .gauss(gauss_out),
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

top_gauss unidad_filtro_gauss(
    .clk(clk_10Mhz),
    .rst(rst),
    .select(select_gauss),
    .we(we_Gauss_in),
    .entrada_i(DataOut_o_in),
    .salida_o(gauss_out)
);

deco_gauss unidad_deco_gauss(
    .Data_Address_o(DataAddress_o_in),
    .select(select_gauss)
);

switches_buttons unidad_switches_buttons(
    .clk(clk_10Mhz),
    .in(switches_buttons),
    .out_sw_bt(switches_out)
);

leds_control unidad_leds(
    .clk(clk_10Mhz),
    .reset(rst),
    .we_leds(we_Leds_in),
    .reg_data(DataOut_o_in),
    .leds(leds)
);

module_top_7_segmentos unidad_display_7_seg(
    .clk(clk_10Mhz),
    .rst(rst),
    .activation(DataOut_o_in),
    .we_7seg(we_7seg_in),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .AN(AN)
);

endmodule

