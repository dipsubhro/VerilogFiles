module BCD_adder(
    input [3:0] a,  // First BCD digit (0-9)
    input [3:0] b,  // Second BCD digit (0-9)
    input cin,      // Carry input (0 or 1)
    output [3:0] sum,  // BCD sum digit (0-9)
    output cout     // Carry output (0 or 1)
);

    wire [4:0] binary_sum;  // 5-bit sum to capture carry
    wire [3:0] corrected_sum;
    wire correction_needed;

    // Perform binary addition
    assign binary_sum = a + b + cin;

    // Determine if correction is needed
    assign correction_needed = (binary_sum > 5'd9) ? 1'b1 : 1'b0;

    // Correct the sum if necessary by adding 6
    assign corrected_sum = correction_needed ? (binary_sum + 5'd6) : binary_sum;

    // Assign outputs
    assign sum = corrected_sum[3:0];
    assign cout = corrected_sum[4];

endmodule