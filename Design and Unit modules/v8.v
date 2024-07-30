// Designing a simple Synchronous RAM

module memory_unit #(
    parameter DATA = 8,
    parameter ADDR = 4
)(
    input clk,
    input reset,
    input we,
    input [ADDR-1:0] addr,
    input [DATA-1:0] in, 
    output reg [DATA-1:0] out
);

reg [DATA-1:0] mem [0:2**ADDR-1];

always @(posedge clk or posedge reset)
begin 
        if(reset)begin 
            out <= {DATA{1'b0}};
        end
        else begin 
            if(we) begin 
                mem[addr] <= in;
            end
            out <= mem[addr]; 
        end 
end

endmodule