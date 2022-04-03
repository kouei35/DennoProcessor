module regfile_test();
  reg CLK;
  reg [4:0] rs1,rs2,rd;
  reg [31:0] indata;
  reg RegWrite;
  wire [31:0] rs1_value,rs2_value;

  regfile regfile1(.CLK(CLK),.rs1(rs1),.rs2(rs2),.rd(rd),
                  .indata(indata),.RegWrite(RegWrite),.rs1_value(rs1_value),.rs2_value(rs2_value));

  initial begin
    CLK = 0;
    forever #10 CLK = ~CLK;
  end
  
  initial begin
    #0  RegWrite <= 1'b1;
    #10 rd <= 5'h3;
        indata <= 32'h32;
    #10 rd <= 5'h1;
        indata <= 32'h12;
    #10 rs1 <= 5'h3;
        rs2 <= 5'h1;
    #10 rd <= 5'h5;
        indata <= 32'h10;
        rs1 <= 5'h1;
        rs2 <= 5'h5;
    end 

  initial begin
    #500 $finish();
  end

 /* always @(posedge CLK) begin
    $write("[%t] counter: %b\n", $time, w_cnt);
  end*/

  initial begin
      $dumpfile("regfile_test.vcd");
      $dumpvars(0, regfile1);
  end

endmodule
