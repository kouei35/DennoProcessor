module IMEM(
    ADDR_IN_ROM,
    Inst
);

input [31:0] ADDR_IN_ROM;
output reg [31:0] Inst;

always @* begin
case(ADDR_IN_ROM) 
32'h0:  Inst <= 32'd1400031;
32'h4:  Inst <= 32'h10;
32'h8:  Inst <= 32'h11;
32'hC: Inst <= 32'h100;
default:Inst <= 32'h0;
endcase
end

endmodule
