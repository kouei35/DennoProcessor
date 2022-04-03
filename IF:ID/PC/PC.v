//Module
module PC(CLK,RSTB,PCIN,CNTEN,ADDR_OUT_ROM); 
    input CLK,RSTB,CNTEN;
    input [31:0] PCIN;
    output [31:0] ADDR_OUT_ROM;
    reg [31:0] ADDR_OUT_ROM;
    
    always @(posedge CLK) begin
        if      (RSTB==1'b0)    ADDR_OUT_ROM <= 32'h0;
        else    ADDR_OUT_ROM <= PCIN;   
    end
endmodule
