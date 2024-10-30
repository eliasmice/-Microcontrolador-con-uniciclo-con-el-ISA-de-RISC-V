module filtro_fsm (
    input logic clk,
    input logic reset,
    input logic [31:0] out_control,
    input logic conto9,
    output logic inicio, cuente9, we_c, we_d,
    output logic [3:0] control
);

    logic [2:0] out_c;
    assign out_c = out_control[2:0];

    // Definición de estados
    typedef enum logic [1:0] {
        ESPERE = 2'b00,
        RECIBIR = 2'b01,
        CALCULAR = 2'b10,
        GUARDAR = 2'b11
    } state_t;

    state_t state, next_state;

    // Lógica de transición de estados
    always_ff @(posedge clk or negedge reset) begin
        if (reset)
            state <= ESPERE;
        else
            state <= next_state;
    end

    // Lógica secuencial para determinar el siguiente estado
    always @(*) begin
        case (state)
            ESPERE: begin
                if (out_c[0] == 1) begin
                    next_state = RECIBIR;
                end
                if (out_c == 3'b000) begin
                    next_state = ESPERE;
                end
            end
            
            RECIBIR: begin 
                if (conto9) begin
                    next_state = CALCULAR;
                end
                else if (!conto9) begin
                    next_state = RECIBIR;
                end
            end
          
            CALCULAR: begin 
                @(posedge clk);
                @(posedge clk);
                next_state = GUARDAR;
            end
            
            GUARDAR: begin 
                next_state = ESPERE;
            end
            
            default: next_state = ESPERE;
        endcase
    end

    // Lógica para la salida
    always @(*) begin
        case (state)
            ESPERE: begin
                if (out_c == 3'b001) begin
                    inicio =    1'b0;
                    cuente9 =   1'b1;
                    control =   4'b0001;
                    we_c = 1'b0;
                    we_d = 1'b1;
                end 
                if (out_c == 3'b000) begin
                    inicio =    1'b0;
                    cuente9 =   1'b0;
                    control =   4'b0000;
                    we_c = 1'b0;
                    we_d = 1'b0;
                end
            end
            
            RECIBIR: begin 
                if (conto9) begin
                    inicio =    1'b0;
                    cuente9 =   1'b0;
                    control =   4'b0110;
                    we_c = 1'b1;
                    we_d = 1'b0;
                end
                else if (!conto9) begin
                    inicio =    1'b0;
                    cuente9 =   1'b1;
                    we_c = 1'b0;
                    we_d = 1'b1;
                end
            end
            
            CALCULAR: begin 
                inicio =    1'b1;
                cuente9 =   1'b0;
                control =   4'b1110;
                we_c = 1'b1;
                we_d = 1'b0;
            end
            
            GUARDAR:begin 
                inicio =    1'b0;
                cuente9 =   1'b0;
                control =   4'b0000;
                we_c = 1'b1;
                we_d = 1'b1;
            end
            
            default: begin 
                inicio =    1'b0;
                cuente9 =   1'b0;
                control =   4'b0000;
                we_c = 1'b0;
                we_d = 1'b0;
            end
        endcase
    end

endmodule