module tb_mux2to1;

    // Inputs
    reg a;
    reg b;
    reg sel;

    // Outputs
    wire y;

    // Instantiate the DUT
    mux2to1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    // Stimulus block
    initial begin
        // Display the header for the output
        $display("Time\t a b sel | y");
        $display("--------------------");

        // Apply test vectors
        a = 0; b = 0; sel = 0; #10;
        $display("%g\t %b %b %b  | %b", $time, a, b, sel, y);

        a = 0; b = 1; sel = 0; #10;
        $display("%g\t %b %b %b  | %b", $time, a, b, sel, y);

        a = 1; b = 0; sel = 0; #10;
        $display("%g\t %b %b %b  | %b", $time, a, b, sel, y);

        a = 1; b = 1; sel = 0; #10;
        $display("%g\t %b %b %b  | %b", $time, a, b, sel, y);

        a = 0; b = 0; sel = 1; #10;
        $display("%g\t %b %b %b  | %b", $time, a, b, sel, y);

        a = 0; b = 1; sel = 1; #10;
        $display("%g\t %b %b %b  | %b", $time, a, b, sel, y);

        a = 1; b = 0; sel = 1; #10;
        $display("%g\t %b %b %b  | %b", $time, a, b, sel, y);

        a = 1; b = 1; sel = 1; #10;
        $display("%g\t %b %b %b  | %b", $time, a, b, sel, y);

        // Finish simulation
        $finish;
    end

endmodule