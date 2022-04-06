module FowardingAdjustUnit2(
    ALUSourceB,
    FowardingE2,
    rs2muxsel
);

input [1:0] ALUSourceB;
input FowardingE2;
output reg [2:0] rs2muxsel;

always @* begin
    if(FowardingE2) begin
        rs2muxsel <= 3'b100;
    end
    else    begin
        rs2muxsel <= {0,ALUSourceB};
    end
end