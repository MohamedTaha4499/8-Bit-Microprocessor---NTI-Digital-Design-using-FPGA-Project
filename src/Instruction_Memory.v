module instruction_memory (
    input wire [3:0] address,
    output wire [7:0] instruction
);
    reg [7:0] rom [0:15];

    initial begin
        rom[0] = 8'b0000_1010;
        rom[1] = 8'b0010_1011;
        rom[2] = 8'b0011_1010;
        rom[3] = 8'b0101_0101;
        rom[4] = 8'b0100_0000;
        rom[5] = 8'b1111_0000;
    end

    assign instruction = rom[address];
endmodule