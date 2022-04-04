module test_IFIDBlock();

reg CLK;
reg RSTB,CNTEN;
reg PCsel;
reg [31:0] JumporBranch;
wire [31:0] IFIDOUTPC;
wire [31:0] IFIDOUTInst;

IFIDBlock IFIDBlock(.CLK(CLK),.PCsel(PCsel),.RSTB(RSTB),.CNTEN(CNTEN),.JumporBranch(JumporBranch),.IFIDOUTPC(IFIDOUTPC),.IFIDOUTInst(IFIDOUTInst));

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
      $dumpfile("IFIDBlock.vcd");
      $dumpvars(0, test_IFIDBlock);
  end

  endmodule