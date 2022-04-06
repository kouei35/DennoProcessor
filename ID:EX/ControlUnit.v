module ControlUnit(
    Opecode,
    ALUOp,
    funct,
    Dmem1ALUOUT,
    DmemREB,
    DmemWEB,
    ALUControl,
    ALUSourceA,
    ALUSourceB,
    LoadStoremuxsel,
    mux2sel
    );
input [6:0] Opecode;
input [2:0] ALUOp;
input [6:0] funct;
output reg Dmem1ALUOUT;
output reg DmemREB;
output reg DmemWEB;
output reg [3:0] ALUControl;
output reg ALUSourceA;
output reg [1:0] ALUSourceB;
output reg LoadStoremuxsel;
output reg mux2sel;

//ALUControl�Ɩ{���W���[���̗������ۑ�B
//�����ЂƂɂ́A����M���̔����̂��߂�opecode,aluop,funct�̂R�S�Ă��K�v���B
always @* begin
casez({Opecode,ALUOp,funct})
    17'b0000000_000_0110011: begin
        Dmem1ALUOUT <= 1'b0; //ADD
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0010; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
    end
    17'b0100000_000_0110111: begin
        Dmem1ALUOUT <= 1'b0; //SUB
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0110; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b???????_000_0010011: begin
        Dmem1ALUOUT <= 1'b0; //ADDI
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0010; ALUSourceA <= 1'b0; ALUSourceB <= 2'b10;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0000000_111_0110011: begin
        Dmem1ALUOUT <= 1'b0; //AND
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0000; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b???????_111_0010011: begin
        Dmem1ALUOUT <= 1'b0; //ANDI
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0000; ALUSourceA <= 1'b0; ALUSourceB <= 2'b10;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0000000_010_0110011: begin
        Dmem1ALUOUT <= 1'b0;  //SLT
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0111; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b???????_010_0010011: begin
        Dmem1ALUOUT <= 1'b0;  //SLTI
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0111; ALUSourceA <= 1'b0; ALUSourceB <= 2'b10;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0000000_100_0110011: begin
        Dmem1ALUOUT <= 1'b0; //XOR
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0100; ALUSourceA <= 1'b0;  ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b???????_100_0010011: begin
        Dmem1ALUOUT <= 1'b0;  //XORI
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0100; ALUSourceA <= 1'b0; ALUSourceB <= 2'b10;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0000000_110_0110011: begin
        Dmem1ALUOUT <= 1'b0;   //OR
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0001; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0000000_001_0110011: begin
        Dmem1ALUOUT <= 1'b0;   //SLL
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0101; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0000000_001_0010011: begin
        Dmem1ALUOUT <= 1'b0;   //SLLI
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0101; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0000000_101_0110011: begin
        Dmem1ALUOUT <= 1'b0;    //SRL
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b1000; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0000000_001_0110011: begin
        Dmem1ALUOUT <= 1'b0;    //SRLI
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b1000; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0100000_101_0110011: begin
        Dmem1ALUOUT <= 1'b0;    //SRA
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b1001; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b0100000_101_0010011: begin
        Dmem1ALUOUT <= 1'b0;    //SRAI
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b1001; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end     
    17'b???????_110_0010011: begin
        Dmem1ALUOUT <= 1'b0;  //ORI
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0001; ALUSourceA <= 1'b0; ALUSourceB <= 2'b10;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b???????_010_0000011: begin
        Dmem1ALUOUT <= 1'b1;    //LW
        DmemREB <= 1'b0;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0010; ALUSourceA <= 1'b0; ALUSourceB <= 2'b11;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
        end
    17'b???????_010_0100011: begin
        Dmem1ALUOUT <= 1'b1;     //SW
        DmemREB <= 1'b1;
        DmemWEB <= 1'b0;
        ALUControl <= 4'b0010; ALUSourceA <= 1'b0; ALUSourceB <= 2'b11;
        LoadStoremuxsel <= 1'b1;
        mux2sel <= 1'b0;
        end
    default:    begin
        Dmem1ALUOUT <= 1'b0;
        DmemREB <= 1'b1;
        DmemWEB <= 1'b1;
        ALUControl <= 4'b0010; ALUSourceA <= 1'b0; ALUSourceB <= 2'b00;
        LoadStoremuxsel <= 1'b0;
        mux2sel <= 1'b0;
    end
endcase
    end
endmodule