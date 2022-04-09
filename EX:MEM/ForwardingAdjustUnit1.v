module ForwardingAdjustUnit1(
    ALUSourceA,
    ForwardingE1,
    rs1muxsel
);

input ALUSourceA;
input ForwardingE1;
output reg [1:0] rs1muxsel;

always @* begin
    if(ForwardingE1) begin
        rs1muxsel <= 2'b01;
    end
    else begin
        rs1muxsel <= {0,ALUSourceA};
    end
end

endmodule
