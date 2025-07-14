
module tb_encoder4to2;
    reg [3:0] in;
    wire [1:0] out;

    // Instantiate the encoder
    encoder4to2 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $display("In3 In2 In1 In0 | Out1 Out0");
        $monitor(" %b   %b   %b   %b |   %b    %b", in[3], in[2], in[1], in[0], out[1], out[0]);

        in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0100; #10;
        in = 4'b1000; #10;
        in = 4'b0111; #10;
        in = 4'b1010; #10;
        in = 4'b1111; #10;

        $finish;
    end
endmodule
