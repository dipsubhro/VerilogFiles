//Building a half adder module
`timescale 1ns / 1ps

module half_add(s,c,a,b);
input a,b;
output s,c;
xor (s,a,b);
and (c,a,b);
endmodule

