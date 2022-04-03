module twenty2thirtytwosext(
    InstUpper20,
    InstUpper20ext
);

input [19:0] InstUpper20;
output wire [31:0] InstUpper20ext;

assign InstUpper20ext = {{12{InstUpper20[19]}},InstUpper20};

endmodule