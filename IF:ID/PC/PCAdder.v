module PCAdder(
    PC,
    PCIN
);
input [31:0] PC;
output wire [31:0] PCIN;

assign PCIN = PC + 32'h4;

endmodule