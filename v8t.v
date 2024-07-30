module tb_RAM;

parameter DATA = 8;
parameter ADDR = 4;

reg clk;
reg reset;
reg we;
reg [ADDR-1:0] addr;
reg [DATA-1:0] in;
wire [DATA-1:0] out;

memory_unit uut (
    .clk(clk),
    .reset(reset),
    .we(we),
    .addr(addr),
    .in(in),
    .out(out)
);

always #5 clk = ~clk;

initial begin 
    clk = 0;
    reset = 0;
    we = 0;
    addr = 0;
    in = 0;
    
    $monitor("Time=%t | clk = %b | reset = %b | we = %b | addr = %h | in = %h | out = %h", $time, clk, reset, we, addr, in, out);
    reset = 1; #10;
    reset = 0; #10;

        we = 1;
        addr = 4'h0; in = 8'hAA; #10;
        addr = 4'h1; in = 8'hBB; #10;
        addr = 4'h2; in = 8'hCC; #10;
        addr = 4'h3; in = 8'hDD; #10;

        we = 0;
        addr = 4'h0; #10;
        addr = 4'h1; #10;
        addr = 4'h2; #10;
        addr = 4'h3; #10;

        $finish;

end
endmodule