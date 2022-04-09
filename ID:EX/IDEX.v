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
    LoadStore32Address,
    InIDEXrs1,
    InIDEXrs2,
    InIDEXrd,
    InIDEXregWrite,
    IDEXrs1,
    IDEXrs2,
    IDEXregWrite,
    IDEXrd
);

input CLK;
input [31:0] InPC;
input [31:0] Inrs1val;
input [31:0] Inrs2val;
input [31:0] InLoadStoreOrjalAddress;
input [31:0] InauipcOrlui;
input InALUSourceA;
input [1:0] InALUSourceB;
input [31:0] InLoadStore32Address;
input [4:0] InIDEXrs1;
input [4:0] InIDEXrs2;
input [4:0] InIDEXrd;
input InIDEXregWrite;
output reg [4:0] IDEXrs1;
output reg [4:0] IDEXrs2;
output reg [31:0] PC;
output reg [31:0] rs1val;
output reg [31:0] rs2val;
output reg [31:0] LoadStoreOrjalAddress;
output reg [31:0] auipcOrlui;
output reg ALUSourceA;
output reg [1:0] ALUSourceB;
output reg [31:0] LoadStore32Address;
output reg [4:0] IDEXrd;
output reg IDEXregWrite;

always @(posedge CLK) begin
    PC <= InPC;
    rs1val <= Inrs1val;
    rs2val <= Inrs2val;
    LoadStoreOrjalAddress <= InLoadStoreOrjalAddress;
    auipcOrlui <= InauipcOrlui;
    ALUSourceA <= InALUSourceA;
    ALUSourceB <= InALUSourceB;
    LoadStore32Address <= InLoadStore32Address;
    IDEXrs1 <= InIDEXrs1;
    IDEXrs2 <= InIDEXrs2;
    IDEXregWrite <= InIDEXregWrite;
    IDEXrd <= InIDEXrd;
    IDEXregWrite <= InIDEXregWrite;
end

endmodule