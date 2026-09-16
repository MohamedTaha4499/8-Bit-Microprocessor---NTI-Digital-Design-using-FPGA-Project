module data_memory (
    input wire clk,
    input wire write_enable,
    input wire [3:0] address,
    input wire [7:0] data_in,
    output wire [7:0] data_out
);
    reg [7:0] ram [0:15];

    initial begin
        ram[10] = 8'd3;
        ram[11] = 8'd1;
    end

    always @(posedge clk) begin
        if (write_enable) ram[address] <= data_in;
    end

    assign data_out = ram[address];
endmodule