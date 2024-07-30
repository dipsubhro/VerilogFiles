module decoder_tb;

reg [2:0] in;
wire [7:0] out;

decoder uut (
    .in(in),
    .out(out)
);

initial begin 
    $monitor("%t | in = %b | out = %b", $time, in, out);

    in = 3'b000; #10;
    in = 3'b001; #10;
    in = 3'b010; #10;
    in = 3'b011; #10;
    in = 3'b100; #10;
    in = 3'b101; #10;
    in = 3'b110; #10;
    in = 3'b111; #10;
    
    $finish;
end 


endmodule