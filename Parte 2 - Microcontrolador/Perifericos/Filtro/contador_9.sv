module contador_9(
    input logic clk,       
    input logic rst,
    input logic cuente9,
    output logic [3:0] contador,
    output logic conto9  
);

// Registro local para llevar el contador
logic [3:0]cuenta_local;

    // Proceso secuencial que cuenta en cada flanco de subida del reloj
always_ff @(posedge clk) begin
    if (rst) begin
        cuenta_local <= 1;
        conto9 <= 0;
    end
    else if (cuenta_local == 9) begin
        cuenta_local <= 1;
        conto9 <= 1;
    end
    else if (cuente9) begin
        cuenta_local <= cuenta_local + 1;
        conto9 <= 0;
    end

end

assign contador = cuenta_local;


endmodule