`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2024 06:28:51 PM
// Design Name: 
// Module Name: updowncounter
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

module up_down_counter (
    input clk, rst, up_down,  // up_down = 1 -> Count Up, up_down = 0 -> Count Down
    output reg [3:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;  
        else if (up_down)
            count <= count + 1;  
        else
            count <= count - 1;  
    end
endmodule


module up_down_counter_tb;
    reg clk, rst, up_down;
    wire [3:0] count;

   
    up_down_counter uut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );

   
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

 
    initial begin
        
        rst = 1; 
        #10 rst = 0; 

       
        up_down = 1;  
        #80;         

      
        up_down = 0;  
        #80;         

      
        rst = 1; 
        #10 rst = 0; 

        #50 $finish;
    end
    initial begin
        $monitor("Time=%0t | Reset=%b | Up_Down=%b | Count=%d", 
                 $time, rst, up_down, count);
    end
endmodule


