module shifter1(
    LoadStoreOrjal,
    LoadStoreOrjalAddress
);

input [31:0] LoadStoreOrjal;
output wire [31:0] LoadStoreOrjalAddress;

assign LoadStoreOrjalAddress = LoadStoreOrjal >> 1;

endmodule