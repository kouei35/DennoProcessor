module IDEXBlock(
    CLK,
    InPC,
    Inst,
    Dmem1ALUOUT,
    DmemREB,
    DmemWEB,
    ALUControl,
    ALUSourceA,
    ALUSourceB,
    LoadStoreOrjalAddress,
    auipcOrlui,
    LoadStore32Address,
    PC,
    regfile_indata,
    RegWrite,
    LoadStore32Address,
    IDEXrs1,
    IDEXrs2
);

input CLK;
input [31:0] Inst;
input [31:0] InPC;

output wire Dmem1ALUOUT;
output wire DmemREB;
output wire DmemWEB;

/*ALU*/
output wire [3:0] ALUControl;
output wire ALUSourceA;
output wire [1:0] ALUSourceB;

output wire [31:0] LoadStoreOrjalAddress;
output wire [31:0] auipcOrlui;

/*twelve2thirtytwosext*/
output wire [31:0] LoadStore32Address;
output wire [31:0] PC;

/*regfile*/
input wire [31:0] regfile_indata;
output wire RegWrite;
output wire [4:0] IDEXrs1;
output wire [4:0] IDEXrs2;


/*Regfile*/
wire [31:0] Inrs1_value;
wire [31:0] Inrs2_value;
wire [31:0] rs1_value;
wire [31:0] rs2_value;


/*IDEX mux*/
wire [11:0] Load12Address;
wire [11:0] Store12Address;
wire [11:0] LoadStore12Address;
wire [31:0] LoadStoreOrjal;         //Output of mux2

/*Output of twenty2thirtytwosext*/
wire [31:0] InstUpper20ext;

/*output of shifter1*/
wire [31:0] InLoadStoreOrjalAddress;

/*output of shifter12*/
wire [31:0] InauipcOrlui;

/*IDEX*/
wire [31:0] InLoadStore32Address;

ControlUnit ControlUnit(.Opecode(Inst[31:25]),
                        .ALUOp(Inst[14:12]),
                        .funct(Inst[6:0]),
                        .Dmem1ALUOUT(Dmem1ALUOUT),
                        .DmemREB(DmemREB),
                        .DmemWEB(DmemWEB),
                        .ALUControl(ALUControl),
                        .ALUSourceA(ALUSourceA),
                        .ALUSourceB(ALUSourceB),
                        .LoadStoremuxsel(LoadStoremuxsel),
                        .mux2sel(mux2sel));

regfile regfile(.rs1(Inst[19:15]),
                .rs2(Inst[24:20]),
                .rd(Inst[11:7]),
                .CLK(CLK),
                .RegWrite(RegWrite),
                .indata(regfile_indata),
                .rs1_value(Inrs1_value),
                .rs2_value(Inrs2_value));

LoadStoremux LoadStoremux(.Load12Address(Inst[31:20]),
                          .Store12Address({Inst[31:25],Inst[11:7]}),
                          .LoadStoremuxsel(LoadStoremuxsel),
                          .LoadStore12Address(LoadStore12Address));

twelve2thirtytwosext twelve2thirtytwosext(.LoadStore12Address(LoadStore12Address),
                                          .LoadStore32Address(InLoadStore32Address));

twenty2thirtytwosext twenty2thirtytwosext(.InstUpper20(Inst[31:12]),
                                          .InstUpper20ext(InstUpper20ext));

mux2 mux2(.LoadStore32Address(InLoadStore32Address),
          .jal32(InstUpper20ext),
          .mux2sel(mux2sel),
          .LoadStoreOrjal(LoadStoreOrjal));

shifter1 shifter1(.LoadStoreOrjal(LoadStoreOrjal),
                  .LoadStoreOrjalAddress(InLoadStoreOrjalAddress));

shifter12 shifter12(.InstUpper20ext(InstUpper20ext),
                    .auipcOrlui(InauipcOrlui));

IDEX IDEX(.CLK(CLK),
          .InPC(InPC),
          .Inrs1val(Inrs1_value),
          .Inrs2val(Inrs2_value),
          .InLoadStoreOrjalAddress(InLoadStoreOrjalAddress),
          .InauipcOrlui(InauipcOrlui),.PC(PC),
          .rs1val(rs1_value),.rs2val(rs2_value),
          .LoadStoreOrjalAddress(LoadStoreOrjalAddress),
          .auipcOrlui(auipcOrlui),
          .InLoadStore32Address(InLoadStore32Address),
          .LoadStore32Address(LoadStore32Address),
          .InIDEXrs1(Inst[19:15]),
          .InIDEXrs2(Inst[24:20]),
          .IDEXrs1(IDEXrs1),
          .IDEXrs2(IDEXrs2));

endmodule
