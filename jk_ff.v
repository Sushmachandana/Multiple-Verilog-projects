`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ediglobe project
// Engineer: Eragam Reddy Sushma Chandana
// 
// Create Date: 10/13/2024 06:00:34 PM
// Design Name: 
// Module Name: jk_ff
// Project Name: JK FlipFlop using D FlipFlop
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

module JKFF (
    input J, K, clk, rst,
    output reg Q
);
    wire D;
    assign D = (J & ~Q) | (~K & Q);
    always @(posedge clk or posedge rst) begin
        if (rst) 
            Q <= 0;
        else 
            Q <= D;
    end
endmodule

module JKFF_tb;
    reg J, K, clk, rst;
    wire Q;
    JKFF uut (
        .J(J), 
        .K(K), 
        .clk(clk), 
        .rst(rst), 
        .Q(Q)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial begin
        rst = 1; J = 0; K = 0;
        #10 rst = 0;  
        #10 J = 0; K = 0;  
        #10 J = 0; K = 1;  
        #10 J = 1; K = 0;  
        #10 J = 1; K = 1;  
        #10 J = 1; K = 1;
        #10 J = 1; K = 1;


        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | J=%b K=%b Q=%b", $time, J, K, Q);
    end
endmodule


