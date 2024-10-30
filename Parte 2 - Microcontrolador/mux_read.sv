module mux_read (
    input logic [31:0] RAM,        // Entrada desde RAM
    input logic [31:0] UART,       // Entrada desde UART
    input logic [31:0] switches,   // Entrada desde switches
    input logic [31:0] gauss,      // Entrada desde gauss
    input logic [1:0] select,
    input logic read,      // SeÃ±al de selecciÃ³n
    output logic [31:0] DataIn_i       // Salida
);

always_comb begin
    case (select)
        2'b00: 
        if(read) DataIn_i = RAM;        // Seleccionar RAM
        2'b01: 
        if(read) DataIn_i = UART;       // Seleccionar UART
        2'b10:
        if(read) DataIn_i = switches;   // Seleccionar switches
        2'b11:
        if(read) DataIn_i = gauss;      // Seleccionar gauss
        default: DataIn_i = 32'b0;    // Valor por defecto en caso de un valor inesperado en select
    endcase
end

endmodule
