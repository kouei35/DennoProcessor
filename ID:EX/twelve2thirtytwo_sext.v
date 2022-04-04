module twelve2thirtytwosext(
    LoadStore12Address,
    LoadStore32Address
);

input [11:0] LoadStore12Address;
output [31:0] LoadStore32Address;

assign LoadStore32Address = {{20{LoadStore12Address[11]}},LoadStore12Address};

endmodule