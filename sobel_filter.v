`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2025 20:15:00
// Design Name: 
// Module Name: sobel_filter
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

module sobel_filter (
    input clk,
    input [7:0] p00, p01, p02,
    input [7:0] p10, p11, p12,
    input [7:0] p20, p21, p22,
    output reg [7:0] edge_out
);

    reg [10:0] gx, gy;
    reg [10:0] mag;

    always @(posedge clk) begin
        gx = (p02 + 2*p12 + p22) - (p00 + 2*p10 + p20);
        gy = (p00 + 2*p01 + p02) - (p20 + 2*p21 + p22);

        mag = (gx > 0 ? gx : -gx) + (gy > 0 ? gy : -gy);
        edge_out <= (mag > 255) ? 8'd255 : mag[7:0];
    end

endmodule

