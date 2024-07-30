`timescale 1ns/1ps

module adder_tb;
//inputs
reg [7:0] a;
reg [7:0] b;
//outputs
wire [7:0] sum;
wire [7:0] carry;
//instantiating the adder
adder_8bit uut_adder (
    .a(a),
    .b(b),
    .out(sum),
    .carry(carry)
);
initial 
begin 
    a <= 8'b00001101;
    b <= 8'b00000101;
    #2;

    $display ("%d + %d = %d with carry %b", a,b,sum,carry);
    $finish;
end 

endmodule 