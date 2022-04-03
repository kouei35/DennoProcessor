module ALU(
    ALUControl,
    indata1,indata2,
    outdata
    );
    input [3:0] ALUControl;
    input [31:0] indata1,indata2;
    output [31:0] outdata;
    
    reg [31:0] outdata;
always @* begin
    case(ALUControl)
        4'b0010:        outdata <= indata1 + indata2;     //ADD
        4'b0110:        outdata <= indata1 - indata2;     //SUB
        4'b0000:        outdata <= indata1 & indata2;     //AND
        4'b0001:        outdata <= indata1 | indata2;     //OR
        4'b0111:        begin
                        case({indata1[31],indata2[31]})
                        00:  outdata <= (indata1 < indata2) ? 32'h1 : 32'h0;     //SLT
                        01:  outdata <= 32'h1;
                        10:  outdata <= 32'h0;
                        11:  outdata <= ((~indata1 + 32'h1) > (~indata2 + 32'h1)) ? 32'h1 : 32'h0;  
                        endcase
                        end
        4'b0011:        outdata <= (indata1 < indata2) ? 32'h1 : 32'h0;     //SLTU
        4'b0100:        outdata <= indata1 ^ indata2;     //XOR
        4'b0101:        outdata <= indata1 << indata2;    //SLL
        4'b1000:        outdata <= indata1 >> indata2;   //SRA
        4'b1001:        outdata <= indata1 >>> indata2;    //SRL
        default:        outdata <= 32'h0;
     endcase
end
endmodule
