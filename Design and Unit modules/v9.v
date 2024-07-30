// Building a Arithmetic Logic unit or ALU

module ALU(
    input [31:0] a,
    input [31:0] b,
    input [2:0] op,
    output reg [31:0] result
) ;

parameter ADD = 3'b000;
parameter SUB = 3'b001;
parameter AND = 3'b010;
parameter OR = 3'b011;
parameter XOR = 3'b100;
parameter SLT = 3'b101;
parameter SGT = 3'b110;
parameter SEQ = 3'b111;

always @(a, b, op) begin 
    case(op)
        ADD: result = a + b;
        SUB: result = a - b;
        AND: result = a & b;
        OR: result = a | b;
        XOR: result = a ^ b;
        SLT: result = (a < b) ? 32'b1 : 32'b0;
        SGT: result = (a > b) ? 32'b1 : 32'b0;
        SEQ: result = (a == b) ? 32'b1 : 32'b0;
        default: result = 32'b0; 
    endcase
end 

endmodule