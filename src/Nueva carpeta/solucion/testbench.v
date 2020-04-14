`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2020 16:49:25
// Design Name: 
// Module Name: testbench
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
module testbench;
    reg [15:0] num;
    reg clk;
    reg rst;
    
    wire [0:6] sseg;
    wire [3:0] an;
    
    display display4 (.num(num),.clk(clk),.sseg(sseg),.an(an),.rst(rst));
    
    initial begin
        clk=0;
        rst=1;
        #5 rst=0;
        num= 16'h4321;
    end
    always #1 clk=~clk;
	
endmodule
