module tb_register8bit;

reg clk;
reg enable;
reg reset;
reg [7:0] in;
wire [7:0] out;

register uut (
    .clk(clk),
    .enable(enable),
    .reset(reset),
    .in(in),
    .out(out)
);

always #5 clk = ~clk;

initial begin 
    clk = 0;
    reset = 0;
    enable = 0;
    in = 8'b00000000;

    $monitor("Time = %t | clk = %b | reset = %b | enable = %b | in = %b | out = %b", $time, clk, reset, enable, in, out);
    reset = 1; #10;
        reset = 0; #10;

        in = 8'b10101010; enable = 0; #10;
        
        enable = 1; #10;

        in = 8'b01010101; #10;

        enable = 0; #10;

        reset = 1; #10;
        reset = 0; #10;

        $finish;
end


endmodule