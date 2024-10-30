
module switches_buttons(
    input logic clk,
    input  logic [19:0] in,  // Entrada de 20 bits: [15:0] switches, [19:16] push buttons
    output logic [31:0] out_sw_bt   // Salida del registro de 32 bits
);

logic [19:0] in_debounce;
logic [19:0] in_sinc;




    // Genera instancias de los módulos antirebotes y sincronizador para cada bit de entrada
genvar i;
generate
    for (i = 16; i < 20; i++) begin : gen_buttons
            antirebotes dut (
                .clk(clk),
                .pulse(in[i]),
                .detected_pulse(in_debounce[i])
            );

            sincronizador sinc (
                .clk(clk),
                .inp(in_debounce[i]),
                .out(in_sinc[i])
            );
        end
endgenerate


    
genvar j;
generate
    for (j = 0; j < 16; j++) begin : gen_switches
        antirebotes dut (   //Solo añade antirebotes, ya que es un switch, con el antirebotes se sincroniza
                .clk(clk),
                .pulse(in[j]),
                .detected_pulse(in_debounce[j])
            );

       
        end
endgenerate




    


    // Combinational logic to set the output register
    always_comb begin
        out_sw_bt = 32'b0;            // Inicializa todos los bits en 0
        out_sw_bt[19:16] = in_sinc[19:16];
        out_sw_bt[15:0] = in_debounce[15:0];    // Asigna los 20 bits menos significativos de la entrada a los 20 bits menos significativos de la salida
    end

endmodule