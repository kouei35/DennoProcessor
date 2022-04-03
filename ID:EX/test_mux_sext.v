module test_mux_sext();

reg [11:0] Load12Address;
reg [11:0] Store12Address;
reg LoadStoresel;
wire [11:0] LoadStore12Address;
wire [31:0] LoadStoreAddress;

twelve2thirtytwo_sext twelve2thirtytwo_mux(.LoadStore12Address(LoadStore12Address),.LoadStoreAddress(LoadStoreAddress));
LoadStoremux LoadStoremux(.Load12Address(Load12Address),.Store12Address(Store12Address),.LoadStoresel(LoadStoresel),.LoadStore12Address(LoadStore12Address));

initial begin
    #0  Load12Address <= 12'h21;
        Store12Address     <= 12'b1100_0111_0000;
        LoadStoresel       <= 1'b0;
    #10 LoadStoresel       <= 1'b1;
    #10 Load12Address <= 12'h9;
    $finish;
end

  initial begin
      $dumpfile("mux_sext.vcd");
      $dumpvars(0, test_mux_sext);
  end

endmodule