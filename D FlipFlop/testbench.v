`timescale 1ns/1ps

module dff_tb;

    reg clk, rst, d;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Stimulus
    initial begin
        // Set up waveform dump
        $dumpfile("dff_wave.vcd");
        $dumpvars(0, dff_tb);

        // Initial values
        rst = 1; d = 0;
        #12;
        
        rst = 0; d = 1;
        #10;
        
        d = 0;
        #10;

        d = 1;
        #10;

        d = 0;
        #10;

        rst = 1; // Trigger reset
        #10;

        rst = 0;
        d = 1;
        #10;

        $finish;
    end

endmodule
