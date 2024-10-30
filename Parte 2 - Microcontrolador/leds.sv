

module leds_control (
    input logic clk,
    input logic reset,
    input logic we_leds,
    input logic [31:0] reg_data,
    output logic [15:0] leds
);
    // Inicializa los LEDs en 0
    initial begin
        leds = 16'b0;
    end
    
    
    // Lógica secuencial para los LEDs
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            leds <= 16'b0;  // Si reset está activo, los LEDs se ponen a 0
        end else if (we_leds) begin
            leds <= reg_data[15:0];  // Si we_leds está activo, los LEDs toman el valor de los 16 bits menos significativos del registro
        end
    end

endmodule
