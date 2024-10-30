module module_top_7_segments (
    input logic clk,
    input logic rst,
    
    input logic [31:0] activation, // Señal de activación (2'b01 para iniciar, 2'b10 para detener)
    input logic we_7seg,          // Nueva señal de habilitación

    
    // Del Display

    output logic a, b, c, d, e, f, g,
    output logic [7:0] AN // Puertos para controlar los nodos comunes

);

logic [31:0]counter;

logic [7:0]entrada_bcd;
assign entrada_bcd = counter[7:0];

cycle_counter cycle_counter(
    .clk(clk),     // Señal de reloj
    .reset(rst),   // Señal de reset

    .activation(activation), // Señal de activación (2'b01 para iniciar, 2'b10 para detener)
    .we_7seg(we_7seg),          // Nueva señal de habilitación
    .counter(counter)   // Registro del contador con valores de control
);


logic [11:0] dato_decimal;
logic [15:0] deco_data_decimal;
assign deco_data_decimal = {4'b0,dato_decimal};

//INSTANCIAR DECO:
top_module_display deco7segments_inst (
    .switches(deco_data_decimal),
    .clk_10MHz(clk),   
    .i_Rst(rst),
    .a(a), 
    .b(b), 
    .c(c),
    .d(d), 
    .e(e), 
    .f(f),
    .g(g),
    .AN(AN) // Puertos para controlar los nodos comunes
);

convertidor_bcd convertidor_bcd (
    .dato(entrada_bcd),
    .decimal(dato_decimal)
);

endmodule 