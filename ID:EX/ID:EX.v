module IDEX(
    CLK,
    InPC,
    Inrs1val,
    Inrs2val,
    InLoadStoreOrjalAddress,
    InauipcOrlui,
    PC,
    rs1val,
    rs2val,
    LoadStoreOrjalAddress,
    auipcOrlui
);

input CLK;
input [31:0] InPC;
input [31:0] Inrs1val;
input [31:0] Inrs2val;
input [31:0] InLoadStoreOrjalAddress;
input [31:0] InauipcOrlui;
output reg [31:0] PC;
output reg [31:0] rs1val;
output reg [31:0] rs2val;
output reg [31:0] LoadStoreOrjalAddress;
output reg [31:0] auipcOrlui;

always @(posedge CLK) begin
    PC <= InPC;
    rs1val <= Inrs1val;
    rs2val <= Inrs2val;
    LoadStoreOrjalAddress <= InLoadStoreOrjalAddress;
    auipcOrlui <= InauipcOrlui;
end

endmodule