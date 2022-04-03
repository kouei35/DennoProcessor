module test_IDEX();

reg CLK;
reg RSTB,CNTEN;
reg PCsel;
wire [31:0] PCIN;
wire [31:0] PCAdderOUT;
wire [31:0] ADDR_OUT_ROM;
wire [31:0] Inst;

wire [31:0] IFIDOUTPC;
wire [31:0] IFIDOUTInst;

PCmux PCmux(.PCsel(PCsel),.PC(PCAdderOUT),.PCIN(PCIN));
PC PC(.CLK(CLK),.RSTB(RSTB),.CNTEN(CNTEN),.PCIN(PCIN),.ADDR_OUT_ROM(ADDR_OUT_ROM));
PCAdder PCAdder(.PC(ADDR_OUT_ROM),.PCIN(PCAdderOUT));
IMEM IMEM(.ADDR_IN_ROM(ADDR_OUT_ROM),.Inst(Inst));
IFID IFID(.CLK(CLK),.InPC(PCIN),.InInst(Inst),.PC(IFIDOUTPC),.Inst(IFIDOUTInst));

    always begin
    #10 CLK <= ~CLK;
    end

    initial begin
    #0  CLK <= 1'b0;
        CNTEN <= 1'b0;
        PCsel <= 1'b0;
    #10 RSTB <= 1'b0;
    #10 RSTB <= 1'b1;
        CNTEN <= 1'b1;
    #500    $finish;
    end

  initial begin
      $dumpfile("IDEX.vcd");
      $dumpvars(0, test_IDEX);
  end

  endmodule