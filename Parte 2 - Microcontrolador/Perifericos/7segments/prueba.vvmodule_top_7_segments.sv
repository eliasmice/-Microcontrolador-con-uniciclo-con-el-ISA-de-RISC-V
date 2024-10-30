#! /c/Source/iverilog-install/bin/vvp
:ivl_version "12.0 (devel)" "(s20150603-1539-g2693dd32b)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "C:\iverilog\lib\ivl\system.vpi";
:vpi_module "C:\iverilog\lib\ivl\vhdl_sys.vpi";
:vpi_module "C:\iverilog\lib\ivl\vhdl_textio.vpi";
:vpi_module "C:\iverilog\lib\ivl\v2005_math.vpi";
:vpi_module "C:\iverilog\lib\ivl\va_math.vpi";
:vpi_module "C:\iverilog\lib\ivl\v2009.vpi";
S_00000238b56cd9e0 .scope package, "$unit" "$unit" 2 1;
 .timescale 0 0;
S_00000238b56cdb70 .scope module, "clock_divider" "clock_divider" 3 1;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk_in";
    .port_info 1 /OUTPUT 1 "clk_out";
P_00000238b5898560 .param/l "CLK_IN_FREQ" 0 3 2, +C4<00000101111101011110000100000000>;
P_00000238b5898598 .param/l "CLK_OUT_FREQ" 0 3 3, +C4<00000000000000110000110101000000>;
P_00000238b58985d0 .param/l "DIVISOR" 1 3 9, +C4<0000000000000000000000000000000000000000000000000000000011111010>;
L_00000238b5888c50 .functor BUFZ 1, v00000238b5894340_0, C4<0>, C4<0>, C4<0>;
o00000238b58b5d68 .functor BUFZ 1, C4<z>; HiZ drive
v00000238b58943e0_0 .net "clk_in", 0 0, o00000238b58b5d68;  0 drivers
v00000238b5893800_0 .net "clk_out", 0 0, L_00000238b5888c50;  1 drivers
v00000238b5894340_0 .var "clk_out_reg", 0 0;
v00000238b5893a80_0 .var "counter", 7 0;
E_00000238b58b1bb0 .event posedge, v00000238b58943e0_0;
S_00000238b587dc80 .scope module, "convertidor_bcd" "convertidor_bcd" 4 1;
 .timescale 0 0;
    .port_info 0 /INPUT 8 "dato";
    .port_info 1 /OUTPUT 16 "decimal";
L_00000238b5914138 .functor BUFT 1, C4<0>, C4<0>, C4<0>, C4<0>;
v00000238b59111b0_0 .net/2s *"_ivl_129", 0 0, L_00000238b5914138;  1 drivers
L_00000238b5914180 .functor BUFT 1, C4<0>, C4<0>, C4<0>, C4<0>;
v00000238b5910990_0 .net/2s *"_ivl_134", 0 0, L_00000238b5914180;  1 drivers
v00000238b59112f0_0 .net *"_ivl_136", 11 0, L_00000238b5971ce0;  1 drivers
L_00000238b59140a8 .functor BUFT 1, C4<00000000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v00000238b5910710_0 .net/2s *"_ivl_14", 31 0, L_00000238b59140a8;  1 drivers
L_00000238b59141c8 .functor BUFT 1, C4<0000>, C4<0>, C4<0>, C4<0>;
v00000238b5910530_0 .net *"_ivl_141", 3 0, L_00000238b59141c8;  1 drivers
v00000238b5911390_0 .net *"_ivl_3", 0 0, L_00000238b5912ea0;  1 drivers
v00000238b5911e30_0 .net *"_ivl_7", 0 0, L_00000238b5912ae0;  1 drivers
L_00000238b59140f0 .functor BUFT 1, C4<00000000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v00000238b5911430_0 .net/2s *"_ivl_80", 31 0, L_00000238b59140f0;  1 drivers
v00000238b5911bb0_0 .net "cable", 19 0, L_00000238b596d150;  1 drivers
v00000238b5911750_0 .net "centenas", 3 0, L_00000238b59707a0;  1 drivers
o00000238b58b7958 .functor BUFZ 8, C4<zzzzzzzz>; HiZ drive
v00000238b59114d0_0 .net "dato", 7 0, o00000238b58b7958;  0 drivers
v00000238b59117f0_0 .net "decenas", 3 0, L_00000238b5971ec0;  1 drivers
v00000238b5910a30_0 .net "decimal", 15 0, L_00000238b5970de0;  1 drivers
v00000238b5911c50_0 .net "unidades", 3 0, L_00000238b596c890;  1 drivers
L_00000238b5912ea0 .part o00000238b58b7958, 0, 1;
L_00000238b5912ae0 .part L_00000238b596d150, 19, 1;
L_00000238b5912fe0 .part o00000238b58b7958, 5, 1;
L_00000238b5913940 .part o00000238b58b7958, 6, 1;
L_00000238b5913300 .part o00000238b58b7958, 7, 1;
L_00000238b5913080 .part L_00000238b59140a8, 0, 1;
L_00000238b596cb10 .part o00000238b58b7958, 4, 1;
L_00000238b596da10 .part L_00000238b596d150, 0, 1;
L_00000238b596d290 .part L_00000238b596d150, 1, 1;
L_00000238b596c6b0 .part L_00000238b596d150, 2, 1;
L_00000238b596d5b0 .part o00000238b58b7958, 3, 1;
L_00000238b596ced0 .part L_00000238b596d150, 4, 1;
L_00000238b596cbb0 .part L_00000238b596d150, 5, 1;
L_00000238b596dd30 .part L_00000238b596d150, 6, 1;
L_00000238b596c7f0 .part o00000238b58b7958, 2, 1;
L_00000238b596dab0 .part L_00000238b596d150, 8, 1;
L_00000238b596dc90 .part L_00000238b596d150, 9, 1;
L_00000238b596ccf0 .part L_00000238b596d150, 10, 1;
L_00000238b596d010 .part L_00000238b596d150, 11, 1;
L_00000238b596d3d0 .part L_00000238b596d150, 7, 1;
L_00000238b596d970 .part L_00000238b596d150, 3, 1;
L_00000238b596d0b0 .part L_00000238b59140f0, 0, 1;
LS_00000238b596d150_0_0 .concat8 [ 1 1 1 1], L_00000238b5913620, L_00000238b5912d60, L_00000238b5912cc0, L_00000238b5912c20;
LS_00000238b596d150_0_4 .concat8 [ 1 1 1 1], L_00000238b596df10, L_00000238b5913760, L_00000238b59136c0, L_00000238b5913580;
LS_00000238b596d150_0_8 .concat8 [ 1 1 1 1], L_00000238b596ce30, L_00000238b596c9d0, L_00000238b596de70, L_00000238b596c1b0;
LS_00000238b596d150_0_12 .concat8 [ 1 1 1 1], L_00000238b596ddd0, L_00000238b596cc50, L_00000238b596d510, L_00000238b596db50;
LS_00000238b596d150_0_16 .concat8 [ 1 1 1 1], L_00000238b596dfb0, L_00000238b596dbf0, L_00000238b596d330, L_00000238b596cd90;
LS_00000238b596d150_1_0 .concat8 [ 4 4 4 4], LS_00000238b596d150_0_0, LS_00000238b596d150_0_4, LS_00000238b596d150_0_8, LS_00000238b596d150_0_12;
LS_00000238b596d150_1_4 .concat8 [ 4 0 0 0], LS_00000238b596d150_0_16;
L_00000238b596d150 .concat8 [ 16 4 0 0], LS_00000238b596d150_1_0, LS_00000238b596d150_1_4;
L_00000238b596c430 .part o00000238b58b7958, 1, 1;
L_00000238b596d470 .part L_00000238b596d150, 12, 1;
L_00000238b596c4d0 .part L_00000238b596d150, 13, 1;
L_00000238b596d650 .part L_00000238b596d150, 14, 1;
L_00000238b596c890 .concat8 [ 1 1 1 1], L_00000238b5912ea0, L_00000238b596c390, L_00000238b596d1f0, L_00000238b596c2f0;
L_00000238b596d8d0 .part L_00000238b596d150, 15, 1;
L_00000238b596ca70 .part L_00000238b596d150, 16, 1;
L_00000238b5971b00 .part L_00000238b596d150, 17, 1;
L_00000238b5971600 .part L_00000238b596d150, 18, 1;
L_00000238b5971ec0 .concat8 [ 1 1 1 1], L_00000238b596c250, L_00000238b596c570, L_00000238b596d830, L_00000238b596d790;
L_00000238b59707a0 .concat8 [ 1 1 1 1], L_00000238b596c930, L_00000238b5912ae0, L_00000238b5914138, L_00000238b5914180;
L_00000238b5971ce0 .concat [ 4 4 4 0], L_00000238b596c890, L_00000238b5971ec0, L_00000238b59707a0;
L_00000238b5970de0 .concat [ 12 4 0 0], L_00000238b5971ce0, L_00000238b59141c8;
S_00000238b58617e0 .scope module, "ev0" "evalua_suma3" 4 12, 5 1 0, S_00000238b587dc80;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "D0";
    .port_info 1 /INPUT 1 "D1";
    .port_info 2 /INPUT 1 "D2";
    .port_info 3 /INPUT 1 "D3";
    .port_info 4 /OUTPUT 1 "Q0";
    .port_info 5 /OUTPUT 1 "Q1";
    .port_info 6 /OUTPUT 1 "Q2";
    .port_info 7 /OUTPUT 1 "Q3";
