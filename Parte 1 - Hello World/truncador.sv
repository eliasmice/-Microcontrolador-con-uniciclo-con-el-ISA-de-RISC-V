module truncador (
    input logic [31:0] ProgAddress_o, // Entrada de 32 bits
    output logic [8:0] ProgAdress_o_corrida // Salida de 32 bits
);

    logic [31:0] ProgAdress_o_in;

    // Realizar el corrimiento de dos bits hacia la derecha
    assign ProgAdress_o_in = ProgAddress_o >> 2;
    assign ProgAdress_o_corrida = ProgAddress_o_in[8:0];

endmodule
