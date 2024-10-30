module divimux (
    input logic clk, // Reloj de entrada de 10 MHz
    input logic rst,
    output logic enable // Se�al de enable a 400 Hz
);

// Par�metros
parameter CLK_FREQUENCY = 10_000_000; // Frecuencia del reloj de entrada en Hz
parameter TARGET_FREQUENCY = 3000000; // Frecuencia objetivo en Hz
localparam CYCLES_PER_PERIOD = CLK_FREQUENCY / (2*TARGET_FREQUENCY);

// Contador para seguir el n�mero de ciclos
logic [$clog2(CYCLES_PER_PERIOD)-1:0] cycle_counter;


// M�dulo de generaci�n de se�al de enable
always_ff @(posedge clk) begin
    if (rst) begin
        cycle_counter <= 0;
        enable <= 1'b0;
    end else begin
        if (cycle_counter == CYCLES_PER_PERIOD - 1) begin
            cycle_counter <= 0;
            enable <= ~enable; // Cambiar el estado de la se�al de enable cada per�odo
        end else begin
            cycle_counter <= cycle_counter + 1;
        end
    end
end

endmodule