v00000238b5893b20_0 .net "D0", 0 0, L_00000238b5912fe0;  1 drivers
v00000238b590ce70_0 .net "D1", 0 0, L_00000238b5913940;  1 drivers
v00000238b590b250_0 .net "D2", 0 0, L_00000238b5913300;  1 drivers
v00000238b590b2f0_0 .net "D3", 0 0, L_00000238b5913080;  1 drivers
v00000238b590c8d0_0 .net "Q0", 0 0, L_00000238b5913620;  1 drivers
v00000238b590bc50_0 .net "Q1", 0 0, L_00000238b5912d60;  1 drivers
v00000238b590b390_0 .net "Q2", 0 0, L_00000238b5912cc0;  1 drivers
v00000238b590c5b0_0 .net "Q3", 0 0, L_00000238b5912c20;  1 drivers
v00000238b590c3d0_0 .net *"_ivl_8", 3 0, v00000238b590b430_0;  1 drivers
v00000238b590cf10_0 .net "entrada_concatenada", 3 0, L_00000238b5912b80;  1 drivers
v00000238b590b430_0 .var "resultado", 3 0;
E_00000238b58b1430 .event anyedge, v00000238b590cf10_0;
L_00000238b5912b80 .concat [ 1 1 1 1], L_00000238b5912fe0, L_00000238b5913940, L_00000238b5913300, L_00000238b5913080;
L_00000238b5912c20 .part v00000238b590b430_0, 3, 1;
L_00000238b5912cc0 .part v00000238b590b430_0, 2, 1;
L_00000238b5912d60 .part v00000238b590b430_0, 1, 1;
L_00000238b5913620 .part v00000238b590b430_0, 0, 1;
S_00000238b585c3b0 .scope module, "ev1" "evalua_suma3" 4 13, 5 1 0, S_00000238b587dc80;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "D0";
    .port_info 1 /INPUT 1 "D1";
    .port_info 2 /INPUT 1 "D2";
    .port_info 3 /INPUT 1 "D3";
    .port_info 4 /OUTPUT 1 "Q0";
    .port_info 5 /OUTPUT 1 "Q1";
    .port_info 6 /OUTPUT 1 "Q2";
    .port_info 7 /OUTPUT 1 "Q3";
