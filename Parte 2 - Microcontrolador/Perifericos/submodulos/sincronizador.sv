

module sincronizador (
    input logic clk,
    input logic inp,
    output logic out
);

    enum logic [1:0] {
        ESPERE_INICIO,
        PULSO
    } estado, sig_estado;

    bit initialized = 0;

    // Estado actual
    always_ff @(posedge clk) begin
        if (!initialized) begin
            initialized <= 1;
            estado <= ESPERE_INICIO;
        end
        else begin
            estado <= sig_estado;
        end
    end

    // Lógica de siguiente estado  
    always_comb begin
        case (estado)
            ESPERE_INICIO: begin
                if (inp)
                    sig_estado = PULSO;
                else
                    sig_estado = ESPERE_INICIO;
            end
            PULSO: begin
                if (inp)
                    sig_estado = PULSO;
                else
                    sig_estado = ESPERE_INICIO;
            end
            default: begin
                sig_estado = ESPERE_INICIO;
            end
        endcase
    end

    // Lógica de salida
    always_comb begin
        case (estado)
            ESPERE_INICIO: begin
                if (inp)
                    out = 1;
                else
                    out = 0;
            end
            PULSO: begin
                out = 0;
            end
        endcase
    end

endmodule
