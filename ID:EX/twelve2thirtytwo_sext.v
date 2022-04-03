module twelve2thirtytwo_sext(
    LoadStore12Address,
    LoadStoreAddress
);

input [11:0] LoadStore12Address;
output [31:0] LoadStoreAddress;

assign LoadStoreAddress = {{20{LoadStore12Address[11]}},LoadStore12Address};

endmodule