v00000238b590c150_0 .net "D0", 0 0, L_00000238b596cb10;  1 drivers
v00000238b590c1f0_0 .net "D1", 0 0, L_00000238b596da10;  1 drivers
v00000238b590cbf0_0 .net "D2", 0 0, L_00000238b596d290;  1 drivers
v00000238b590b7f0_0 .net "D3", 0 0, L_00000238b596c6b0;  1 drivers
v00000238b590b070_0 .net "Q0", 0 0, L_00000238b596df10;  1 drivers
v00000238b590c290_0 .net "Q1", 0 0, L_00000238b5913760;  1 drivers
v00000238b590b890_0 .net "Q2", 0 0, L_00000238b59136c0;  1 drivers
v00000238b590be30_0 .net "Q3", 0 0, L_00000238b5913580;  1 drivers
v00000238b590c970_0 .net *"_ivl_8", 3 0, v00000238b590ba70_0;  1 drivers
v00000238b590c0b0_0 .net "entrada_concatenada", 3 0, L_00000238b5913440;  1 drivers
v00000238b590ba70_0 .var "resultado", 3 0;
E_00000238b58b10f0 .event anyedge, v00000238b590c0b0_0;
L_00000238b5913440 .concat [ 1 1 1 1], L_00000238b596cb10, L_00000238b596da10, L_00000238b596d290, L_00000238b596c6b0;
L_00000238b5913580 .part v00000238b590ba70_0, 3, 1;
L_00000238b59136c0 .part v00000238b590ba70_0, 2, 1;
L_00000238b5913760 .part v00000238b590ba70_0, 1, 1;
L_00000238b596df10 .part v00000238b590ba70_0, 0, 1;
S_00000238b585c540 .scope module, "ev2" "evalua_suma3" 4 14, 5 1 0, S_00000238b587dc80;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "D0";
    .port_info 1 /INPUT 1 "D1";
    .port_info 2 /INPUT 1 "D2";
    .port_info 3 /INPUT 1 "D3";
    .port_info 4 /OUTPUT 1 "Q0";
    .port_info 5 /OUTPUT 1 "Q1";
    .port_info 6 /OUTPUT 1 "Q2";
    .port_info 7 /OUTPUT 1 "Q3";
v00000238b590cab0_0 .net "D0", 0 0, L_00000238b596d5b0;  1 drivers
v00000238b590cb50_0 .net "D1", 0 0, L_00000238b596ced0;  1 drivers
v00000238b590b110_0 .net "D2", 0 0, L_00000238b596cbb0;  1 drivers
v00000238b590c830_0 .net "D3", 0 0, L_00000238b596dd30;  1 drivers
v00000238b590cc90_0 .net "Q0", 0 0, L_00000238b596ce30;  1 drivers
v00000238b590b4d0_0 .net "Q1", 0 0, L_00000238b596c9d0;  1 drivers
v00000238b590bed0_0 .net "Q2", 0 0, L_00000238b596de70;  1 drivers
v00000238b590b1b0_0 .net "Q3", 0 0, L_00000238b596c1b0;  1 drivers
v00000238b590cdd0_0 .net *"_ivl_8", 3 0, v00000238b590b6b0_0;  1 drivers
v00000238b590b570_0 .net "entrada_concatenada", 3 0, L_00000238b596c610;  1 drivers
v00000238b590b6b0_0 .var "resultado", 3 0;
E_00000238b58b1270 .event anyedge, v00000238b590b570_0;
L_00000238b596c610 .concat [ 1 1 1 1], L_00000238b596d5b0, L_00000238b596ced0, L_00000238b596cbb0, L_00000238b596dd30;
L_00000238b596c1b0 .part v00000238b590b6b0_0, 3, 1;
L_00000238b596de70 .part v00000238b590b6b0_0, 2, 1;
L_00000238b596c9d0 .part v00000238b590b6b0_0, 1, 1;
L_00000238b596ce30 .part v00000238b590b6b0_0, 0, 1;
S_00000238b5872200 .scope module, "ev3" "evalua_suma3" 4 15, 5 1 0, S_00000238b587dc80;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "D0";
    .port_info 1 /INPUT 1 "D1";
    .port_info 2 /INPUT 1 "D2";
    .port_info 3 /INPUT 1 "D3";
    .port_info 4 /OUTPUT 1 "Q0";
    .port_info 5 /OUTPUT 1 "Q1";
    .port_info 6 /OUTPUT 1 "Q2";
    .port_info 7 /OUTPUT 1 "Q3";
v00000238b590cd30_0 .net "D0", 0 0, L_00000238b596c7f0;  1 drivers
v00000238b590c330_0 .net "D1", 0 0, L_00000238b596dab0;  1 drivers
v00000238b590b750_0 .net "D2", 0 0, L_00000238b596dc90;  1 drivers
v00000238b590c790_0 .net "D3", 0 0, L_00000238b596ccf0;  1 drivers
v00000238b590b9d0_0 .net "Q0", 0 0, L_00000238b596ddd0;  1 drivers
v00000238b590c470_0 .net "Q1", 0 0, L_00000238b596cc50;  1 drivers
v00000238b590c510_0 .net "Q2", 0 0, L_00000238b596d510;  1 drivers
v00000238b590b610_0 .net "Q3", 0 0, L_00000238b596db50;  1 drivers
v00000238b590bb10_0 .net *"_ivl_8", 3 0, v00000238b590ca10_0;  1 drivers
v00000238b590c650_0 .net "entrada_concatenada", 3 0, L_00000238b596c750;  1 drivers
v00000238b590ca10_0 .var "resultado", 3 0;
E_00000238b58b1630 .event anyedge, v00000238b590c650_0;
L_00000238b596c750 .concat [ 1 1 1 1], L_00000238b596c7f0, L_00000238b596dab0, L_00000238b596dc90, L_00000238b596ccf0;
L_00000238b596db50 .part v00000238b590ca10_0, 3, 1;
L_00000238b596d510 .part v00000238b590ca10_0, 2, 1;
L_00000238b596cc50 .part v00000238b590ca10_0, 1, 1;
L_00000238b596ddd0 .part v00000238b590ca10_0, 0, 1;
S_00000238b5872390 .scope module, "ev4" "evalua_suma3" 4 16, 5 1 0, S_00000238b587dc80;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "D0";
    .port_info 1 /INPUT 1 "D1";
    .port_info 2 /INPUT 1 "D2";
    .port_info 3 /INPUT 1 "D3";
    .port_info 4 /OUTPUT 1 "Q0";
    .port_info 5 /OUTPUT 1 "Q1";
    .port_info 6 /OUTPUT 1 "Q2";
    .port_info 7 /OUTPUT 1 "Q3";
