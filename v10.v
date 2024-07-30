//Designing a CPU 

/* Building a Cpu consistting all 6 below this
1. ALU
2. Registers
3. Control Unit
4. Instruction decoder 
5. Program Counter
6. Memory(RAM)
*/
//ALU
module Alu(
    input [7:0] a,
    input [7:0] b,
    input [2:0] opcode,
    output reg [7:0] result,
    output reg zero
);

always @(*) begin 
    case (opcode)
        3'b000: result = a + b;
        3'b001: result = a - b;
        3'b010: result = a & b;
        3'b011: result = a | b;
        3'b100: result = a ^ b;
        3'b101: result = ~a;
        3'b110: result = a << 1;
        3'b111: result = a >> 1;
        default: result = 8'b00000000;

    endcase
    zero = (result == 8'b00000000);
end 

endmodule

//Registers

module RegisterFile (
    input clk,
    input we,
    input [2:0] rs1, rs2, rd,
    input [7:0] wd,
    output [7:0] rd1, rd2
);

reg [7:0] registers [7:0];

assign rd1 = registers[rs1];
assign rd2 = registers[rs2];

always @(posedge clk)begin 
    if(we)
        registers[rd] <= wd;
end 

endmodule 

// Instruction Decoder

module InstructionDecoder (
    input [15:0] instruction,
    output reg [2:0] opcode,
    output reg [2:0] rs1, rs2, rd,
    output reg [7:0] imm,
    output reg reg_write
);

always @(*) begin 
    opcode = instruction[15:13];
    rs1 = instruction[12:10];
    rs2 = instruction[9:7];
    rd = instruction[6:4];
    imm = instruction[7:0];
    reg_write = instruction[15];
end

endmodule 

//Program counter

module ProgramCounter (
    input clk,
    input  reset,
    input [7:0] next_pc,
    output reg [7:0] pc
);

always @(posedge clk or posedge reset) begin 
    if(reset)
        pc <= 8'b00000000;
    else
        pc <= next_pc;
end 
endmodule 

//memory 

module memory (
    input clk,
    input we,
    input [7:0] addr,
    input [7:0] wd,
    output [7:0] rd
);

reg [7:0] mem [255:0];

assign rd = mem[addr];

always @(posedge clk) begin 
    if (we)
        mem[addr] <= wd;
end
 
endmodule

// simple cpu top module 

module SimpleCPU (
    input clk,
    input reset
);
    wire [15:0] instruction;
    wire [2:0] opcode, rs1, rs2, rd;
    wire [7:0] imm, rd1, rd2, alu_result;
    wire reg_write, zero;

    // Program Counter
    reg [7:0] pc, next_pc;
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 8'b00000000;
        else
            pc <= next_pc;
    end

    // Instruction Memory (ROM)
    reg [15:0] instr_mem [255:0];
    initial begin
        // Initialize instructions here
    end
    assign instruction = instr_mem[pc];

    // Instruction Decoder
    InstructionDecoder decoder (
        .instruction(instruction),
        .opcode(opcode),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .imm(imm),
        .reg_write(reg_write)
    );

    // Register File
    RegisterFile reg_file (
        .clk(clk),
        .we(reg_write),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(alu_result),
        .rd1(rd1),
        .rd2(rd2)
    );

    // ALU
    Alu alu (
        .a(rd1),
        .b(rd2),
        .opcode(opcode),
        .result(alu_result),
        .zero(zero)
    );

    // Control Unit (Next PC logic)
    always @(*) begin
        next_pc = pc + 1;
    end

endmodule


