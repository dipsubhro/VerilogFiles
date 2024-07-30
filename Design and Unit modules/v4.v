//designing a BCD Adder

module BCD_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

 wire [4:0] binary_sum;
 wire [3:0] corrected_sum;
 wire correction_needed;

 assign binary_sum = a + b + cin;
 assign correction_needed = (binary_sum > 5'd9) ? 1'b1 : 1'b0;
 assign corrected_sum = correction_needed ? (binary_sum + 5'd6) : binary_sum;

 assign sum = corrected_sum[3:0];
 assign cout = corrected_sum[4];

endmodule 