module registro_control_gauss (
    input logic clk,         
    input logic rst,

    input logic senal,
    input logic [31:0] in_c, 
    input logic we,
    input logic we_fsm,

    output reg [31:0] out_c
);

reg [31:0] registro;

always_comb begin: read
    out_c = registro;
end

always_ff @(posedge clk) begin : write
    if (rst) begin
        registro <= 32'b0;
    end
    if (we) begin
        registro <= {31'b000000000000000000000000000000,senal};
    end
    if (we_fsm) begin
        registro <= in_c;
    end
end

endmodule