//Designing a 8bit register

module register (
    input clk,
    input reset,
    input enable,
    input [7:0] in,
    output reg [7:0] out 
);

always @(posedge clk or posedge reset) begin

    if(reset) 
    begin 
        out <= 8'b00000000;
    end 

    else if(clk) 
    begin 
        out <= in;
    end
end

endmodule