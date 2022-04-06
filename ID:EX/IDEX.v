module IDEX(
    CLK,
    InPC,
    Inrs1val,
    Inrs2val,
    InLoadStoreOrjalAddress,
    InauipcOrlui,
    InALUSourceA,
    InALUSourceB,
    InLoadStore32Address,
    PC,
    rs1val,
    rs2val,
    LoadStoreOrjalAddress,
    auipcOrlui,
    ALUSourceA,
    ALUSourceB,
    LoadStore32Address
);

input CLK;
input [31:0] InPC;
input [31:0] Inrs1val;
input [31:0] Inrs2val;
input [31:0] InLoadStoreOrjalAddress;
input [31:0] InauipcOrlui;
input [1:0] InALUSourceA;
input [2:0] InALUSourceB;
input [31:0] InLoadStore32Address;
output reg [31:0] PC;
output reg [31:0] rs1val;
output reg [31:0] rs2val;
output reg [31:0] LoadStoreOrjalAddress;
output reg [31:0] auipcOrlui;
output reg [1:0] ALUSourceA;
output reg [2:0] ALUSourceB;
output reg [31:0] LoadStore32Address;

always @(posedge CLK) begin
    PC <= InPC;
    rs1val <= Inrs1val;
    rs2val <= Inrs2val;
    LoadStoreOrjalAddress <= InLoadStoreOrjalAddress;
    auipcOrlui <= InauipcOrlui;
    ALUSourceA <= InALUSourceA;
    ALUSourceB <= InALUSourceB;
    LoadStore32Address <= InLoadStore32Address;
end

endmodule