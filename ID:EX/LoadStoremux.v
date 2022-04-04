module LoadStoremux(
    Load12Address,
    Store12Address,
    LoadStoremuxsel,
    LoadStore12Address
);

input [11:0] Load12Address;
input [11:0] Store12Address;
input LoadStoremuxsel;
output reg [11:0] LoadStore12Address;

always @* begin
    case(LoadStoremuxsel)
        1'b0: LoadStore12Address <= Load12Address;
        1'b1: LoadStore12Address <= Store12Address;
    endcase
end

endmodule