v00000238b590b930_0 .net "D0", 0 0, L_00000238b596d010;  1 drivers
v00000238b590c6f0_0 .net "D1", 0 0, L_00000238b596d3d0;  1 drivers
v00000238b590bf70_0 .net "D2", 0 0, L_00000238b596d970;  1 drivers
v00000238b590bbb0_0 .net "D3", 0 0, L_00000238b596d0b0;  1 drivers
v00000238b590bcf0_0 .net "Q0", 0 0, L_00000238b596dfb0;  1 drivers
v00000238b590bd90_0 .net "Q1", 0 0, L_00000238b596dbf0;  1 drivers
v00000238b590c010_0 .net "Q2", 0 0, L_00000238b596d330;  1 drivers
v00000238b5911a70_0 .net "Q3", 0 0, L_00000238b596cd90;  1 drivers
v00000238b5910f30_0 .net *"_ivl_8", 3 0, v00000238b5910cb0_0;  1 drivers
v00000238b5910b70_0 .net "entrada_concatenada", 3 0, L_00000238b596cf70;  1 drivers
v00000238b5910cb0_0 .var "resultado", 3 0;
E_00000238b58b1c70 .event anyedge, v00000238b5910b70_0;
L_00000238b596cf70 .concat [ 1 1 1 1], L_00000238b596d010, L_00000238b596d3d0, L_00000238b596d970, L_00000238b596d0b0;
L_00000238b596cd90 .part v00000238b5910cb0_0, 3, 1;
L_00000238b596d330 .part v00000238b5910cb0_0, 2, 1;
L_00000238b596dbf0 .part v00000238b5910cb0_0, 1, 1;
L_00000238b596dfb0 .part v00000238b5910cb0_0, 0, 1;
S_00000238b58802f0 .scope module, "ev5" "evalua_suma3" 4 17, 5 1 0, S_00000238b587dc80;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "D0";
    .port_info 1 /INPUT 1 "D1";
    .port_info 2 /INPUT 1 "D2";
    .port_info 3 /INPUT 1 "D3";
    .port_info 4 /OUTPUT 1 "Q0";
    .port_info 5 /OUTPUT 1 "Q1";
    .port_info 6 /OUTPUT 1 "Q2";
    .port_info 7 /OUTPUT 1 "Q3";
v00000238b5911f70_0 .net "D0", 0 0, L_00000238b596c430;  1 drivers
v00000238b59105d0_0 .net "D1", 0 0, L_00000238b596d470;  1 drivers
v00000238b5911ed0_0 .net "D2", 0 0, L_00000238b596c4d0;  1 drivers
v00000238b5910d50_0 .net "D3", 0 0, L_00000238b596d650;  1 drivers
v00000238b5910df0_0 .net "Q0", 0 0, L_00000238b596c390;  1 drivers
v00000238b5910850_0 .net "Q1", 0 0, L_00000238b596d1f0;  1 drivers
v00000238b5911b10_0 .net "Q2", 0 0, L_00000238b596c2f0;  1 drivers
v00000238b5911d90_0 .net "Q3", 0 0, L_00000238b596c250;  1 drivers
v00000238b5910170_0 .net *"_ivl_8", 3 0, v00000238b5910fd0_0;  1 drivers
v00000238b59108f0_0 .net "entrada_concatenada", 3 0, L_00000238b596c110;  1 drivers
v00000238b5910fd0_0 .var "resultado", 3 0;
E_00000238b58b1170 .event anyedge, v00000238b59108f0_0;
L_00000238b596c110 .concat [ 1 1 1 1], L_00000238b596c430, L_00000238b596d470, L_00000238b596c4d0, L_00000238b596d650;
L_00000238b596c250 .part v00000238b5910fd0_0, 3, 1;
L_00000238b596c2f0 .part v00000238b5910fd0_0, 2, 1;
L_00000238b596d1f0 .part v00000238b5910fd0_0, 1, 1;
L_00000238b596c390 .part v00000238b5910fd0_0, 0, 1;
S_00000238b5880480 .scope module, "ev6" "evalua_suma3" 4 18, 5 1 0, S_00000238b587dc80;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "D0";
    .port_info 1 /INPUT 1 "D1";
    .port_info 2 /INPUT 1 "D2";
    .port_info 3 /INPUT 1 "D3";
    .port_info 4 /OUTPUT 1 "Q0";
    .port_info 5 /OUTPUT 1 "Q1";
    .port_info 6 /OUTPUT 1 "Q2";
    .port_info 7 /OUTPUT 1 "Q3";
v00000238b59103f0_0 .net "D0", 0 0, L_00000238b596d8d0;  1 drivers
v00000238b5911570_0 .net "D1", 0 0, L_00000238b596ca70;  1 drivers
v00000238b5910e90_0 .net "D2", 0 0, L_00000238b5971b00;  1 drivers
v00000238b5910ad0_0 .net "D3", 0 0, L_00000238b5971600;  1 drivers
v00000238b5911250_0 .net "Q0", 0 0, L_00000238b596c570;  1 drivers
v00000238b5910c10_0 .net "Q1", 0 0, L_00000238b596d830;  1 drivers
v00000238b5911070_0 .net "Q2", 0 0, L_00000238b596d790;  1 drivers
v00000238b5911110_0 .net "Q3", 0 0, L_00000238b596c930;  1 drivers
v00000238b59100d0_0 .net *"_ivl_8", 3 0, v00000238b5911610_0;  1 drivers
v00000238b59116b0_0 .net "entrada_concatenada", 3 0, L_00000238b596d6f0;  1 drivers
v00000238b5911610_0 .var "resultado", 3 0;
E_00000238b58b1670 .event anyedge, v00000238b59116b0_0;
L_00000238b596d6f0 .concat [ 1 1 1 1], L_00000238b596d8d0, L_00000238b596ca70, L_00000238b5971b00, L_00000238b5971600;
L_00000238b596c930 .part v00000238b5911610_0, 3, 1;
L_00000238b596d790 .part v00000238b5911610_0, 2, 1;
L_00000238b596d830 .part v00000238b5911610_0, 1, 1;
L_00000238b596c570 .part v00000238b5911610_0, 0, 1;
S_00000238b587de10 .scope module, "cycle_counter" "cycle_counter" 6 1;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "reset";
    .port_info 1 /INPUT 1 "clk";
    .port_info 2 /INPUT 2 "activation";
    .port_info 3 /INPUT 1 "we_7seg";
    .port_info 4 /OUTPUT 32 "counter";
