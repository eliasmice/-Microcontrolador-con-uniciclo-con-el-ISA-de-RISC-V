module control_salto #(
    parameter W = 32
) (
    input logic [W-1:0] instruccion, 
    input logic [1:0] comparador_code,
    output logic salto  //me permite decidir sobre el salto
);
   
wire [2:0] field_3 = instruccion[14:12];
wire [6:0] opcode = instruccion[6:0];
   always_comb begin
    case (comparador_code)
        2'b01: begin
            if (field_3 == 3'b000 && opcode == 7'b 1100011) salto = 1'b1;//beq salte
            else if(field_3 == 3'b001 && opcode == 7'b 1100011) salto=1'b0;//bne no salte
        end

        2'b10: begin
            if ((field_3 == 3'b001 || field_3 == 3'b101) && opcode == 7'b 1100011) salto = 1'b1;
        end

        2'b00: begin
            if ((field_3 == 3'b001 || field_3 == 3'b100) && opcode == 7'b 1100011) salto = 1'b1;
        end
        default: salto=1'b0;
    endcase
end
endmodule
//01 iguales
//10 mayor y diferentes
//00 menor y diferentes
//beq bne blt bge
