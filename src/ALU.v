module alu (
    input wire [7:0] acc_in,
    input wire [7:0] data_in,
    input wire [2:0] alu_op,
    output reg [7:0] alu_out,
    output reg C, 
    output reg Z, 
    output reg N  
);

    reg [8:0] temp_add;

    always @(*) begin       
        C = 1'b0;         
        case (alu_op)
            3'b000: begin 
                temp_add = acc_in + data_in; 
                alu_out = temp_add[7:0]; 
                C = temp_add[8];
            end
            3'b001: alu_out = acc_in - data_in; 
            3'b010: alu_out = acc_in * data_in; 
            3'b011: alu_out = acc_in & data_in;
            3'b100: alu_out = acc_in | data_in;
            3'b101: alu_out = acc_in ^ data_in;
            3'b110: alu_out = acc_in << 1;
            3'b111: alu_out = data_in;
            default: alu_out = 8'h00;
        endcase

        Z = (alu_out == 8'h00) ? 1'b1 : 1'b0;
        N = alu_out[7];
    end
endmodule