o00000238b58b7a78 .functor BUFZ 2, C4<zz>; HiZ drive
v00000238b5911890_0 .net "activation", 1 0, o00000238b58b7a78;  0 drivers
o00000238b58b7aa8 .functor BUFZ 1, C4<z>; HiZ drive
v00000238b5910670_0 .net "clk", 0 0, o00000238b58b7aa8;  0 drivers
v00000238b5911930_0 .var "counter", 31 0;
v00000238b59119d0_0 .var "counting", 0 0;
o00000238b58b7b38 .functor BUFZ 1, C4<z>; HiZ drive
v00000238b5911cf0_0 .net "reset", 0 0, o00000238b58b7b38;  0 drivers
o00000238b58b7b68 .functor BUFZ 1, C4<z>; HiZ drive
v00000238b5910210_0 .net "we_7seg", 0 0, o00000238b58b7b68;  0 drivers
E_00000238b58b1370 .event posedge, v00000238b5911cf0_0, v00000238b5910670_0;
S_00000238b5861650 .scope module, "top_module_display" "top_module_display" 7 1;
 .timescale 0 0;
    .port_info 0 /INPUT 16 "switches";
    .port_info 1 /INPUT 1 "clk_10MHz";
    .port_info 2 /INPUT 1 "i_Rst";
    .port_info 3 /OUTPUT 1 "a";
    .port_info 4 /OUTPUT 1 "b";
    .port_info 5 /OUTPUT 1 "c";
    .port_info 6 /OUTPUT 1 "d";
    .port_info 7 /OUTPUT 1 "e";
    .port_info 8 /OUTPUT 1 "f";
    .port_info 9 /OUTPUT 1 "g";
    .port_info 10 /OUTPUT 8 "AN";
v00000238b5913bc0_0 .net "AN", 7 0, v00000238b59102b0_0;  1 drivers
v00000238b5913260_0 .net "a", 0 0, v00000238b5912720_0;  1 drivers
v00000238b5913d00_0 .net "b", 0 0, v00000238b59131c0_0;  1 drivers
v00000238b59122c0_0 .net "c", 0 0, v00000238b59125e0_0;  1 drivers
o00000238b58b81f8 .functor BUFZ 1, C4<z>; HiZ drive
v00000238b5912e00_0 .net "clk_10MHz", 0 0, o00000238b58b81f8;  0 drivers
v00000238b5912680_0 .net "clk_mux", 0 0, v00000238b5913b20_0;  1 drivers
v00000238b5912180_0 .net "d", 0 0, v00000238b59133a0_0;  1 drivers
v00000238b5912220_0 .net "e", 0 0, v00000238b5913c60_0;  1 drivers
v00000238b5913da0_0 .net "f", 0 0, v00000238b5912860_0;  1 drivers
v00000238b59129a0_0 .net "g", 0 0, v00000238b5913ee0_0;  1 drivers
o00000238b58b7d48 .functor BUFZ 1, C4<z>; HiZ drive
v00000238b5912360_0 .net "i_Rst", 0 0, o00000238b58b7d48;  0 drivers
v00000238b5912400_0 .net "mux", 1 0, v00000238b5910490_0;  1 drivers
v00000238b5912a40_0 .net "selected_switches", 3 0, v00000238b59139e0_0;  1 drivers
o00000238b58b8318 .functor BUFZ 16, C4<zzzzzzzzzzzzzzzz>; HiZ drive
v00000238b59124a0_0 .net "switches", 15 0, o00000238b58b8318;  0 drivers
S_00000238b587b200 .scope module, "control" "control" 7 41, 8 1 0, S_00000238b5861650;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "rst";
    .port_info 2 /OUTPUT 2 "mux_control";
    .port_info 3 /OUTPUT 8 "AN";
v00000238b59102b0_0 .var "AN", 7 0;
v00000238b5910350_0 .net "clk", 0 0, v00000238b5913b20_0;  alias, 1 drivers
v00000238b59107b0_0 .var "contador", 1 0;
v00000238b5910490_0 .var "mux_control", 1 0;
v00000238b5913120_0 .net "rst", 0 0, o00000238b58b7d48;  alias, 0 drivers
E_00000238b58b1bf0 .event posedge, v00000238b5913120_0, v00000238b5910350_0;
S_00000238b587b390 .scope module, "deco" "deco7segments" 7 30, 9 1 0, S_00000238b5861650;
 .timescale 0 0;
    .port_info 0 /INPUT 4 "selected_switches";
    .port_info 1 /OUTPUT 1 "a";
    .port_info 2 /OUTPUT 1 "b";
    .port_info 3 /OUTPUT 1 "c";
    .port_info 4 /OUTPUT 1 "d";
    .port_info 5 /OUTPUT 1 "e";
    .port_info 6 /OUTPUT 1 "f";
    .port_info 7 /OUTPUT 1 "g";
v00000238b5913f80_0 .net "A", 0 0, L_00000238b5970ac0;  1 drivers
v00000238b5912f40_0 .net "B", 0 0, L_00000238b5971ba0;  1 drivers
v00000238b5913800_0 .net "C", 0 0, L_00000238b59712e0;  1 drivers
v00000238b59134e0_0 .net "D", 0 0, L_00000238b5971f60;  1 drivers
v00000238b5912720_0 .var "a", 0 0;
v00000238b59131c0_0 .var "b", 0 0;
v00000238b59125e0_0 .var "c", 0 0;
v00000238b59133a0_0 .var "d", 0 0;
v00000238b5913c60_0 .var "e", 0 0;
v00000238b5912860_0 .var "f", 0 0;
v00000238b5913ee0_0 .var "g", 0 0;
v00000238b5912900_0 .net "selected_switches", 3 0, v00000238b59139e0_0;  alias, 1 drivers
E_00000238b58b1d70 .event anyedge, v00000238b5912f40_0, v00000238b59134e0_0, v00000238b5913f80_0, v00000238b5913800_0;
L_00000238b5970ac0 .part v00000238b59139e0_0, 3, 1;
L_00000238b5971ba0 .part v00000238b59139e0_0, 2, 1;
L_00000238b59712e0 .part v00000238b59139e0_0, 1, 1;
L_00000238b5971f60 .part v00000238b59139e0_0, 0, 1;
S_00000238b56c6760 .scope module, "divimux" "divimux" 7 48, 10 1 0, S_00000238b5861650;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "rst";
    .port_info 2 /OUTPUT 1 "enable";
