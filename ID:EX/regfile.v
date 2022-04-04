module regfile(
    rs1,
    rs2,
    rd,
    CLK,
    indata,
    RegWrite,
    rs1_value,
    rs2_value
);

    input [4:0] rs1;
    input [4:0] rs2;
    input [4:0] rd;
    input [31:0] indata;
    input CLK;
    input RegWrite;
    output wire [31:0] rs1_value;
    output wire [31:0] rs2_value;

    reg [31:0] Registers [0:31];

    always @(posedge CLK) begin
      if(RegWrite) begin
        Registers[rd] <= indata;
        end
    end

    assign rs1_value = Registers[rs1];
    assign rs2_value = Registers[rs2];

endmodule