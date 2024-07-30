
module alu_tb;
    reg [31:0] a, b;
    reg [2:0] op;
    wire [31:0] result;

    ALU uut (.a(a), .b(b), .op(op), .result(result));

    initial begin
  
        a = 32'd10;
        b = 32'd20;
        op = 3'b000;
        #10;
        $display("Result: %d", result);


        a = 32'd30;
        b = 32'd10;
        op = 3'b001;
        #10;
        $display("Result: %d", result);

        a = 32'd01;
        b = 32'd02;
        op = 3'b010;
        #10;
        $display("Result: %d", result);

    end
endmodule