P_00000238b58981f0 .param/l "CLK_FREQUENCY" 0 10 8, +C4<00000000100110001001011010000000>;
P_00000238b5898228 .param/l "CYCLES_PER_PERIOD" 1 10 10, +C4<0000000000000000000000000000000000000000000000000101000101100001>;
P_00000238b5898260 .param/l "TARGET_FREQUENCY" 0 10 9, +C4<00000000000000000000000011110000>;
v00000238b5912540_0 .net "clk", 0 0, o00000238b58b81f8;  alias, 0 drivers
v00000238b5913e40_0 .var "cycle_counter", 14 0;
v00000238b5913b20_0 .var "enable", 0 0;
v00000238b59120e0_0 .net "rst", 0 0, o00000238b58b7d48;  alias, 0 drivers
E_00000238b58b1530 .event posedge, v00000238b5912540_0;
S_00000238b56c68f0 .scope module, "muxinst" "muxdeco" 7 23, 11 1 0, S_00000238b5861650;
 .timescale 0 0;
    .port_info 0 /INPUT 16 "switches";
    .port_info 1 /INPUT 2 "mux";
    .port_info 2 /OUTPUT 4 "selected_switches";
v00000238b5913a80_0 .net "mux", 1 0, v00000238b5910490_0;  alias, 1 drivers
v00000238b59127c0_0 .var "select", 1 0;
v00000238b59139e0_0 .var "selected_switches", 3 0;
v00000238b59138a0_0 .net "switches", 15 0, o00000238b58b8318;  alias, 0 drivers
E_00000238b58b10b0 .event anyedge, v00000238b59127c0_0, v00000238b59138a0_0;
E_00000238b58b1cb0 .event anyedge, v00000238b5910490_0;
    .scope S_00000238b56cdb70;
T_0 ;
    %pushi/vec4 0, 0, 8;
    %store/vec4 v00000238b5893a80_0, 0, 8;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v00000238b5894340_0, 0, 1;
    %end;
    .thread T_0, $init;
    .scope S_00000238b56cdb70;
T_1 ;
    %wait E_00000238b58b1bb0;
    %load/vec4 v00000238b5893a80_0;
    %pad/u 64;
    %cmpi/e 249, 0, 64;
    %jmp/0xz  T_1.0, 4;
    %pushi/vec4 0, 0, 8;
    %assign/vec4 v00000238b5893a80_0, 0;
    %load/vec4 v00000238b5894340_0;
    %inv;
    %assign/vec4 v00000238b5894340_0, 0;
    %jmp T_1.1;
T_1.0 ;
    %load/vec4 v00000238b5893a80_0;
    %addi 1, 0, 8;
    %assign/vec4 v00000238b5893a80_0, 0;
T_1.1 ;
    %jmp T_1;
    .thread T_1;
    .scope S_00000238b58617e0;
T_2 ;
    %wait E_00000238b58b1430;
    %load/vec4 v00000238b590cf10_0;
    %pad/u 32;
    %cmpi/u 5, 0, 32;
    %jmp/0xz  T_2.0, 5;
    %load/vec4 v00000238b590cf10_0;
    %store/vec4 v00000238b590b430_0, 0, 4;
    %jmp T_2.1;
T_2.0 ;
    %load/vec4 v00000238b590cf10_0;
    %addi 3, 0, 4;
    %store/vec4 v00000238b590b430_0, 0, 4;
T_2.1 ;
    %jmp T_2;
    .thread T_2, $push;
    .scope S_00000238b585c3b0;
T_3 ;
    %wait E_00000238b58b10f0;
    %load/vec4 v00000238b590c0b0_0;
    %pad/u 32;
    %cmpi/u 5, 0, 32;
    %jmp/0xz  T_3.0, 5;
    %load/vec4 v00000238b590c0b0_0;
    %store/vec4 v00000238b590ba70_0, 0, 4;
    %jmp T_3.1;
T_3.0 ;
    %load/vec4 v00000238b590c0b0_0;
    %addi 3, 0, 4;
    %store/vec4 v00000238b590ba70_0, 0, 4;
T_3.1 ;
    %jmp T_3;
    .thread T_3, $push;
    .scope S_00000238b585c540;
T_4 ;
    %wait E_00000238b58b1270;
    %load/vec4 v00000238b590b570_0;
    %pad/u 32;
    %cmpi/u 5, 0, 32;
    %jmp/0xz  T_4.0, 5;
    %load/vec4 v00000238b590b570_0;
    %store/vec4 v00000238b590b6b0_0, 0, 4;
    %jmp T_4.1;
T_4.0 ;
    %load/vec4 v00000238b590b570_0;
    %addi 3, 0, 4;
    %store/vec4 v00000238b590b6b0_0, 0, 4;
T_4.1 ;
    %jmp T_4;
    .thread T_4, $push;
    .scope S_00000238b5872200;
T_5 ;
    %wait E_00000238b58b1630;
    %load/vec4 v00000238b590c650_0;
    %pad/u 32;
    %cmpi/u 5, 0, 32;
    %jmp/0xz  T_5.0, 5;
    %load/vec4 v00000238b590c650_0;
    %store/vec4 v00000238b590ca10_0, 0, 4;
    %jmp T_5.1;
T_5.0 ;
    %load/vec4 v00000238b590c650_0;
    %addi 3, 0, 4;
    %store/vec4 v00000238b590ca10_0, 0, 4;
T_5.1 ;
    %jmp T_5;
    .thread T_5, $push;
    .scope S_00000238b5872390;
T_6 ;
    %wait E_00000238b58b1c70;
    %load/vec4 v00000238b5910b70_0;
    %pad/u 32;
    %cmpi/u 5, 0, 32;
    %jmp/0xz  T_6.0, 5;
    %load/vec4 v00000238b5910b70_0;
    %store/vec4 v00000238b5910cb0_0, 0, 4;
    %jmp T_6.1;
T_6.0 ;
    %load/vec4 v00000238b5910b70_0;
    %addi 3, 0, 4;
    %store/vec4 v00000238b5910cb0_0, 0, 4;
T_6.1 ;
    %jmp T_6;
    .thread T_6, $push;
    .scope S_00000238b58802f0;
