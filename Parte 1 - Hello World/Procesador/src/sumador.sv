module sumador #(
    parameter W=32
) (
    input logic [W-1:0] pc_actual,
    input logic [W-1:0] inmediato,
    output logic [W-1:0] Result
);
    assign Result=pc_actual+inmediato;
endmodule