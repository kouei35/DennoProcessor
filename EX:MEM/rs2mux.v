module rs2mux(
    rs2muxsel,
    rs2val,
    ALUOUT,
    LoadStoreOrjalAddress,
    auipcOrlui,
    LoadStore32Address,
    ALUINB
);

input [2:0] rs2muxsel;
input [31:0] rs2val;
input [31:0] ALUOUT;
input [31:0] LoadStoreOrjalAddress;
input [31:0] auipcOrlui;
input [31:0] LoadStore32Address;
output reg [31:0] ALUINB;

always @* begin
    case(rs2muxsel) 
    3'b000: ALUINB <= rs2val;
    3'b001: ALUINB <= ALUOUT;
    3'b010: ALUINB <= LoadStoreOrjalAddress;
    3'b011: ALUINB <= auipcOrlui;
    3'b100: ALUINB <= LoadStore32Address;
    default: ALUINB <= rs2val;
end

endmodule