module ForwardingUnit(
    IDEXrs1,
    IDEXrs2,
    MEMWBrd,
    MEMWBregWrite,
    EXMEMrd,
    EXMEMregWrite,
    ForwardingE1,
    ForwardingE2
);

input [4:0] IDEXrs1;
input [4:0] IDEXrs2;
input [4:0] MEMWBrd;
input [4:0] EXMEMrd;
input MEMWBregWrite;
input EXMEMregWrite;
output reg ForwardingE1;
output reg ForwardingE2;

always @* begin 
    if(MEMWBregWrite & (MEMWBrd != 0) & !(EXMEMregWrite & (EXMEMrd != 0) & (EXMEMrd != IDEXrs1)))
        ForwardingE1 <= 1'b1;
    else ForwardingE1 <= 1'b0;
end

always @* begin
    if(MEMWBregWrite & (MEMWBrd != 0) & !(EXMEMregWrite & (EXMEMrd != 0) & (EXMEMrd != IDEXrs2)))
        ForwardingE2 <= 1'b1;
    else ForwardingE2 <= 1'b0;
end

endmodule