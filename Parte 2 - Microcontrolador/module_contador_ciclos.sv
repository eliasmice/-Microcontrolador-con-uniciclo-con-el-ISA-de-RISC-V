module cycle_counter (
    input logic reset,            // Señal de reset
    input logic clk,              // Señal de reloj
    input logic [31:0] activation, // Señal de activación (2'b01 para iniciar, 2'b10 para detener)
    input logic we_7seg,          // Nueva señal de habilitación
    output logic [31:0] counter   // Registro del contador con valores de control
);

    logic counting;

    // Lógica secuencial para el contador
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 32'b1;
            counting <= 1'b0;
        end 
            // Almacenar la señal de activación en los bits 16 y 17
        counter[17:16] <= activation[1:0];
            // Almacenar la señal de enable en el bit 18
        counter[18] <= we_7seg;
            
        if (counter[18]) begin  
            if (counter[17:16] == 2'b01 ) counter <= 1;
        end

        if (!counter[18]) begin
            if ({counter[17:16]} == 2'b01) begin
                counting <= 1'b1; // Iniciar el conteo
            end 
            else if ({counter[17:16]} == 2'b10) begin
                counting <= 1'b0; // Detener el conteo
            end
            if (counting) begin
                counter[15:0] <= counter[15:0] + 1;
            end
        end
        
    end

endmodule