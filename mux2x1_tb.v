`timescale 1ns/1ps
module mux_tb;
    reg a, b, sel;
    wire y;

    mux2to1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // 🌟 Waveform dump setup
        $dumpfile("mux_wave.vcd");     // name of the dump file
        $dumpvars(0, mux_tb);          // dump all variables in this module

        $display("A B SEL | Y");
        a = 0; b = 0; sel = 0; #10;
        $display("%b %b  %b  | %b", a, b, sel, y);
        a = 0; b = 1; sel = 1; #10;
        $display("%b %b  %b  | %b", a, b, sel, y);
        a = 1; b = 0; sel = 0; #10;
        $display("%b %b  %b  | %b", a, b, sel, y);
        a = 1; b = 1; sel = 1; #10;
        $display("%b %b  %b  | %b", a, b, sel, y);
        $finish;
    end
endmodule

