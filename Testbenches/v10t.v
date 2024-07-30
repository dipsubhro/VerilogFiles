module SimpleCPU_tb;

    reg clk;
    reg reset;

    // Instantiate the CPU
    SimpleCPU cpu (
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // Monitor CPU internal states
    initial begin
        $monitor("Time = %0t | PC = %0d | Instruction = %b | ALU Result = %0d | Zero Flag = %b",
                 $time, cpu.pc, cpu.instruction, cpu.alu_result, cpu.zero);
    end
    // Test sequence
    initial begin
        // Initialize memory with some instructions
        cpu.instr_mem[0] = 16'b1000000000010010; // opcode=4 (ADD), rs1=000, rs2=001, rd=010
        cpu.instr_mem[1] = 16'b1000000100110011; // opcode=4 (ADD), rs1=001, rs2=011, rd=011
        cpu.instr_mem[2] = 16'b1000001001000100; // opcode=4 (ADD), rs1=010, rs2=010, rd=100

        // Reset the CPU
        reset = 1;
        #10;
        reset = 0;

        // Run the CPU for a few cycles and monitor the outputs
        #100;

        // Stop the simulation
        $finish;
    end

endmodule