T_7 ;
    %wait E_00000238b58b1170;
    %load/vec4 v00000238b59108f0_0;
    %pad/u 32;
    %cmpi/u 5, 0, 32;
    %jmp/0xz  T_7.0, 5;
    %load/vec4 v00000238b59108f0_0;
    %store/vec4 v00000238b5910fd0_0, 0, 4;
    %jmp T_7.1;
T_7.0 ;
    %load/vec4 v00000238b59108f0_0;
    %addi 3, 0, 4;
    %store/vec4 v00000238b5910fd0_0, 0, 4;
T_7.1 ;
    %jmp T_7;
    .thread T_7, $push;
    .scope S_00000238b5880480;
T_8 ;
    %wait E_00000238b58b1670;
    %load/vec4 v00000238b59116b0_0;
    %pad/u 32;
    %cmpi/u 5, 0, 32;
    %jmp/0xz  T_8.0, 5;
    %load/vec4 v00000238b59116b0_0;
    %store/vec4 v00000238b5911610_0, 0, 4;
    %jmp T_8.1;
T_8.0 ;
    %load/vec4 v00000238b59116b0_0;
    %addi 3, 0, 4;
    %store/vec4 v00000238b5911610_0, 0, 4;
T_8.1 ;
    %jmp T_8;
    .thread T_8, $push;
    .scope S_00000238b587de10;
T_9 ;
    %wait E_00000238b58b1370;
    %load/vec4 v00000238b5911cf0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_9.0, 8;
    %pushi/vec4 0, 0, 32;
    %assign/vec4 v00000238b5911930_0, 0;
    %pushi/vec4 0, 0, 1;
    %assign/vec4 v00000238b59119d0_0, 0;
    %jmp T_9.1;
T_9.0 ;
    %load/vec4 v00000238b5910210_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_9.2, 8;
    %load/vec4 v00000238b5911890_0;
    %parti/s 1, 0, 2;
    %ix/load 4, 16, 0;
    %ix/load 5, 0, 0;
    %flag_set/imm 4, 0;
    %assign/vec4/off/d v00000238b5911930_0, 4, 5;
    %load/vec4 v00000238b5911890_0;
    %parti/s 1, 1, 2;
    %ix/load 4, 17, 0;
    %ix/load 5, 0, 0;
    %flag_set/imm 4, 0;
    %assign/vec4/off/d v00000238b5911930_0, 4, 5;
    %load/vec4 v00000238b5910210_0;
    %ix/load 4, 18, 0;
    %ix/load 5, 0, 0;
    %flag_set/imm 4, 0;
    %assign/vec4/off/d v00000238b5911930_0, 4, 5;
    %load/vec4 v00000238b5911890_0;
    %cmpi/e 1, 0, 2;
    %jmp/0xz  T_9.4, 4;
    %pushi/vec4 1, 0, 1;
    %assign/vec4 v00000238b59119d0_0, 0;
    %jmp T_9.5;
T_9.4 ;
    %load/vec4 v00000238b5911890_0;
    %cmpi/e 2, 0, 2;
    %jmp/0xz  T_9.6, 4;
    %pushi/vec4 0, 0, 1;
    %assign/vec4 v00000238b59119d0_0, 0;
T_9.6 ;
T_9.5 ;
    %load/vec4 v00000238b59119d0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_9.8, 8;
    %load/vec4 v00000238b5911930_0;
    %parti/s 16, 0, 2;
    %addi 1, 0, 16;
    %ix/load 4, 0, 0;
    %ix/load 5, 0, 0;
    %flag_set/imm 4, 0;
    %assign/vec4/off/d v00000238b5911930_0, 4, 5;
T_9.8 ;
T_9.2 ;
T_9.1 ;
    %jmp T_9;
    .thread T_9;
    .scope S_00000238b56c68f0;
T_10 ;
    %wait E_00000238b58b1cb0;
    %load/vec4 v00000238b5913a80_0;
    %cmpi/e 2, 0, 2;
    %jmp/0xz  T_10.0, 4;
    %pushi/vec4 2, 0, 2;
    %store/vec4 v00000238b59127c0_0, 0, 2;
    %jmp T_10.1;
T_10.0 ;
    %load/vec4 v00000238b5913a80_0;
    %cmpi/e 1, 0, 2;
    %jmp/0xz  T_10.2, 4;
    %pushi/vec4 1, 0, 2;
    %store/vec4 v00000238b59127c0_0, 0, 2;
    %jmp T_10.3;
T_10.2 ;
    %load/vec4 v00000238b5913a80_0;
    %cmpi/e 3, 0, 2;
    %jmp/0xz  T_10.4, 4;
    %pushi/vec4 3, 0, 2;
    %store/vec4 v00000238b59127c0_0, 0, 2;
    %jmp T_10.5;
T_10.4 ;
    %pushi/vec4 0, 0, 2;
    %store/vec4 v00000238b59127c0_0, 0, 2;
T_10.5 ;
T_10.3 ;
T_10.1 ;
    %jmp T_10;
    .thread T_10, $push;
    .scope S_00000238b56c68f0;
T_11 ;
    %wait E_00000238b58b10b0;
    %load/vec4 v00000238b59127c0_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 2;
    %cmp/u;
    %jmp/1 T_11.0, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 2;
    %cmp/u;
    %jmp/1 T_11.1, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 2;
    %cmp/u;
    %jmp/1 T_11.2, 6;
    %load/vec4 v00000238b59138a0_0;
    %parti/s 4, 12, 5;
    %store/vec4 v00000238b59139e0_0, 0, 4;
    %jmp T_11.4;
T_11.0 ;
    %load/vec4 v00000238b59138a0_0;
    %parti/s 4, 0, 2;
    %store/vec4 v00000238b59139e0_0, 0, 4;
    %jmp T_11.4;
T_11.1 ;
    %load/vec4 v00000238b59138a0_0;
    %parti/s 4, 4, 4;
    %store/vec4 v00000238b59139e0_0, 0, 4;
    %jmp T_11.4;
T_11.2 ;
    %load/vec4 v00000238b59138a0_0;
    %parti/s 4, 8, 5;
    %store/vec4 v00000238b59139e0_0, 0, 4;
    %jmp T_11.4;
T_11.4 ;
    %pop/vec4 1;
    %jmp T_11;
    .thread T_11, $push;
    .scope S_00000238b587b390;
