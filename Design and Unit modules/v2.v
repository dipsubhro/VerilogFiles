// Building Multiplexer 2 x 1
module mux2to1(
    input wire a,
    input wire b,
    input wire sel,
    output wire y
);
    assign y = sel ? b : a;
endmodule