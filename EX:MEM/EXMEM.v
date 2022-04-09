module EXMEM(
    CLK,

    InALUOUT,
    InZ_flag,
    InPC,
    InDmemREB,
    InDmemWEB,
    InEXMEMrd,

    ALUOUT,
    Z_flag,
    PC,
    DmemREB,
    DmemWEB,
    EXMEMrd,
);

input CLK;
input [31:0] InALUOUT;
input [31:0] InPC;
input InDmemREB;
input InDmemWEB;
input [4:0] InEXMEMrd;

output wire [31:0] ALUOUT;
output wire [31:0] PC;
output wire DmemREB;
output wire DmemWEB;
output wire [4:0] EXMEMrd;

always @(posedge CLK) begin
    ALUOUT <= InALUOUT;
    PC <= InPC;
    DmemREB <= InDmemREB;
    DmemWEB <= InDmemWEB;
    EXMEMrd <= InEXMEMrd;
end
endmodule