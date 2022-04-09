module ForwardingAdjustUnit2(
    ALUSourceB,
    ForwardingE2,
    rs2muxsel
);

input [1:0] ALUSourceB;
input ForwardingE2;
output reg [2:0] rs2muxsel;

always @* begin
    if(ForwardingE2) begin
        rs2muxsel <= 3'b100;
    end
    else    begin
        rs2muxsel <= {0,ALUSourceB};
    end
end