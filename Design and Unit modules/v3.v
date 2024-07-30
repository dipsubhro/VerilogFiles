//building adder of 8 bit 

module adder_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] out,
    output [7:0] carry
);

    assign {carry, out} = a+b;

endmodule