module PCmux(
    PC,
    JumporBranch,
    PCsel,
    PCIN
);
    input wire [31:0] PC;
    input wire [31:0] JumporBranch;
    input wire PCsel; 
    output reg [31:0] PCIN;

    always @* begin
    case(PCsel)
        1'b0:  PCIN <= PC;
        1'b1:  PCIN <= JumporBranch;
        default:PCIN <= PC;
    endcase
    end

endmodule