`include "defines.vh"
module hilo(
    input wire clk,
    input wire rst,
    
    input wire [1:0] we,
    input wire [31:0] hi_i,
    input wire [31:0] lo_i,

    output reg [31:0] hi_o,
    output reg [31:0] lo_o
);

    // write
    always @ (posedge clk) begin
        if (rst) begin
            hi_o <= 32'b0;
            lo_o <= 32'b0;
        end else if (we == 2'b11) begin
            hi_o <= hi_i;
            lo_o <= lo_i;
        end else if (we == 2'b10) begin
            hi_o <= hi_i;
        end else if (we == 2'b01) begin
            lo_o <= lo_i;
        end
    end

endmodule