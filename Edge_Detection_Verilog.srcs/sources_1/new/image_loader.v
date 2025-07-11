`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2025 20:14:34
// Design Name: 
// Module Name: image_loader
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


module image_loader (
    input clk,
    input rst,
    input [11:0] addr,
    output reg [7:0] pixel
);

    reg [7:0] image_mem [0:4095];  // 64x64 = 4096 pixels

    initial begin
        $readmemh("image_mem.mem", image_mem);
    end

    always @(posedge clk) begin
        if (rst)
            pixel <= 0;
        else
            pixel <= image_mem[addr];
    end

endmodule

