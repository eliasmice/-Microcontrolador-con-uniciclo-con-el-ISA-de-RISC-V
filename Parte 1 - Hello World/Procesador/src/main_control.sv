module main_control #(
    parameter width_instruc = 7
) (
    input logic [width_instruc-1:0] opcode,
    output logic ALUSrc,
    output logic [1:0] Memto_Reg,
    output logic Reg_Write,
    output logic Mem_read,
    output logic Mem_write,                              
    output logic Branch,
    output logic [1:0] ALU_OP,  
    output logic salto_incon,
    output logic flag_direccion
);
    
    always_comb begin
        case (opcode)
             7'b1101111 : begin  // jal-type
                //supongo que ponemos todas las banderas para realizar el salto
                ALU_OP = 2'b01;  //no usa la alu realmente 
                ALUSrc = 0;
                Memto_Reg =10;//escribimos pc+4 en write back
                Reg_Write = 1;
                Mem_read = 0;
                Mem_write = 0;
                Branch = 1;
                salto_incon=1;
                flag_direccion=0; 
            end
            7'b1100111 : begin  // jalr-type
                //supongo que ponemos todas las banderas para realizar el salto
                ALU_OP = 2'b01;  //no usa la alu realmente
                ALUSrc =0 ;
                Memto_Reg = 10; //escribimos pc+4 en write back
                Reg_Write = 1;
                Mem_read = 0;
                Mem_write = 0;
                Branch = 1;
                salto_incon=1;
                flag_direccion=1; //esto permite que el mux con salida hacia el sumador de direccion sea el registro rs1
            end
            /////////////////////////////////
            7'b0110011 : begin  // R-type
                ALU_OP = 2'b10; 
                ALUSrc = 0;
                Memto_Reg = 00;
                Reg_Write = 1;
                Mem_read = 0;
                Mem_write = 0;
                Branch = 0;
                salto_incon=0;
                flag_direccion=0;
            end
            7'b0000011 : begin // lw
                ALU_OP = 2'b00; 
                ALUSrc = 1;
                Memto_Reg = 01;
                Reg_Write = 1;
                Mem_read = 1;
                Mem_write = 0;
                Branch = 0;
                salto_incon=0;
                flag_direccion=0;
            end
            7'b0010011 : begin // inmediate R
                ALU_OP = 2'b10; 
                ALUSrc = 1;
                Memto_Reg = 00;
                Reg_Write = 1;
                Mem_read = 0;
                Mem_write = 0;
                Branch = 0;
                salto_incon=0;
                flag_direccion=0;
            end
            7'b0100011: begin   //S-type
                ALU_OP = 2'b00; 
                ALUSrc = 1;
                Memto_Reg = 00;
                Reg_Write = 0;
                Mem_read = 0;
                Mem_write = 1;
                Branch = 0;
                salto_incon=0;
                flag_direccion=0;
            end
            7'b1100011: begin   // SB-type
                ALU_OP = 2'b01; 
                ALUSrc = 0;
                Memto_Reg = 00;
                Reg_Write = 0;
                Mem_read = 0;
                Mem_write = 0;
                Branch = 1;
                salto_incon=0;
                flag_direccion=0;
            end
            default: begin // Default case

                ALU_OP = 2'b00; 
                ALUSrc = 0;
                Memto_Reg = 00;
                Reg_Write = 0;
                Mem_read = 0;
                Mem_write = 0;
                Branch = 0;
                salto_incon=0;
                flag_direccion=0;
            end
        endcase
    end

endmodule
