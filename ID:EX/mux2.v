module mux2(
    LoadStore32Address,
    jal32,
    mux2sel,
    LoadStoreOrjal
);

input [31:0] LoadStore32Address;
input [31:0] jal32;
output reg [31:0] LoadStoreOrjal;

always @* begin
    case(mux2sel)
    1'b0:   LoadStoreOrjal <= LoadStore32Address;
    1'b1:   LoadStoreOrjal <= jal32; 
end

endmodule