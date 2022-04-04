module IFIDBlock(
    CLK,
    PCsel,
    RSTB,
    CNTEN,
    JumporBranch,
    IFIDOUTPC,
    IFIDOUTInst
);

input CLK;
input RSTB,CNTEN;
input PCsel;
input [31:0] JumporBranch;
output [31:0] IFIDOUTPC;
output [31:0] IFIDOUTInst;

wire [31:0] PCIN;
wire [31:0] PCAdderOUT;
wire [31:0] ADDR_OUT_ROM;
wire [31:0] Inst;

PCmux PCmux(.PCsel(PCsel),.PC(PCAdderOUT),.PCIN(PCIN));
PC PC(.CLK(CLK),.RSTB(RSTB),.CNTEN(CNTEN),.PCIN(PCIN),.ADDR_OUT_ROM(ADDR_OUT_ROM));
PCAdder PCAdder(.PC(ADDR_OUT_ROM),.PCIN(PCAdderOUT));
IMEM IMEM(.ADDR_IN_ROM(ADDR_OUT_ROM),.Inst(Inst));
IFID IFID(.CLK(CLK),.InPC(PCIN),.InInst(Inst),.PC(IFIDOUTPC),.Inst(IFIDOUTInst));

endmodule