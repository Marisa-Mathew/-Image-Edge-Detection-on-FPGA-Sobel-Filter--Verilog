`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2025 20:16:31
// Design Name: 
// Module Name: top_tb
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
module top_tb;

    reg clk = 0;
    reg rst = 1;
    wire [7:0] edge_out;
    integer file;
    integer cycle;

    top uut (
        .clk(clk),
        .rst(rst),
        .edge_out(edge_out)
    );

    // ? This clock block MUST be OUTSIDE initial!
    always #5 clk = ~clk;

    initial begin
        file = $fopen("edge_output.txt", "w");

        // Hold reset briefly
        #20;
        rst = 0;

        // Simulation loop
        for (cycle = 0; cycle < 1000; cycle = cycle + 1) begin
            @(posedge clk);
            $fwrite(file, "%02x\n", edge_out);
            $display("Cycle=%0d, edge_out=%h", cycle, edge_out);
        end

        $fclose(file);
        $stop;
    end
endmodule


