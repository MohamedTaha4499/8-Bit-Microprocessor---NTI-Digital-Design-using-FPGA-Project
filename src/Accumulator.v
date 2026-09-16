module accumulator (
    input wire clk,
    input wire reset,
    input wire acc_load,
    input wire [7:0] data_in,
    output reg [7:0] acc_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            acc_out <= 8'h00;
        end else if (acc_load) begin
            acc_out <= data_in;
        end
    end
endmodule