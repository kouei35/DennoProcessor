#! /usr/local/Cellar/icarus-verilog/11.0/bin/vvp
:ivl_version "11.0 (stable)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "/usr/local/Cellar/icarus-verilog/11.0/lib/ivl/system.vpi";
:vpi_module "/usr/local/Cellar/icarus-verilog/11.0/lib/ivl/vhdl_sys.vpi";
:vpi_module "/usr/local/Cellar/icarus-verilog/11.0/lib/ivl/vhdl_textio.vpi";
:vpi_module "/usr/local/Cellar/icarus-verilog/11.0/lib/ivl/v2005_math.vpi";
:vpi_module "/usr/local/Cellar/icarus-verilog/11.0/lib/ivl/va_math.vpi";
S_0x7fba72904ba0 .scope module, "IFID" "IFID" 2 1;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "CLK";
    .port_info 1 /INPUT 32 "InPC";
    .port_info 2 /INPUT 32 "InInst";
    .port_info 3 /OUTPUT 32 "PC";
    .port_info 4 /OUTPUT 32 "Inst";
o0x7fba72832008 .functor BUFZ 1, C4<z>; HiZ drive
v0x6000001a01b0_0 .net "CLK", 0 0, o0x7fba72832008;  0 drivers
o0x7fba72832038 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x6000001a0240_0 .net "InInst", 31 0, o0x7fba72832038;  0 drivers
o0x7fba72832068 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x6000001a02d0_0 .net "InPC", 31 0, o0x7fba72832068;  0 drivers
v0x6000001a0360_0 .var "Inst", 31 0;
v0x6000001a03f0_0 .var "PC", 31 0;
E_0x600003da41e0 .event posedge, v0x6000001a01b0_0;
S_0x7fba72904f40 .scope module, "IMEM" "IMEM" 3 1;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "ADDR_IN_ROM";
    .port_info 1 /OUTPUT 32 "Inst";
o0x7fba728321e8 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x6000001a0480_0 .net "ADDR_IN_ROM", 31 0, o0x7fba728321e8;  0 drivers
v0x6000001a0510_0 .var "Inst", 31 0;
E_0x600003da5e90 .event edge, v0x6000001a0480_0;
S_0x7fba729050b0 .scope module, "PC" "PC" 4 2;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "CLK";
    .port_info 1 /INPUT 1 "RSTB";
    .port_info 2 /INPUT 32 "PCIN";
    .port_info 3 /INPUT 1 "CNTEN";
    .port_info 4 /OUTPUT 32 "ADDR_OUT_ROM";
v0x6000001a05a0_0 .var "ADDR_OUT_ROM", 31 0;
o0x7fba728322d8 .functor BUFZ 1, C4<z>; HiZ drive
v0x6000001a0630_0 .net "CLK", 0 0, o0x7fba728322d8;  0 drivers
o0x7fba72832308 .functor BUFZ 1, C4<z>; HiZ drive
v0x6000001a06c0_0 .net "CNTEN", 0 0, o0x7fba72832308;  0 drivers
o0x7fba72832338 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x6000001a0750_0 .net "PCIN", 31 0, o0x7fba72832338;  0 drivers
o0x7fba72832368 .functor BUFZ 1, C4<z>; HiZ drive
v0x6000001a07e0_0 .net "RSTB", 0 0, o0x7fba72832368;  0 drivers
E_0x600003da4630 .event posedge, v0x6000001a0630_0;
S_0x7fba72904280 .scope module, "PCAdder" "PCAdder" 5 1;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "PC";
    .port_info 1 /OUTPUT 32 "PCIN";
o0x7fba72832488 .functor BUFZ 32, C4<zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz>; HiZ drive
v0x6000001a0870_0 .net "PC", 31 0, o0x7fba72832488;  0 drivers
v0x6000001a0900_0 .net "PCIN", 31 0, L_0x6000002a01e0;  1 drivers
L_0x7fba72863008 .functor BUFT 1, C4<00000000000000000000000000000100>, C4<0>, C4<0>, C4<0>;
v0x6000001a0990_0 .net/2u *"_ivl_0", 31 0, L_0x7fba72863008;  1 drivers
L_0x6000002a01e0 .arith/sum 32, o0x7fba72832488, L_0x7fba72863008;
    .scope S_0x7fba72904ba0;
T_0 ;
    %wait E_0x600003da41e0;
    %load/vec4 v0x6000001a02d0_0;
    %assign/vec4 v0x6000001a03f0_0, 0;
    %load/vec4 v0x6000001a0240_0;
    %assign/vec4 v0x6000001a0360_0, 0;
    %jmp T_0;
    .thread T_0;
    .scope S_0x7fba72904f40;
T_1 ;
    %wait E_0x600003da5e90;
    %load/vec4 v0x6000001a0480_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 32;
    %cmp/u;
    %jmp/1 T_1.0, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 32;
    %cmp/u;
    %jmp/1 T_1.1, 6;
    %dup/vec4;
    %pushi/vec4 8, 0, 32;
    %cmp/u;
    %jmp/1 T_1.2, 6;
    %dup/vec4;
    %pushi/vec4 18, 0, 32;
    %cmp/u;
    %jmp/1 T_1.3, 6;
    %pushi/vec4 0, 0, 32;
    %assign/vec4 v0x6000001a0510_0, 0;
    %jmp T_1.5;
T_1.0 ;
    %pushi/vec4 20, 0, 32;
    %assign/vec4 v0x6000001a0510_0, 0;
    %jmp T_1.5;
T_1.1 ;
    %pushi/vec4 16, 0, 32;
    %assign/vec4 v0x6000001a0510_0, 0;
    %jmp T_1.5;
T_1.2 ;
    %pushi/vec4 17, 0, 32;
    %assign/vec4 v0x6000001a0510_0, 0;
    %jmp T_1.5;
T_1.3 ;
    %pushi/vec4 256, 0, 32;
    %assign/vec4 v0x6000001a0510_0, 0;
    %jmp T_1.5;
T_1.5 ;
    %pop/vec4 1;
    %jmp T_1;
    .thread T_1, $push;
    .scope S_0x7fba729050b0;
T_2 ;
    %wait E_0x600003da4630;
    %load/vec4 v0x6000001a07e0_0;
    %cmpi/e 0, 0, 1;
    %jmp/0xz  T_2.0, 4;
    %pushi/vec4 0, 0, 32;
    %assign/vec4 v0x6000001a05a0_0, 0;
    %jmp T_2.1;
T_2.0 ;
    %load/vec4 v0x6000001a0750_0;
    %assign/vec4 v0x6000001a05a0_0, 0;
T_2.1 ;
    %jmp T_2;
    .thread T_2;
# The file index is used to find the file name in the following table.
:file_names 6;
    "N/A";
    "<interactive>";
    "../IF:ID.v";
    "../IMEM.v";
    "PC.v";
    "PCAdder.v";
