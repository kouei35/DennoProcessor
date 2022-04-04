module IDEX_test();

reg CLK;
reg RSTB,CNTEN;
reg PCsel;
reg [31:0] JumporBranch;
wire [31:0] Inst;
wire [31:0] InPC;

/*Regfile*/
wire [31:0] Inrs1_value;
wire [31:0] Inrs2_value;
wire [31:0] rs1_value;
wire [31:0] rs2_value;
wire RegWrite;
wire [31:0] regfile_indata;

/*Dmem*/
wire Dmem1ALUOUT;
wire DmemREB;
wire DmemWEB;

/*ALU*/
wire [3:0] ALUControl;
wire ALUSourceA;
wire [2:0] ALUSourceB;

/*IDEX mux*/
wire LoadStoremuxsel;
wire mux2sel;
wire [11:0] Load12Address;
wire [11:0] Store12Address;
wire [11:0] LoadStore12Address;
wire [31:0] LoadStoreOrjal;         //Output of mux2

/*twelve2thirtytwosext*/
wire [31:0] LoadStore32Address;

/*Output of twenty2thirtytwosext*/
wire [31:0] InstUpper20ext;

/*output of shifter1*/
wire [31:0] InLoadStoreOrjalAddress;

/*output of shifter12*/
wire [31:0] InauipcOrlui;

/*IDEX*/
wire [31:0] PC;
wire [31:0] LoadStoreOrjalAddress;
wire [31:0] auipcOrlui;

ControlUnit ControlUnit(.Opecode(Inst[31:25]),.ALUOp(Inst[14:12]),.funct(Inst[6:0]),.Dmem1ALUOUT(Dmem1ALUOUT),.DmemREB(DmemREB),.DmemWEB(DmemWEB),.ALUControl(ALUControl),.ALUSourceA(ALUSourceA),.ALUSourceB(ALUSourceB),.LoadStoremuxsel(LoadStoremuxsel),.mux2sel(mux2sel));
regfile regfile(.rs1(Inst[19:15]),.rs2(Inst[24:20]),.rd(Inst[11:7]),.CLK(CLK),.RegWrite(RegWrite),.indata(regfile_indata),.rs1_value(Inrs1_value),.rs2_value(Inrs2_value));
LoadStoremux LoadStoremux(.Load12Address(Inst[31:20]),.Store12Address({Inst[31:25],Inst[11:7]}),.LoadStoremuxsel(LoadStoremuxsel),.LoadStore12Address(LoadStore12Address));
twelve2thirtytwosext twelve2thirtytwosext(.LoadStore12Address(LoadStore12Address),.LoadStore32Address(LoadStore32Address));
twenty2thirtytwosext twenty2thirtytwosext(.InstUpper20(Inst[31:12]),.InstUpper20ext(InstUpper20ext));
mux2 mux2(.LoadStore32Address(LoadStore32Address),.jal32(InstUpper20ext),.mux2sel(mux2sel),.LoadStoreOrjal(LoadStoreOrjal));
shifter1 shifter1(.LoadStoreOrjal(LoadStoreOrjal),.LoadStoreOrjalAddress(InLoadStoreOrjalAddress));
shifter12 shifter12(.InstUpper20ext(InstUpper20ext),.auipcOrlui(InauipcOrlui));
IDEX IDEX(.CLK(CLK),.InPC(InPC),.Inrs1val(Inrs1_value),.Inrs2val(Inrs2_value),.InLoadStoreOrjalAddress(InLoadStoreOrjalAddress),.InauipcOrlui(InauipcOrlui),.PC(PC),.rs1val(rs1_value),.rs2val(rs2_value),.LoadStoreOrjalAddress(LoadStoreOrjalAddress),.auipcOrlui(auipcOrlui));

IFIDBlock IFIDBlock(.CLK(CLK),.RSTB(RSTB),.CNTEN(CNTEN),.PCsel(PCsel),.JumporBranch(JumporBranch),.IFIDOUTInst(Inst),.IFIDOUTPC(InPC));

always begin
    #10 CLK <= ~CLK;
end

initial begin 
    #0      CLK <= 1'b0;        
            CNTEN <= 1'b0;
            PCsel <= 1'b0;
    #10     RSTB <= 1'b0;
    #10     RSTB <= 1'b1;
            CNTEN <= 1'b1;
    #500    $finish;
end

initial begin
    $dumpfile("IDEX.vcd");
    $dumpvars(0,IDEX_test);
end

endmodule
