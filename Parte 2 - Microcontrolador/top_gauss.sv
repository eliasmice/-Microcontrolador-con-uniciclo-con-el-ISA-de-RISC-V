module top_gauss (
    input logic clk,
    input logic rst,
    
    input logic select,
    input logic we,
    input logic [31:0] entrada_i,

    output logic [31:0] salida_o
);

//Señales internas
logic [7:0] dato_pixel;
logic [7:0] pixel_00_i;
logic [7:0] pixel_01_i;
logic [7:0] pixel_02_i;
logic [7:0] pixel_10_i;
logic [7:0] pixel_11_i;
logic [7:0] pixel_12_i;
logic [7:0] pixel_20_i;
logic [7:0] pixel_21_i;
logic [7:0] pixel_22_i;
logic [7:0] pixel_procesado_i;

logic we_d_i;
logic we_c_i;
logic we_c_fsm;
logic we_d_fsm;
logic senal;

logic [31:0] in_c_i;
logic [31:0] out_c_i;
logic [3:0] out_c_fsm;

logic inicio_i;
logic conto9_i;
logic cuente9_i;
logic [3:0] contador_i;

logic [31:0] out_d_i;


//Instancia de los bloques necesarios
gaussian_filter unidad_filtro_gauss(
    .clk(clk),
    .rst(rst),
    .inicio(inicio_i),
    .pixel_00(pixel_00_i),
    .pixel_01(pixel_01_i),
    .pixel_02(pixel_02_i),
    .pixel_10(pixel_10_i),
    .pixel_11(pixel_11_i),
    .pixel_12(pixel_12_i),
    .pixel_20(pixel_20_i),
    .pixel_21(pixel_21_i),
    .pixel_22(pixel_22_i),
    .pixel_procesado(pixel_procesado_i)
);

assign in_c_i = {28'b0000000000000000000000000000,out_c_fsm};
assign senal = entrada_i[0];
registro_control_gauss unidad_registro_control_gauss(
    .clk(clk),
    .rst(rst),
    .in_c(in_c_i),
    .senal(senal),
    .we(we_c_i),
    .we_fsm(we_c_fsm),
    .out_c(out_c_i)
);

assign dato_pixel = entrada_i[7:0];
registro_datos_gauss unidad_registro_datos_gauss(
    .clk(clk),
    .rst(rst),
    .in_pixel(dato_pixel),
    .in_procesado(pixel_procesado_i),
    .we(we_d_i),
    .we_fsm(we_d_fsm),
    .addr_i(contador_i),
    .out_d(out_d_i),
    .out_pixel_1(pixel_00_i),
    .out_pixel_2(pixel_01_i),
    .out_pixel_3(pixel_02_i),
    .out_pixel_4(pixel_10_i),
    .out_pixel_5(pixel_11_i),
    .out_pixel_6(pixel_12_i),
    .out_pixel_7(pixel_20_i),
    .out_pixel_8(pixel_21_i),
    .out_pixel_9(pixel_22_i)
);

mux_gauss unidad_mux_gauss(
    .out_c(out_c_i),
    .out_d(out_d_i),
    .reg_sel_i(select),
    .salida_o(salida_o)
);

filtro_fsm unidad_filtro_fsm(
    .clk(clk),
    .reset(rst),
    .out_control(out_c_i),
    .conto9(conto9_i),
    .inicio(inicio_i),
    .we_c(we_c_fsm),
    .we_d(we_d_fsm),
    .cuente9(cuente9_i),
    .control(out_c_fsm)
);

contador_9 unidad_contador(
    .clk(clk),
    .rst(rst),
    .cuente9(cuente9_i),
    .contador(contador_i),
    .conto9(conto9_i)
);

demux_gauss unidad_demux_gauss(
    .select(select),
    .wr_i(we),
    .wr1_c(we_c_i),
    .wr1_d(we_d_i)
);


endmodule