module cpu_top (
    input wire clk,
    input wire reset
);

    wire [3:0] pc_out;
    wire [7:0] instruction, memory_data_out, alu_result, acc_out;
    wire pc_inc, pc_load, acc_load, mem_write;
    wire [2:0] alu_op;
    wire alu_C, alu_Z, alu_N, flag_C, flag_Z, flag_N;
    
    wire [3:0] opcode = instruction[7:4];
    wire [3:0] address = instruction[3:0];

    program_counter PC (.clk(clk), .reset(reset), .pc_inc(pc_inc), .pc_load(pc_load), .load_addr(address), .pc_out(pc_out));
    
    instruction_memory ROM (.address(pc_out), .instruction(instruction));
    
    data_memory RAM (.clk(clk), .write_enable(mem_write), .address(address), .data_in(acc_out), .data_out(memory_data_out));
    
    control_unit CU (.opcode(opcode), .flag_Z(flag_Z), .flag_C(flag_C), .pc_inc(pc_inc), .pc_load(pc_load), .acc_load(acc_load), .mem_write(mem_write), .alu_op(alu_op));
    
    accumulator ACC (.clk(clk), .reset(reset), .acc_load(acc_load), .data_in(alu_result), .acc_out(acc_out));
    
    status_register SR (.clk(clk), .reset(reset), .update_flags(acc_load), .alu_C(alu_C), .alu_Z(alu_Z), .alu_N(alu_N), .C(flag_C), .Z(flag_Z), .N(flag_N));
    
    alu ALU_UNIT (.acc_in(acc_out), .data_in(memory_data_out), .alu_op(alu_op), .alu_out(alu_result), .C(alu_C), .Z(alu_Z), .N(alu_N));

endmodule