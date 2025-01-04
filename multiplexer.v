`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2024 06:38:09 PM
// Design Name: 
// Module Name: multiplexer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mux4x1 (
    input a, b, c,
    output f
);
    wire [3:0] D; 

   
    assign D[0] = a;  
    assign D[1] = a;  
    assign D[2] = 0;  
    assign D[3] = a; 

   
    assign f = D[{b, c}];  
endmodule

module mux4x1_tb;
    reg a, b, c;
    wire f;
    mux4x1 uut (
        .a(a),
        .b(b),
        .c(c),
        .f(f)
    );

  
    initial begin
       
        $monitor("Time=%0t | a=%b b=%b c=%b | f=%b", $time, a, b, c, f);

        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;

        // Finish simulation
        $finish;
    end
endmodule



