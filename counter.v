`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ediglobe
// Engineer: Eragam Reddy Sushma Chandana
// 
// Create Date: 10/13/2024 06:16:57 PM
// Design Name: 
// Module Name: counter
// Project Name:4 bit mod 13 counter
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
module mod13_counter (
    input clk, rst,
    output reg [3:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 4'b0000;  
        else if (count == 4'd12) 
            count <= 4'b0000;
        else 
            count <= count + 1;
    end
endmodule
`timescale 1ns/1ps

module mod13_counter_tb;
    reg clk, rst;
    wire [3:0] count;
    mod13_counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

   
    initial begin
      
        rst = 1; 
        #10 rst = 0;  

        #250;

        rst = 1; 
        #10 rst = 0; 
        #100 $finish;
    end

   
    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%d", $time, rst, count);
    end
endmodule


