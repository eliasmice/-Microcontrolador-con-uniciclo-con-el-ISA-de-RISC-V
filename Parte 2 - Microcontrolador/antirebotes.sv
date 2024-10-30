


module antirebotes (
    input logic clk,
    input logic pulse,
    output logic detected_pulse
);

// Definici?n de par?metros para los estados
parameter IDLE_STATE = 2'b00;
parameter DETECT_STATE = 2'b01;

// Declaraci?n de se?ales de estado y salida
logic [1:0] state, next_state;
logic output_pulse;


// L?gica combinacional para la l?gica de transici?n y salida
always @(posedge clk) begin
        state <= next_state;
        detected_pulse <= output_pulse;
end

// Lógica secuencial para la máquina de estados
always @(*) begin
    case (state)
        IDLE_STATE: begin
            if (pulse) begin
                next_state = DETECT_STATE;
                output_pulse = 0;
            end
            else begin
                next_state = IDLE_STATE;
                output_pulse = 0;
            end
        end
        DETECT_STATE: begin
            if (pulse) begin
                next_state = DETECT_STATE;
                output_pulse = 1;
            end
            else begin
                next_state = IDLE_STATE;
                output_pulse = 0; // Cambiado a 0 cuando el pulso está bajo
            end
        end
    endcase
end

// Inicialización de variables
initial begin
    state = IDLE_STATE;
    next_state = IDLE_STATE;
    output_pulse = 0;
end


endmodule



