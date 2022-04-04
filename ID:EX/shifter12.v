module shifter12(
    InstUpper20ext,
    auipcOrlui
);

input [31:0] InstUpper20ext;
output wire [31:0] auipcOrlui;

assign auipcOrlui = InstUpper20ext << 20;

endmodule