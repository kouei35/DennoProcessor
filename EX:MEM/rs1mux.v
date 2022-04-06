module rs1mux(
    rs1muxsel,
    rs1val,
    ALUOUT,
    PC,
    ALUINA
);

input [2:0] rs1muxsel;
input [31:0] rs1val;
input [31:0] ALUOUT;
input [31:0] PC;
output reg [31:0] ALUINA;

always @* begin
    case(rs1muxsel)
    2'b00:  ALUINA <= rs1val;
    2'b01:  ALUINA <= ALUOUT;
    2'b10:  ALUINA <= PC;
    default:ALUINA <= rs1val;    
end

endmodule