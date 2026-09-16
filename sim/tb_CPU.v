`timescale 1ns/1ps

module tb_cpu;
    reg clk;
    reg reset;

    cpu_top UUT (.clk(clk), .reset(reset));

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin        
        $display("starting advanced verification");           
        reset = 1; #15; reset = 0;

        #250;         
        
        if (UUT.RAM.ram[10] == 8'd0) begin
            $display(" loop executed successfully - counter reached 0.");
        end else begin
            $display(" loop failed - final Counter = %d", UUT.RAM.ram[10]);
        end
        
        $display("simulation complete.");
        $stop;
    end
endmodule