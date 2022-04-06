module FowardingAdjustUnit1(
    ALUSourceA,
    FowardingE1,
    rs1muxsel
);

input ALUSourceA;
input FowardingE1;
output reg [1:0] rs1muxsel;

always @* begin
    if(FowardingE1) begin
        rs1muxsel <= 2'b01;
    end
    else begin
        rs1muxsel <= {0,ALUSourceA};
    end
end

endmodule
