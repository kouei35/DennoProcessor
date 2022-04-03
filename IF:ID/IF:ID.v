module IFID(
    CLK,
    InPC,
    InInst,
    PC,
    Inst
);

input CLK;
input [31:0] InPC;
input [31:0] InInst;
output reg [31:0] PC;
output reg [31:0] Inst;

always @(posedge CLK) begin
    PC <= InPC;
    Inst <= InInst;
end

endmodule