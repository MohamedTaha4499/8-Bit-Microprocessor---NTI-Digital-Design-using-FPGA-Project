module status_register (
    input wire clk,
    input wire reset,
    input wire update_flags,
    input wire alu_C,
    input wire alu_Z,
    input wire alu_N,
    output reg C,
    output reg Z,
    output reg N
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            C <= 1'b0; Z <= 1'b0; N <= 1'b0;
        end else if (update_flags) begin
            C <= alu_C; Z <= alu_Z; N <= alu_N;
        end
    end
endmodule