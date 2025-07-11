`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2025 20:15:22
// Design Name: 
// Module Name: top
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

module top (
    input clk,
    input rst,
    output reg [7:0] edge_out
);

    parameter WIDTH = 64;
    parameter HEIGHT = 64;

    reg [11:0] addr = 0;
    wire [7:0] pixel;

    reg [7:0] line1[0:WIDTH-1];
    reg [7:0] line2[0:WIDTH-1];

    reg [7:0] p00, p01, p02;
    reg [7:0] p10, p11, p12;
    reg [7:0] p20, p21, p22;

    reg [6:0] row = 0, col = 0;

    image_loader img_loader (
        .clk(clk),
        .rst(rst),
        .addr(addr),
        .pixel(pixel)
    );

    wire [7:0] edge_pixel;

    sobel_filter sobel (
        .clk(clk),
        .p00(p00), .p01(p01), .p02(p02),
        .p10(p10), .p11(p11), .p12(p12),
        .p20(p20), .p21(p21), .p22(p22),
        .edge_out(edge_pixel)
    );

    always @(posedge clk) begin
        if (rst) begin
            addr <= 0;
            row <= 0;
            col <= 0;
            edge_out <= 8'd0;
        end else begin
            p00 <= p01; p01 <= p02;
            p10 <= p11; p11 <= p12;
            p20 <= p21; p21 <= p22;

         if (row >= 2 && col >= 2) begin
              p02 <= line2[col];
              p12 <= line1[col];
              p22 <= pixel;
         end else begin
              p00 <= 0; p01 <= 0; p02 <= 0;
              p10 <= 0; p11 <= 0; p12 <= 0;
              p20 <= 0; p21 <= 0; p22 <= 0;
              edge_out <= 0;
         end


            line2[col] <= line1[col];
            line1[col] <= pixel;

            if (row >= 2 && col >= 2)
                edge_out <= edge_pixel;
            else
                edge_out <= 0;

            col <= col + 1;
            addr <= addr + 1;

            if (col == WIDTH - 1) begin
                col <= 0;
                row <= row + 1;
            end
        end
    end
endmodule

