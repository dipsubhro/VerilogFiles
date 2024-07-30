module adder_tb;

reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] sum;
wire cout;

BCD_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin 
       // Initialize inputs
    a = 4'b0000;
    b = 4'b0000;
    cin = 1'b0;

    // Monitor outputs
    $monitor("Time = %0t | a = %b (%0d), b = %b (%0d), cin = %b | sum = %b (%0d), cout = %b", 
             $time, a, a, b, b, cin, sum, sum, cout);

    // Test cases
    $display("Applying test case 1: 6 + 3");
    a = 4'b0110; b = 4'b0011; cin = 1'b0;
    #10;

    $display("Applying test case 2: 7 + 5");
    a = 4'b0111; b = 4'b0101; cin = 1'b0;
    #10;

    $display("Applying test case 3: 8 + 4");
    a = 4'b1000; b = 4'b0100; cin = 1'b0;
    #10;

    $display("Applying test case 4: 9 + 9");
    a = 4'b1001; b = 4'b1001; cin = 1'b0;
    #10;

    $display("Applying test case 5: 5 + 6 + 1");
    a = 4'b0101; b = 4'b0110; cin = 1'b1;
    #10;

    // End simulation
    $finish;
end 
endmodule 