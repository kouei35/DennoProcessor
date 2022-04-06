module IDEXBlock_test();

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
wire [1:0] ALUSourceA;
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

IDEXBlock IDEXBlock(.CLK(CLK),.InPC(InPC),.Inst(Inst),.Dmem1ALUOUT(Dmem1ALUOUT),.DmemREB(DmemREB),.DmemWEB(DmemWEB),.ALUControl(ALUControl),.ALUSourceA(ALUSourceA),.ALUSourceB(ALUSourceB),.LoadStoreOrjalAddress(LoadStoreOrjalAddress),.auipcOrlui(auipcOrlui),.LoadStore32Address(LoadStore32Address),.PC(PC),.RegWrite(RegWrite));
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
    $dumpfile("IDEXBlock.vcd");
    $dumpvars(0,IDEXBlock_test);
end

endmodule
