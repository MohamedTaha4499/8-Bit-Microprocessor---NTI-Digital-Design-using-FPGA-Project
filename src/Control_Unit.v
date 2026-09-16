module control_unit (
    input wire [3:0] opcode,
    input wire flag_Z,
    input wire flag_C,
    output reg pc_inc,
    output reg pc_load,
    output reg acc_load,
    output reg mem_write,
    output reg [2:0] alu_op 
);
    
    localparam LOAD = 4'b0000;
    localparam ADD  = 4'b0001;
    localparam SUB  = 4'b0010;
    localparam SAVE = 4'b0011;
    localparam JUMP = 4'b0100;
    localparam JZ   = 4'b0101;
    localparam JC   = 4'b0110;
    localparam HALT = 4'b1111;

    always @(*) begin
        pc_inc = 1'b0; pc_load = 1'b0; acc_load = 1'b0;
        mem_write = 1'b0; alu_op = 3'b000;

        case (opcode)
            LOAD: begin acc_load = 1'b1; pc_inc = 1'b1; alu_op = 3'b111; end 
            ADD:  begin acc_load = 1'b1; pc_inc = 1'b1; alu_op = 3'b000; end
            SUB:  begin acc_load = 1'b1; pc_inc = 1'b1; alu_op = 3'b001; end
            SAVE: begin mem_write = 1'b1; pc_inc = 1'b1; end
            JUMP: begin pc_load = 1'b1; end
            JZ:   begin 
                if (flag_Z) pc_load = 1'b1; 
                else pc_inc = 1'b1; 
            end
            JC:   begin 
                if (flag_C) pc_load = 1'b1; 
                else pc_inc = 1'b1; 
            end
            HALT: begin
            end
            default: pc_inc = 1'b1;
        endcase
    end
endmodule