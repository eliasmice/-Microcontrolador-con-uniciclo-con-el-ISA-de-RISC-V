module comparador (
    input logic [31:0] rs1, // Primer número
    input logic [31:0] rs2, // Segundo número
    output logic [1:0] comparador_code // Salida de 2 bits

);
//LSB indica igualdad (1) o desigualdad (0)
//MSB indica mayor (1) o menor (0)
    always_comb begin
        if (rs1 == rs2) begin
            comparador_code = 2'b01; // Iguales 
        end
        else if (rs1 > rs2) begin
            comparador_code = 2'b10; // rs1 mayor (y obviamente no iguales)
        end
        else begin
            comparador_code = 2'b00; // rs1 menor (y obviamente no iguales)
        end
    end

endmodule