T_12 ;
    %wait E_00000238b58b1d70;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5913800_0;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5912f40_0;
    %and;
    %load/vec4 v00000238b59134e0_0;
    %and;
    %or;
    %load/vec4 v00000238b5912f40_0;
    %load/vec4 v00000238b5913800_0;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %and;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %and;
    %or;
    %inv;
    %store/vec4 v00000238b5912720_0, 0, 1;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %and;
    %load/vec4 v00000238b59134e0_0;
    %and;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %and;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5913800_0;
    %and;
    %load/vec4 v00000238b59134e0_0;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %and;
    %or;
    %inv;
    %store/vec4 v00000238b59131c0_0, 0, 1;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %load/vec4 v00000238b59134e0_0;
    %and;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5912f40_0;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b59134e0_0;
    %and;
    %or;
    %inv;
    %store/vec4 v00000238b59125e0_0, 0, 1;
    %load/vec4 v00000238b5912f40_0;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %and;
    %load/vec4 v00000238b59134e0_0;
    %and;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %load/vec4 v00000238b5913800_0;
    %and;
    %load/vec4 v00000238b59134e0_0;
    %and;
    %or;
    %load/vec4 v00000238b5912f40_0;
    %load/vec4 v00000238b5913800_0;
    %and;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %and;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %and;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %or;
    %inv;
    %store/vec4 v00000238b59133a0_0, 0, 1;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %load/vec4 v00000238b5913800_0;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b5913800_0;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b5912f40_0;
    %and;
    %or;
    %inv;
    %store/vec4 v00000238b5913c60_0, 0, 1;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %load/vec4 v00000238b5912f40_0;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5912f40_0;
    %and;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b5913800_0;
    %and;
    %or;
    %inv;
    %store/vec4 v00000238b5912860_0, 0, 1;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %load/vec4 v00000238b5913800_0;
    %and;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b5912f40_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %load/vec4 v00000238b59134e0_0;
    %and;
    %or;
    %load/vec4 v00000238b5913800_0;
    %load/vec4 v00000238b59134e0_0;
    %inv;
    %and;
    %or;
    %load/vec4 v00000238b5913f80_0;
    %inv;
    %load/vec4 v00000238b5912f40_0;
    %and;
    %load/vec4 v00000238b5913800_0;
    %inv;
    %and;
    %or;
    %inv;
    %store/vec4 v00000238b5913ee0_0, 0, 1;
    %jmp T_12;
    .thread T_12, $push;
    .scope S_00000238b587b200;
T_13 ;
    %wait E_00000238b58b1bf0;
    %load/vec4 v00000238b5913120_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_13.0, 8;
    %pushi/vec4 0, 0, 2;
    %store/vec4 v00000238b59107b0_0, 0, 2;
    %jmp T_13.1;
T_13.0 ;
    %load/vec4 v00000238b59107b0_0;
    %cmpi/e 3, 0, 2;
    %jmp/0xz  T_13.2, 4;
    %pushi/vec4 0, 0, 2;
    %assign/vec4 v00000238b59107b0_0, 0;
    %jmp T_13.3;
T_13.2 ;
    %load/vec4 v00000238b59107b0_0;
    %addi 1, 0, 2;
    %assign/vec4 v00000238b59107b0_0, 0;
T_13.3 ;
    %load/vec4 v00000238b59107b0_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 2;
    %cmp/u;
    %jmp/1 T_13.4, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 2;
    %cmp/u;
    %jmp/1 T_13.5, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 2;
    %cmp/u;
    %jmp/1 T_13.6, 6;
    %pushi/vec4 3, 0, 2;
    %store/vec4 v00000238b5910490_0, 0, 2;
    %pushi/vec4 247, 0, 8;
    %store/vec4 v00000238b59102b0_0, 0, 8;
    %jmp T_13.8;
T_13.4 ;
    %pushi/vec4 0, 0, 2;
    %store/vec4 v00000238b5910490_0, 0, 2;
    %pushi/vec4 254, 0, 8;
    %store/vec4 v00000238b59102b0_0, 0, 8;
    %jmp T_13.8;
T_13.5 ;
    %pushi/vec4 1, 0, 2;
    %store/vec4 v00000238b5910490_0, 0, 2;
    %pushi/vec4 253, 0, 8;
    %store/vec4 v00000238b59102b0_0, 0, 8;
    %jmp T_13.8;
T_13.6 ;
    %pushi/vec4 2, 0, 2;
    %store/vec4 v00000238b5910490_0, 0, 2;
    %pushi/vec4 251, 0, 8;
    %store/vec4 v00000238b59102b0_0, 0, 8;
    %jmp T_13.8;
T_13.8 ;
    %pop/vec4 1;
T_13.1 ;
    %jmp T_13;
    .thread T_13;
    .scope S_00000238b56c6760;
T_14 ;
    %wait E_00000238b58b1530;
    %load/vec4 v00000238b59120e0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_14.0, 8;
    %pushi/vec4 0, 0, 15;
    %assign/vec4 v00000238b5913e40_0, 0;
    %pushi/vec4 0, 0, 1;
    %assign/vec4 v00000238b5913b20_0, 0;
    %jmp T_14.1;
T_14.0 ;
    %load/vec4 v00000238b5913e40_0;
    %pad/u 64;
    %cmpi/e 20832, 0, 64;
    %jmp/0xz  T_14.2, 4;
    %pushi/vec4 0, 0, 15;
    %assign/vec4 v00000238b5913e40_0, 0;
    %load/vec4 v00000238b5913b20_0;
    %inv;
    %assign/vec4 v00000238b5913b20_0, 0;
    %jmp T_14.3;
T_14.2 ;
    %load/vec4 v00000238b5913e40_0;
    %addi 1, 0, 15;
    %assign/vec4 v00000238b5913e40_0, 0;
T_14.3 ;
T_14.1 ;
    %jmp T_14;
    .thread T_14;
# The file index is used to find the file name in the following table.
:file_names 12;
    "N/A";
    "<interactive>";
    "-";
    "clock_divider.sv";
    "convertidor_bcd.sv";
    "evalua_suma3.sv";
    "module_contador_ciclos.sv";
    "top_module_display.sv";
    "control.sv";
    "deco7segments.sv";
    "divimux.sv";
    "muxdeco.sv";
