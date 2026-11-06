// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.13.0.56.2
// Netlist written on Mon Aug 12 15:12:04 2024
//
// Verilog Description of module EncoderTop
//

module EncoderTop (clki, interrupt, spi_sck, spi_mosi, spi_scs, spi_miso, 
            endat_clk, endat_tx, endat_dir, endat_rx, led6, led7, 
            spare1, spare2, spare3, spare4, spare5, spare6);   // d:/git/jojo_endat/encodertop.vhd(12[8:18])
    input clki;   // d:/git/jojo_endat/encodertop.vhd(14[10:14])
    input interrupt;   // d:/git/jojo_endat/encodertop.vhd(14[16:25])
    input spi_sck;   // d:/git/jojo_endat/encodertop.vhd(16[5:12])
    input spi_mosi;   // d:/git/jojo_endat/encodertop.vhd(16[14:22])
    input spi_scs;   // d:/git/jojo_endat/encodertop.vhd(16[24:31])
    output spi_miso;   // d:/git/jojo_endat/encodertop.vhd(17[5:13])
    output endat_clk;   // d:/git/jojo_endat/encodertop.vhd(19[5:14])
    output endat_tx;   // d:/git/jojo_endat/encodertop.vhd(19[16:24])
    output endat_dir;   // d:/git/jojo_endat/encodertop.vhd(19[26:35])
    input endat_rx;   // d:/git/jojo_endat/encodertop.vhd(20[5:13])
    output led6 /* synthesis .original_dir=IN_OUT */ ;   // d:/git/jojo_endat/encodertop.vhd(22[5:9])
    output led7 /* synthesis .original_dir=IN_OUT */ ;   // d:/git/jojo_endat/encodertop.vhd(22[11:15])
    input spare1 /* synthesis .original_dir=IN_OUT */ ;   // d:/git/jojo_endat/encodertop.vhd(23[5:11])
    input spare2 /* synthesis .original_dir=IN_OUT */ ;   // d:/git/jojo_endat/encodertop.vhd(23[13:19])
    input spare3 /* synthesis .original_dir=IN_OUT */ ;   // d:/git/jojo_endat/encodertop.vhd(23[21:27])
    input spare4 /* synthesis .original_dir=IN_OUT */ ;   // d:/git/jojo_endat/encodertop.vhd(23[29:35])
    input spare5 /* synthesis .original_dir=IN_OUT */ ;   // d:/git/jojo_endat/encodertop.vhd(23[37:43])
    output spare6 /* synthesis .original_dir=IN_OUT */ ;   // d:/git/jojo_endat/encodertop.vhd(23[45:51])
    
    wire clki_c /* synthesis is_clock=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(14[10:14])
    wire clk /* synthesis SET_AS_NETWORK=clk, is_clock=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(35[16:19])
    wire read_memory /* synthesis is_clock=1, SET_AS_NETWORK=read_memory */ ;   // d:/git/jojo_endat/encodertop.vhd(45[9:20])
    
    wire GND_net, VCC_net, interrupt_c, spi_sck_c, spi_mosi_c, spare6_c_c, 
        spi_miso_c, endat_clk_c, endat_tx_c, endat_dir_c, led7_c_c, 
        led6_c, reset;
    wire [7:0]reset_counter_usec;   // d:/git/jojo_endat/encodertop.vhd(36[9:27])
    wire [9:0]reset_counter;   // d:/git/jojo_endat/encodertop.vhd(37[9:22])
    wire [31:0]endat_position;   // d:/git/jojo_endat/encodertop.vhd(38[9:23])
    wire [31:0]mcu_settings1;   // d:/git/jojo_endat/encodertop.vhd(39[9:22])
    wire [1:0]interrupt_buf;   // d:/git/jojo_endat/encodertop.vhd(40[9:22])
    wire [31:0]memory_in;   // d:/git/jojo_endat/encodertop.vhd(43[9:18])
    wire [31:0]memory_out;   // d:/git/jojo_endat/encodertop.vhd(43[20:30])
    wire [31:0]memory_out_buf;   // d:/git/jojo_endat/encodertop.vhd(43[32:46])
    wire [31:0]dummy_register;   // d:/git/jojo_endat/encodertop.vhd(43[48:62])
    wire [7:0]address_memory;   // d:/git/jojo_endat/encodertop.vhd(44[9:23])
    
    wire write_memory;
    wire [7:0]usec_interrupt_counter;   // d:/git/jojo_endat/encodertop.vhd(48[9:31])
    wire [15:0]interrupt_counter;   // d:/git/jojo_endat/encodertop.vhd(49[9:26])
    
    wire reset_counter_usec_7__N_292, n5055, n39, n80, n5386, n83, 
        n5079, clk_enable_131, n85, led6_N_422, n79, n81, n83_adj_887, 
        n49, n50, n55, n103, n101, memory_out_buf_31__N_64, memory_out_buf_31__N_62, 
        memory_out_buf_31__N_60, memory_out_buf_31__N_56, memory_out_buf_31__N_54, 
        memory_out_buf_31__N_53, memory_out_buf_31__N_71, memory_out_buf_31__N_69, 
        memory_out_buf_31__N_68, memory_out_buf_31__N_76, memory_out_buf_31__N_74, 
        memory_out_buf_31__N_73, memory_out_buf_31__N_81, memory_out_buf_31__N_79, 
        memory_out_buf_31__N_78, memory_out_buf_31__N_86, memory_out_buf_31__N_84, 
        memory_out_buf_31__N_83, memory_out_buf_31__N_91, memory_out_buf_31__N_89, 
        memory_out_buf_31__N_88, memory_out_buf_31__N_96, memory_out_buf_31__N_94, 
        memory_out_buf_31__N_93, memory_out_buf_31__N_101, memory_out_buf_31__N_99, 
        memory_out_buf_31__N_98, memory_out_buf_31__N_106, memory_out_buf_31__N_104, 
        memory_out_buf_31__N_103, memory_out_buf_31__N_111, memory_out_buf_31__N_109, 
        memory_out_buf_31__N_108, memory_out_buf_31__N_116, memory_out_buf_31__N_114, 
        memory_out_buf_31__N_113, memory_out_buf_31__N_121, memory_out_buf_31__N_119, 
        memory_out_buf_31__N_118, memory_out_buf_31__N_126, memory_out_buf_31__N_124, 
        memory_out_buf_31__N_123, memory_out_buf_31__N_131, memory_out_buf_31__N_129, 
        memory_out_buf_31__N_128, memory_out_buf_31__N_136, memory_out_buf_31__N_134, 
        memory_out_buf_31__N_133, memory_out_buf_31__N_141, memory_out_buf_31__N_139, 
        memory_out_buf_31__N_138, memory_out_buf_31__N_146, memory_out_buf_31__N_144, 
        memory_out_buf_31__N_143, memory_out_buf_31__N_151, memory_out_buf_31__N_149, 
        memory_out_buf_31__N_148, memory_out_buf_31__N_156, memory_out_buf_31__N_154, 
        memory_out_buf_31__N_153, memory_out_buf_31__N_161, memory_out_buf_31__N_159, 
        memory_out_buf_31__N_158, memory_out_buf_31__N_166, memory_out_buf_31__N_164, 
        memory_out_buf_31__N_163, memory_out_buf_31__N_171, memory_out_buf_31__N_169, 
        memory_out_buf_31__N_168, memory_out_buf_31__N_176, memory_out_buf_31__N_174, 
        memory_out_buf_31__N_173, memory_out_buf_31__N_182, memory_out_buf_31__N_179, 
        memory_out_buf_31__N_178, memory_out_buf_31__N_184, memory_out_buf_31__N_183, 
        memory_out_buf_31__N_192, memory_out_buf_31__N_189, memory_out_buf_31__N_188, 
        memory_out_buf_31__N_196, memory_out_buf_31__N_194, memory_out_buf_31__N_193, 
        memory_out_buf_31__N_199, memory_out_buf_31__N_198, memory_out_buf_31__N_204, 
        memory_out_buf_31__N_203, memory_out_buf_31__N_212, memory_out_buf_31__N_209, 
        memory_out_buf_31__N_208, memory_out_buf_31__N_216, memory_out_buf_31__N_214, 
        memory_out_buf_31__N_213, memory_out_buf_31__N_222, memory_out_buf_31__N_219, 
        memory_out_buf_31__N_218, n3130, n47, n48, n84, n46, n5360, 
        n44, n85_adj_888, n71, n41, n74, n39_adj_889, n77, n78, 
        n43, n8, n40, n38, n45, n42, n3696, n19, n5054, n18, 
        n17, n51, n52, n53, n54, n4, n5271, n82, n7;
    wire [7:0]clk_counter;   // d:/git/jojo_endat/endat.vhd(33[9:20])
    
    wire clk_enable_235, n2955;
    wire [7:0]modebits_buffer_7__N_828;
    
    wire n73, n7_adj_890, n5904, n4_adj_891, n23, n5278, n5273, 
        n5044, n5053, n5052, n75, n5900, n5075, n5899, n6224, 
        clk_enable_248, n15, n14, n5062, n5269, n5061, n5060, 
        n5897, n5043, n1546, n5896, n5391, n5299, n6, n3605, 
        n2482, n5042, clk_enable_39, clk_enable_247, n5296, n72, 
        n76, n70, n5059, n5051, n5050, n5049, n5048, n5047, 
        n5323, n5058, n5931, n45_adj_892, n40_adj_893, n41_adj_894, 
        clk_enable_251, n42_adj_895, n43_adj_896, n6_adj_897, n5281, 
        n5046, n5057, n44_adj_898, n38_adj_899, n5045, n5056, n5915, 
        n5913, n5912;
    
    LUT4 memory_out_buf_31__I_76_4_lut (.A(endat_position[13]), .B(endat_position[4]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_156)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_76_4_lut.init = 16'hcac0;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    FD1S3IX global_sync_534 (.D(n2482), .CK(clk), .CD(n5386), .Q(modebits_buffer_7__N_828[2]));   // d:/git/jojo_endat/encodertop.vhd(156[4] 188[11])
    defparam global_sync_534.GSR = "ENABLED";
    OB led6_pad (.I(led6_c), .O(led6));   // d:/git/jojo_endat/encodertop.vhd(22[5:9])
    FD1S3AX memory_out_i0 (.D(memory_out_buf[0]), .CK(clk), .Q(memory_out[0]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i0.GSR = "ENABLED";
    FD1S3AX led6_537 (.D(led6_N_422), .CK(clk), .Q(led6_c));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam led6_537.GSR = "ENABLED";
    FD1S3AX reset_529 (.D(reset_counter_usec_7__N_292), .CK(clk), .Q(reset)) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(139[4] 151[11])
    defparam reset_529.GSR = "DISABLED";
    FD1P3AY mcu_settings1_i0 (.D(memory_in[0]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[0])) /* synthesis lse_init_val=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i0.GSR = "DISABLED";
    endat endat1 (.clk_counter({clk_counter}), .clk(clk), .GND_net(GND_net), 
          .endat_dir_c(endat_dir_c), .endat_clk_c(endat_clk_c), .endat_position({endat_position}), 
          .led7_c_c(led7_c_c), .n2955(n2955), .n6224(n6224), .n5915(n5915), 
          .n19(n19), .n5900(n5900), .n17(n17), .n18(n18), .n4(n4), 
          .\modebits_buffer_7__N_828[2] (modebits_buffer_7__N_828[2]), .n5912(n5912), 
          .n8(n8), .n5913(n5913), .n5323(n5323), .reset(reset), .endat_tx_c(endat_tx_c));   // d:/git/jojo_endat/encodertop.vhd(115[10:15])
    FD1P3AX mcu_settings1_i1 (.D(memory_in[1]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[1])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i1.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i2 (.D(memory_in[2]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[2])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i2.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i3 (.D(memory_in[3]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[3])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i3.GSR = "DISABLED";
    FD1P3AY mcu_settings1_i4 (.D(memory_in[4]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[4])) /* synthesis lse_init_val=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i4.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i5 (.D(memory_in[5]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[5])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i5.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i6 (.D(memory_in[6]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[6])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i6.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i7 (.D(memory_in[7]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[7])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i7.GSR = "DISABLED";
    FD1P3AY mcu_settings1_i8 (.D(memory_in[8]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[8])) /* synthesis lse_init_val=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i8.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i9 (.D(memory_in[9]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[9])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i9.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i10 (.D(memory_in[10]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[10])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i10.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i11 (.D(memory_in[11]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[11])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i11.GSR = "DISABLED";
    FD1P3AY mcu_settings1_i12 (.D(memory_in[12]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[12])) /* synthesis lse_init_val=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i12.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i13 (.D(memory_in[13]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[13])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i13.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i14 (.D(memory_in[14]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[14])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i14.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i15 (.D(memory_in[15]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[15])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i15.GSR = "DISABLED";
    FD1P3AY mcu_settings1_i16 (.D(memory_in[16]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[16])) /* synthesis lse_init_val=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i16.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i17 (.D(memory_in[17]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[17])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i17.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i18 (.D(memory_in[18]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[18])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i18.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i19 (.D(memory_in[19]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[19])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i19.GSR = "DISABLED";
    FD1P3AY mcu_settings1_i20 (.D(memory_in[20]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[20])) /* synthesis lse_init_val=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i20.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i21 (.D(memory_in[21]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[21])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i21.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i22 (.D(memory_in[22]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[22])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i22.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i23 (.D(memory_in[23]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[23])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i23.GSR = "DISABLED";
    FD1P3AY mcu_settings1_i24 (.D(memory_in[24]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[24])) /* synthesis lse_init_val=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i24.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i25 (.D(memory_in[25]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[25])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i25.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i26 (.D(memory_in[26]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[26])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i26.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i27 (.D(memory_in[27]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[27])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i27.GSR = "DISABLED";
    FD1P3AY mcu_settings1_i28 (.D(memory_in[28]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[28])) /* synthesis lse_init_val=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i28.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i29 (.D(memory_in[29]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[29])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i29.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i30 (.D(memory_in[30]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[30])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i30.GSR = "DISABLED";
    FD1P3AX mcu_settings1_i31 (.D(memory_in[31]), .SP(clk_enable_39), .CK(clk), 
            .Q(mcu_settings1[31])) /* synthesis lse_init_val=0 */ ;   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam mcu_settings1_i31.GSR = "DISABLED";
    OB endat_dir_pad (.I(endat_dir_c), .O(endat_dir));   // d:/git/jojo_endat/encodertop.vhd(19[26:35])
    OB endat_tx_pad (.I(endat_tx_c), .O(endat_tx));   // d:/git/jojo_endat/encodertop.vhd(19[16:24])
    OB endat_clk_pad (.I(endat_clk_c), .O(endat_clk));   // d:/git/jojo_endat/encodertop.vhd(19[5:14])
    FD1P3AX interrupt_buf_i0_i0 (.D(interrupt_c), .SP(clk_enable_251), .CK(clk), 
            .Q(interrupt_buf[0]));   // d:/git/jojo_endat/encodertop.vhd(156[4] 188[11])
    defparam interrupt_buf_i0_i0.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i2 (.D(memory_out_buf_31__N_213), .CK(read_memory), 
           .Q(memory_out_buf[1]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i2.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i3 (.D(memory_out_buf_31__N_208), .CK(read_memory), 
           .Q(memory_out_buf[2]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i3.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i4 (.D(memory_out_buf_31__N_203), .CK(read_memory), 
           .Q(memory_out_buf[3]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i4.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i5 (.D(memory_out_buf_31__N_198), .CK(read_memory), 
           .Q(memory_out_buf[4]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i5.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i6 (.D(memory_out_buf_31__N_193), .CK(read_memory), 
           .Q(memory_out_buf[5]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i6.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i7 (.D(memory_out_buf_31__N_188), .CK(read_memory), 
           .Q(memory_out_buf[6]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i7.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i8 (.D(memory_out_buf_31__N_183), .CK(read_memory), 
           .Q(memory_out_buf[7]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i8.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i9 (.D(memory_out_buf_31__N_178), .CK(read_memory), 
           .Q(memory_out_buf[8]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i9.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i10 (.D(memory_out_buf_31__N_173), .CK(read_memory), 
           .Q(memory_out_buf[9]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i10.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i11 (.D(memory_out_buf_31__N_168), .CK(read_memory), 
           .Q(memory_out_buf[10]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i11.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i12 (.D(memory_out_buf_31__N_163), .CK(read_memory), 
           .Q(memory_out_buf[11]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i12.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i13 (.D(memory_out_buf_31__N_158), .CK(read_memory), 
           .Q(memory_out_buf[12]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i13.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i14 (.D(memory_out_buf_31__N_153), .CK(read_memory), 
           .Q(memory_out_buf[13]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i14.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i15 (.D(memory_out_buf_31__N_148), .CK(read_memory), 
           .Q(memory_out_buf[14]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i15.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i16 (.D(memory_out_buf_31__N_143), .CK(read_memory), 
           .Q(memory_out_buf[15]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i16.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i17 (.D(memory_out_buf_31__N_138), .CK(read_memory), 
           .Q(memory_out_buf[16]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i17.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i18 (.D(memory_out_buf_31__N_133), .CK(read_memory), 
           .Q(memory_out_buf[17]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i18.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i19 (.D(memory_out_buf_31__N_128), .CK(read_memory), 
           .Q(memory_out_buf[18]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i19.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i20 (.D(memory_out_buf_31__N_123), .CK(read_memory), 
           .Q(memory_out_buf[19]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i20.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i21 (.D(memory_out_buf_31__N_118), .CK(read_memory), 
           .Q(memory_out_buf[20]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i21.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i22 (.D(memory_out_buf_31__N_113), .CK(read_memory), 
           .Q(memory_out_buf[21]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i22.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i23 (.D(memory_out_buf_31__N_108), .CK(read_memory), 
           .Q(memory_out_buf[22]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i23.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i24 (.D(memory_out_buf_31__N_103), .CK(read_memory), 
           .Q(memory_out_buf[23]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i24.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i25 (.D(memory_out_buf_31__N_98), .CK(read_memory), 
           .Q(memory_out_buf[24]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i25.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i26 (.D(memory_out_buf_31__N_93), .CK(read_memory), 
           .Q(memory_out_buf[25]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i26.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i27 (.D(memory_out_buf_31__N_88), .CK(read_memory), 
           .Q(memory_out_buf[26]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i27.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i28 (.D(memory_out_buf_31__N_83), .CK(read_memory), 
           .Q(memory_out_buf[27]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i28.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i29 (.D(memory_out_buf_31__N_78), .CK(read_memory), 
           .Q(memory_out_buf[28]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i29.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i30 (.D(memory_out_buf_31__N_73), .CK(read_memory), 
           .Q(memory_out_buf[29]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i30.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i31 (.D(memory_out_buf_31__N_68), .CK(read_memory), 
           .Q(memory_out_buf[30]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i31.GSR = "DISABLED";
    FD1S1A memory_out_buf_31__I_0_i32 (.D(memory_out_buf_31__N_53), .CK(read_memory), 
           .Q(memory_out_buf[31]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i32.GSR = "DISABLED";
    FD1P3IX interrupt_counter_1047__i1 (.D(n84), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[1])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i1.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i2 (.D(n83_adj_887), .SP(clk_enable_131), 
            .CD(n3696), .CK(clk), .Q(interrupt_counter[2])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i2.GSR = "ENABLED";
    FD1P3AX reset_counter_1044__i9 (.D(n46), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[9])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i9.GSR = "DISABLED";
    FD1P3AX reset_counter_1044__i8 (.D(n47), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[8])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i8.GSR = "DISABLED";
    FD1P3AX reset_counter_1044__i7 (.D(n48), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[7])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i7.GSR = "DISABLED";
    FD1P3AX reset_counter_1044__i6 (.D(n49), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[6])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i6.GSR = "DISABLED";
    FD1P3AX reset_counter_1044__i5 (.D(n50), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[5])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i5.GSR = "DISABLED";
    FD1P3AX reset_counter_1044__i4 (.D(n51), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[4])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i4.GSR = "DISABLED";
    FD1P3AX reset_counter_1044__i3 (.D(n52), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[3])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i3.GSR = "DISABLED";
    FD1P3AX reset_counter_1044__i2 (.D(n53), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[2])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i2.GSR = "DISABLED";
    FD1P3AX reset_counter_1044__i1 (.D(n54), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[1])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i1.GSR = "DISABLED";
    FD1P3IX interrupt_counter_1047__i3 (.D(n82), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[3])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i3.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i4 (.D(n81), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[4])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i4.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i5 (.D(n80), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[5])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i5.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i6 (.D(n79), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[6])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i6.GSR = "ENABLED";
    FD1P3AX dummy_register_i0_i0 (.D(memory_in[0]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[0]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i0.GSR = "DISABLED";
    FD1P3IX interrupt_counter_1047__i7 (.D(n78), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[7])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i7.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i8 (.D(n77), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[8])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i8.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i9 (.D(n76), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[9])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i9.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i10 (.D(n75), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[10])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i10.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i11 (.D(n74), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[11])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i11.GSR = "ENABLED";
    CCU2D reset_counter_1044_add_4_5 (.A0(reset_counter[3]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(reset_counter[4]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5051), .COUT(n5052), .S0(n52), 
          .S1(n51));   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044_add_4_5.INIT0 = 16'hfaaa;
    defparam reset_counter_1044_add_4_5.INIT1 = 16'hfaaa;
    defparam reset_counter_1044_add_4_5.INJECT1_0 = "NO";
    defparam reset_counter_1044_add_4_5.INJECT1_1 = "NO";
    FD1P3IX interrupt_counter_1047__i12 (.D(n73), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[12])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i12.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i0 (.D(n85_adj_888), .SP(clk_enable_131), 
            .CD(n3696), .CK(clk), .Q(interrupt_counter[0])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i0.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i13 (.D(n72), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[13])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i13.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i14 (.D(n71), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[14])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i14.GSR = "ENABLED";
    FD1P3IX interrupt_counter_1047__i15 (.D(n70), .SP(clk_enable_131), .CD(n3696), 
            .CK(clk), .Q(interrupt_counter[15])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047__i15.GSR = "ENABLED";
    CCU2D reset_counter_1044_add_4_3 (.A0(reset_counter[1]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(reset_counter[2]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5050), .COUT(n5051), .S0(n54), 
          .S1(n53));   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044_add_4_3.INIT0 = 16'hfaaa;
    defparam reset_counter_1044_add_4_3.INIT1 = 16'hfaaa;
    defparam reset_counter_1044_add_4_3.INJECT1_0 = "NO";
    defparam reset_counter_1044_add_4_3.INJECT1_1 = "NO";
    FD1P3AX dummy_register_i0_i31 (.D(memory_in[31]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[31]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i31.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i30 (.D(memory_in[30]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[30]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i30.GSR = "DISABLED";
    FD1P3IX usec_interrupt_counter_1049__i1 (.D(n44), .SP(clk_enable_248), 
            .CD(n5931), .CK(clk), .Q(usec_interrupt_counter[1])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049__i1.GSR = "ENABLED";
    FD1P3AX dummy_register_i0_i29 (.D(memory_in[29]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[29]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i29.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i28 (.D(memory_in[28]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[28]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i28.GSR = "DISABLED";
    FD1P3IX usec_interrupt_counter_1049__i2 (.D(n43), .SP(clk_enable_248), 
            .CD(n5931), .CK(clk), .Q(usec_interrupt_counter[2])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049__i2.GSR = "ENABLED";
    FD1P3IX usec_interrupt_counter_1049__i3 (.D(n42), .SP(clk_enable_248), 
            .CD(n5931), .CK(clk), .Q(usec_interrupt_counter[3])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049__i3.GSR = "ENABLED";
    FD1P3IX usec_interrupt_counter_1049__i4 (.D(n41), .SP(clk_enable_248), 
            .CD(n5931), .CK(clk), .Q(usec_interrupt_counter[4])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049__i4.GSR = "ENABLED";
    FD1P3IX usec_interrupt_counter_1049__i5 (.D(n40), .SP(clk_enable_248), 
            .CD(n5931), .CK(clk), .Q(usec_interrupt_counter[5])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049__i5.GSR = "ENABLED";
    FD1P3IX usec_interrupt_counter_1049__i6 (.D(n39_adj_889), .SP(clk_enable_248), 
            .CD(n5931), .CK(clk), .Q(usec_interrupt_counter[6])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049__i6.GSR = "ENABLED";
    FD1P3AX reset_counter_1044__i0 (.D(n55), .SP(reset_counter_usec_7__N_292), 
            .CK(clk), .Q(reset_counter[0])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044__i0.GSR = "DISABLED";
    FD1P3IX usec_interrupt_counter_1049__i7 (.D(n38), .SP(clk_enable_248), 
            .CD(n5931), .CK(clk), .Q(usec_interrupt_counter[7])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049__i7.GSR = "ENABLED";
    CCU2D interrupt_counter_1047_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(interrupt_counter[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n5042), .S1(n85_adj_888));   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047_add_4_1.INIT0 = 16'hF000;
    defparam interrupt_counter_1047_add_4_1.INIT1 = 16'h0555;
    defparam interrupt_counter_1047_add_4_1.INJECT1_0 = "NO";
    defparam interrupt_counter_1047_add_4_1.INJECT1_1 = "NO";
    FD1P3IX reset_counter_usec_1045__i1 (.D(n44_adj_898), .SP(reset_counter_usec_7__N_292), 
            .CD(n3605), .CK(clk), .Q(reset_counter_usec[1])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045__i1.GSR = "DISABLED";
    FD1P3IX reset_counter_usec_1045__i2 (.D(n43_adj_896), .SP(reset_counter_usec_7__N_292), 
            .CD(n3605), .CK(clk), .Q(reset_counter_usec[2])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045__i2.GSR = "DISABLED";
    CCU2D reset_counter_1044_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n7), .B1(n5269), .C1(reset_counter[0]), 
          .D1(GND_net), .COUT(n5050), .S1(n55));   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044_add_4_1.INIT0 = 16'hF000;
    defparam reset_counter_1044_add_4_1.INIT1 = 16'he1e1;
    defparam reset_counter_1044_add_4_1.INJECT1_0 = "NO";
    defparam reset_counter_1044_add_4_1.INJECT1_1 = "NO";
    FD1P3IX reset_counter_usec_1045__i3 (.D(n42_adj_895), .SP(reset_counter_usec_7__N_292), 
            .CD(n3605), .CK(clk), .Q(reset_counter_usec[3])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045__i3.GSR = "DISABLED";
    FD1P3IX reset_counter_usec_1045__i4 (.D(n41_adj_894), .SP(reset_counter_usec_7__N_292), 
            .CD(n3605), .CK(clk), .Q(reset_counter_usec[4])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045__i4.GSR = "DISABLED";
    FD1P3IX reset_counter_usec_1045__i5 (.D(n40_adj_893), .SP(reset_counter_usec_7__N_292), 
            .CD(n3605), .CK(clk), .Q(reset_counter_usec[5])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045__i5.GSR = "DISABLED";
    FD1P3IX reset_counter_usec_1045__i6 (.D(n39), .SP(reset_counter_usec_7__N_292), 
            .CD(n3605), .CK(clk), .Q(reset_counter_usec[6])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045__i6.GSR = "DISABLED";
    FD1P3IX reset_counter_usec_1045__i7 (.D(n38_adj_899), .SP(reset_counter_usec_7__N_292), 
            .CD(n3605), .CK(clk), .Q(reset_counter_usec[7])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045__i7.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i27 (.D(memory_in[27]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[27]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i27.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i26 (.D(memory_in[26]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[26]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i26.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i25 (.D(memory_in[25]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[25]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i25.GSR = "DISABLED";
    FD1P3AX interrupt_buf_i0_i1 (.D(interrupt_buf[0]), .SP(clk_enable_251), 
            .CK(clk), .Q(interrupt_buf[1]));   // d:/git/jojo_endat/encodertop.vhd(156[4] 188[11])
    defparam interrupt_buf_i0_i1.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i24 (.D(memory_in[24]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[24]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i24.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i23 (.D(memory_in[23]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[23]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i23.GSR = "DISABLED";
    LUT4 memory_out_buf_31__I_86_4_lut (.A(memory_out_buf_31__N_171), .B(mcu_settings1[10]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_169)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_86_4_lut.init = 16'hc0ca;
    FD1P3AX dummy_register_i0_i22 (.D(memory_in[22]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[22]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i22.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i21 (.D(memory_in[21]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[21]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i21.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i20 (.D(memory_in[20]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[20]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i20.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i19 (.D(memory_in[19]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[19]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i19.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i18 (.D(memory_in[18]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[18]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i18.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i17 (.D(memory_in[17]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[17]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i17.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i16 (.D(memory_in[16]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[16]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i16.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i15 (.D(memory_in[15]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[15]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i15.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i14 (.D(memory_in[14]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[14]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i14.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i13 (.D(memory_in[13]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[13]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i13.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i12 (.D(memory_in[12]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[12]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i12.GSR = "DISABLED";
    LUT4 i4163_4_lut (.A(n83), .B(n5931), .C(usec_interrupt_counter[7]), 
         .D(n103), .Z(n5386)) /* synthesis lut_function=(!(A (B)+!A (B+!(C+!(D))))) */ ;
    defparam i4163_4_lut.init = 16'h3233;
    LUT4 memory_out_buf_31__I_70_4_lut (.A(memory_out_buf_31__N_151), .B(mcu_settings1[14]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_149)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_70_4_lut.init = 16'hc0ca;
    LUT4 i3_4_lut (.A(interrupt_counter[9]), .B(interrupt_counter[0]), .C(n5271), 
         .D(n23), .Z(n101)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;
    defparam i3_4_lut.init = 16'h0800;
    FD1P3IX reset_counter_usec_1045__i0 (.D(n45_adj_892), .SP(reset_counter_usec_7__N_292), 
            .CD(n3605), .CK(clk), .Q(reset_counter_usec[0])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045__i0.GSR = "DISABLED";
    IB led7_c_pad (.I(endat_rx), .O(led7_c_c));   // d:/git/jojo_endat/encodertop.vhd(20[5:13])
    IB spare6_c_pad (.I(spi_scs), .O(spare6_c_c));   // d:/git/jojo_endat/encodertop.vhd(16[24:31])
    IB spi_mosi_pad (.I(spi_mosi), .O(spi_mosi_c));   // d:/git/jojo_endat/encodertop.vhd(16[14:22])
    IB spi_sck_pad (.I(spi_sck), .O(spi_sck_c));   // d:/git/jojo_endat/encodertop.vhd(16[5:12])
    IB interrupt_pad (.I(interrupt), .O(interrupt_c));   // d:/git/jojo_endat/encodertop.vhd(14[16:25])
    IB clki_pad (.I(clki), .O(clki_c));   // d:/git/jojo_endat/encodertop.vhd(14[10:14])
    OB spare6_pad (.I(spare6_c_c), .O(spare6));   // d:/git/jojo_endat/encodertop.vhd(23[45:51])
    FD1P3AX dummy_register_i0_i11 (.D(memory_in[11]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[11]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i11.GSR = "DISABLED";
    LUT4 memory_out_buf_31__I_72_4_lut (.A(endat_position[14]), .B(endat_position[5]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_151)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+!(D))+!B !(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_72_4_lut.init = 16'hcacf;
    FD1P3AX dummy_register_i0_i10 (.D(memory_in[10]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[10]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i10.GSR = "DISABLED";
    FD1P3AX dummy_register_i0_i9 (.D(memory_in[9]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[9]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i9.GSR = "DISABLED";
    LUT4 i4_4_lut (.A(usec_interrupt_counter[6]), .B(usec_interrupt_counter[1]), 
         .C(usec_interrupt_counter[0]), .D(n6_adj_897), .Z(n83)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(48[9:31])
    defparam i4_4_lut.init = 16'hfffe;
    GSR GSR_INST (.GSR(clk_enable_251));
    LUT4 i1_2_lut (.A(usec_interrupt_counter[5]), .B(usec_interrupt_counter[2]), 
         .Z(n6_adj_897)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/encodertop.vhd(48[9:31])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 memory_out_buf_31__I_66_4_lut (.A(memory_out_buf_31__N_146), .B(mcu_settings1[15]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_144)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_66_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_68_4_lut (.A(endat_position[15]), .B(endat_position[6]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_146)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_68_4_lut.init = 16'hcac0;
    FD1P3AX dummy_register_i0_i8 (.D(memory_in[8]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[8]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i8.GSR = "DISABLED";
    LUT4 memory_out_buf_31__I_62_4_lut (.A(memory_out_buf_31__N_141), .B(mcu_settings1[16]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_139)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_62_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_64_4_lut (.A(endat_position[16]), .B(endat_position[7]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_141)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+!(D))+!B !(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_64_4_lut.init = 16'hcacf;
    LUT4 memory_out_buf_31__I_58_4_lut (.A(memory_out_buf_31__N_136), .B(mcu_settings1[17]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_134)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_58_4_lut.init = 16'hcfca;
    FD1P3AX dummy_register_i0_i7 (.D(memory_in[7]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[7]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i7.GSR = "DISABLED";
    LUT4 memory_out_buf_31__I_60_4_lut (.A(endat_position[17]), .B(endat_position[8]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_136)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+!(D))+!B !(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_60_4_lut.init = 16'hcacf;
    FD1P3AX dummy_register_i0_i6 (.D(memory_in[6]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[6]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i6.GSR = "DISABLED";
    LUT4 memory_out_buf_31__I_54_4_lut (.A(memory_out_buf_31__N_131), .B(mcu_settings1[18]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_129)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_54_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_56_4_lut (.A(endat_position[18]), .B(endat_position[9]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_131)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_56_4_lut.init = 16'hcac0;
    FD1P3AX dummy_register_i0_i5 (.D(memory_in[5]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[5]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i5.GSR = "DISABLED";
    LUT4 i1_2_lut_adj_146 (.A(usec_interrupt_counter[3]), .B(usec_interrupt_counter[4]), 
         .Z(n103)) /* synthesis lut_function=(A (B)) */ ;   // d:/git/jojo_endat/encodertop.vhd(48[9:31])
    defparam i1_2_lut_adj_146.init = 16'h8888;
    LUT4 memory_out_buf_31__I_50_4_lut (.A(memory_out_buf_31__N_126), .B(mcu_settings1[19]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_124)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_50_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_52_4_lut (.A(endat_position[19]), .B(endat_position[10]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_126)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_52_4_lut.init = 16'hcac0;
    LUT4 memory_out_buf_31__I_46_4_lut (.A(memory_out_buf_31__N_121), .B(mcu_settings1[20]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_119)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_46_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_48_4_lut (.A(endat_position[20]), .B(endat_position[11]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_121)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_48_4_lut.init = 16'hcac0;
    FD1P3AX dummy_register_i0_i4 (.D(memory_in[4]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[4]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i4.GSR = "DISABLED";
    LUT4 memory_out_buf_31__I_42_4_lut (.A(memory_out_buf_31__N_116), .B(mcu_settings1[21]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_114)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_42_4_lut.init = 16'hcfca;
    LUT4 memory_out_buf_31__I_44_4_lut (.A(endat_position[21]), .B(endat_position[12]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_116)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+!(D))+!B !(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_44_4_lut.init = 16'hcacf;
    LUT4 memory_out_buf_31__I_38_4_lut (.A(memory_out_buf_31__N_111), .B(mcu_settings1[22]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_109)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_38_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_40_4_lut (.A(endat_position[22]), .B(endat_position[13]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_111)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_40_4_lut.init = 16'hcac0;
    LUT4 memory_out_buf_31__I_34_4_lut (.A(memory_out_buf_31__N_106), .B(mcu_settings1[23]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_104)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_34_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_36_4_lut (.A(endat_position[23]), .B(endat_position[14]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_106)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_36_4_lut.init = 16'hcac0;
    FD1P3AX dummy_register_i0_i3 (.D(memory_in[3]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[3]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i3.GSR = "DISABLED";
    LUT4 memory_out_buf_31__I_30_4_lut (.A(memory_out_buf_31__N_101), .B(mcu_settings1[24]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_99)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_30_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_32_4_lut (.A(endat_position[24]), .B(endat_position[15]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_101)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+!(D))+!B !(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_32_4_lut.init = 16'hcacf;
    LUT4 memory_out_buf_31__I_26_4_lut (.A(memory_out_buf_31__N_96), .B(mcu_settings1[25]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_94)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_26_4_lut.init = 16'hcfca;
    FD1P3AX dummy_register_i0_i2 (.D(memory_in[2]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[2]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i2.GSR = "DISABLED";
    LUT4 memory_out_buf_31__I_28_4_lut (.A(endat_position[25]), .B(endat_position[16]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_96)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_28_4_lut.init = 16'hcac0;
    LUT4 memory_out_buf_31__I_22_4_lut (.A(memory_out_buf_31__N_91), .B(mcu_settings1[26]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_89)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_22_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_24_4_lut (.A(endat_position[26]), .B(endat_position[17]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_91)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_24_4_lut.init = 16'hcac0;
    LUT4 memory_out_buf_31__I_18_4_lut (.A(memory_out_buf_31__N_86), .B(mcu_settings1[27]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_84)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_18_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_20_4_lut (.A(endat_position[27]), .B(endat_position[18]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_86)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_20_4_lut.init = 16'hcac0;
    FD1P3AX dummy_register_i0_i1 (.D(memory_in[1]), .SP(clk_enable_247), 
            .CK(clk), .Q(dummy_register[1]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam dummy_register_i0_i1.GSR = "DISABLED";
    LUT4 memory_out_buf_31__I_14_4_lut (.A(memory_out_buf_31__N_81), .B(mcu_settings1[28]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_79)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_14_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_16_4_lut (.A(endat_position[28]), .B(endat_position[19]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_81)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_16_4_lut.init = 16'hcac0;
    LUT4 memory_out_buf_31__I_10_4_lut (.A(memory_out_buf_31__N_76), .B(mcu_settings1[29]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_74)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_10_4_lut.init = 16'hcfca;
    LUT4 memory_out_buf_31__I_12_4_lut (.A(endat_position[29]), .B(endat_position[20]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_76)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_12_4_lut.init = 16'hcac0;
    LUT4 memory_out_buf_31__I_6_4_lut (.A(memory_out_buf_31__N_71), .B(mcu_settings1[30]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_69)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_6_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_8_4_lut (.A(endat_position[30]), .B(endat_position[21]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_71)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_8_4_lut.init = 16'hcac0;
    LUT4 memory_out_buf_31__I_2_4_lut (.A(memory_out_buf_31__N_56), .B(mcu_settings1[31]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_54)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_2_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_4_4_lut (.A(endat_position[31]), .B(endat_position[22]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_56)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_4_4_lut.init = 16'hcac0;
    LUT4 i3_4_lut_adj_147 (.A(clk_counter[4]), .B(n5913), .C(clk_counter[3]), 
         .D(n5900), .Z(n5323)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i3_4_lut_adj_147.init = 16'hffdf;
    CCU2D interrupt_counter_1047_add_4_17 (.A0(interrupt_counter[15]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5049), .S0(n70));   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047_add_4_17.INIT0 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_17.INIT1 = 16'h0000;
    defparam interrupt_counter_1047_add_4_17.INJECT1_0 = "NO";
    defparam interrupt_counter_1047_add_4_17.INJECT1_1 = "NO";
    CCU2D interrupt_counter_1047_add_4_15 (.A0(interrupt_counter[13]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(interrupt_counter[14]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5048), .COUT(n5049), .S0(n72), 
          .S1(n71));   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047_add_4_15.INIT0 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_15.INIT1 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_15.INJECT1_0 = "NO";
    defparam interrupt_counter_1047_add_4_15.INJECT1_1 = "NO";
    CCU2D interrupt_counter_1047_add_4_13 (.A0(interrupt_counter[11]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(interrupt_counter[12]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5047), .COUT(n5048), .S0(n74), 
          .S1(n73));   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047_add_4_13.INIT0 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_13.INIT1 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_13.INJECT1_0 = "NO";
    defparam interrupt_counter_1047_add_4_13.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_79 (.A(address_memory[2]), .B(n5273), .Z(n5904)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/encodertop.vhd(206[31:53])
    defparam i1_2_lut_rep_79.init = 16'heeee;
    LUT4 i1439_3_lut_rep_71_4_lut (.A(address_memory[2]), .B(n5273), .C(address_memory[1]), 
         .D(read_memory), .Z(n5896)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // d:/git/jojo_endat/encodertop.vhd(206[31:53])
    defparam i1439_3_lut_rep_71_4_lut.init = 16'h1000;
    LUT4 i17_2_lut (.A(led6_c), .B(modebits_buffer_7__N_828[2]), .Z(led6_N_422)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/git/jojo_endat/endat.vhd(36[9:24])
    defparam i17_2_lut.init = 16'h6666;
    CCU2D reset_counter_usec_1045_add_4_9 (.A0(reset_counter_usec[7]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5062), .S0(n38_adj_899));   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045_add_4_9.INIT0 = 16'hfaaa;
    defparam reset_counter_usec_1045_add_4_9.INIT1 = 16'h0000;
    defparam reset_counter_usec_1045_add_4_9.INJECT1_0 = "NO";
    defparam reset_counter_usec_1045_add_4_9.INJECT1_1 = "NO";
    LUT4 i1_4_lut (.A(n5360), .B(n5931), .C(n5281), .D(usec_interrupt_counter[7]), 
         .Z(clk_enable_131)) /* synthesis lut_function=(A (B)+!A (B+!((D)+!C))) */ ;
    defparam i1_4_lut.init = 16'hccdc;
    LUT4 i3874_2_lut (.A(usec_interrupt_counter[4]), .B(usec_interrupt_counter[3]), 
         .Z(n5360)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i3874_2_lut.init = 16'heeee;
    LUT4 i2235_4_lut (.A(clk_enable_131), .B(n5299), .C(n5931), .D(n85), 
         .Z(n3696)) /* synthesis lut_function=(A ((C+!(D))+!B)) */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam i2235_4_lut.init = 16'ha2aa;
    LUT4 i1_4_lut_adj_148 (.A(n5271), .B(n23), .C(interrupt_counter[0]), 
         .D(interrupt_counter[9]), .Z(n85)) /* synthesis lut_function=(A+!(B (C (D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam i1_4_lut_adj_148.init = 16'hbfff;
    LUT4 i4_4_lut_adj_149 (.A(n7_adj_890), .B(usec_interrupt_counter[0]), 
         .C(usec_interrupt_counter[1]), .D(usec_interrupt_counter[2]), .Z(n5281)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;
    defparam i4_4_lut_adj_149.init = 16'h0080;
    LUT4 i2_2_lut (.A(usec_interrupt_counter[6]), .B(usec_interrupt_counter[5]), 
         .Z(n7_adj_890)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut.init = 16'h8888;
    LUT4 i8_4_lut (.A(n15), .B(interrupt_counter[12]), .C(n14), .D(interrupt_counter[4]), 
         .Z(n5271)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam i8_4_lut.init = 16'hfffe;
    LUT4 i6_4_lut (.A(interrupt_counter[13]), .B(interrupt_counter[11]), 
         .C(interrupt_counter[10]), .D(interrupt_counter[15]), .Z(n15)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam i6_4_lut.init = 16'hfffe;
    LUT4 i5_3_lut (.A(n5391), .B(interrupt_counter[3]), .C(interrupt_counter[14]), 
         .Z(n14)) /* synthesis lut_function=((B+(C))+!A) */ ;   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam i5_3_lut.init = 16'hfdfd;
    LUT4 i3903_4_lut (.A(interrupt_counter[7]), .B(interrupt_counter[1]), 
         .C(interrupt_counter[2]), .D(interrupt_counter[6]), .Z(n5391)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3903_4_lut.init = 16'h8000;
    LUT4 i41_2_lut (.A(interrupt_counter[5]), .B(interrupt_counter[8]), 
         .Z(n23)) /* synthesis lut_function=(A (B)) */ ;
    defparam i41_2_lut.init = 16'h8888;
    LUT4 i1_4_lut_adj_150 (.A(n5281), .B(usec_interrupt_counter[3]), .C(usec_interrupt_counter[4]), 
         .D(usec_interrupt_counter[7]), .Z(n5299)) /* synthesis lut_function=(!((B+(C+(D)))+!A)) */ ;
    defparam i1_4_lut_adj_150.init = 16'h0002;
    CCU2D reset_counter_usec_1045_add_4_7 (.A0(reset_counter_usec[5]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(reset_counter_usec[6]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5061), .COUT(n5062), .S0(n40_adj_893), 
          .S1(n39));   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045_add_4_7.INIT0 = 16'hfaaa;
    defparam reset_counter_usec_1045_add_4_7.INIT1 = 16'hfaaa;
    defparam reset_counter_usec_1045_add_4_7.INJECT1_0 = "NO";
    defparam reset_counter_usec_1045_add_4_7.INJECT1_1 = "NO";
    FD1P3IX usec_interrupt_counter_1049__i0 (.D(n45), .SP(clk_enable_248), 
            .CD(n5931), .CK(clk), .Q(usec_interrupt_counter[0])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049__i0.GSR = "ENABLED";
    FD1S3AX memory_out_i31 (.D(memory_out_buf[31]), .CK(clk), .Q(memory_out[31]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i31.GSR = "ENABLED";
    LUT4 i1_4_lut_adj_151 (.A(n19), .B(n5912), .C(n17), .D(n18), .Z(n2955)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut_adj_151.init = 16'heccc;
    LUT4 i3984_4_lut (.A(reset_counter[7]), .B(reset_counter[9]), .C(reset_counter[8]), 
         .D(n5075), .Z(reset_counter_usec_7__N_292)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;
    defparam i3984_4_lut.init = 16'h0001;
    LUT4 i2_4_lut (.A(reset_counter[2]), .B(n4_adj_891), .C(n6), .D(reset_counter[3]), 
         .Z(n5075)) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(37[9:22])
    defparam i2_4_lut.init = 16'hccc8;
    CCU2D interrupt_counter_1047_add_4_11 (.A0(interrupt_counter[9]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(interrupt_counter[10]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5046), .COUT(n5047), .S0(n76), 
          .S1(n75));   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047_add_4_11.INIT0 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_11.INIT1 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_11.INJECT1_0 = "NO";
    defparam interrupt_counter_1047_add_4_11.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_152 (.A(reset_counter[6]), .B(reset_counter[5]), .Z(n4_adj_891)) /* synthesis lut_function=(A (B)) */ ;   // d:/git/jojo_endat/encodertop.vhd(37[9:22])
    defparam i1_2_lut_adj_152.init = 16'h8888;
    LUT4 i2_3_lut (.A(reset_counter[1]), .B(reset_counter[4]), .C(reset_counter[0]), 
         .Z(n6)) /* synthesis lut_function=(A (B+(C))+!A (B)) */ ;   // d:/git/jojo_endat/encodertop.vhd(37[9:22])
    defparam i2_3_lut.init = 16'hecec;
    CCU2D reset_counter_usec_1045_add_4_5 (.A0(reset_counter_usec[3]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(reset_counter_usec[4]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5060), .COUT(n5061), .S0(n42_adj_895), 
          .S1(n41_adj_894));   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045_add_4_5.INIT0 = 16'hfaaa;
    defparam reset_counter_usec_1045_add_4_5.INIT1 = 16'hfaaa;
    defparam reset_counter_usec_1045_add_4_5.INJECT1_0 = "NO";
    defparam reset_counter_usec_1045_add_4_5.INJECT1_1 = "NO";
    CCU2D interrupt_counter_1047_add_4_9 (.A0(interrupt_counter[7]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(interrupt_counter[8]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5045), .COUT(n5046), .S0(n78), 
          .S1(n77));   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047_add_4_9.INIT0 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_9.INIT1 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_9.INJECT1_0 = "NO";
    defparam interrupt_counter_1047_add_4_9.INJECT1_1 = "NO";
    CCU2D reset_counter_usec_1045_add_4_3 (.A0(reset_counter_usec[1]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(reset_counter_usec[2]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5059), .COUT(n5060), .S0(n44_adj_898), 
          .S1(n43_adj_896));   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045_add_4_3.INIT0 = 16'hfaaa;
    defparam reset_counter_usec_1045_add_4_3.INIT1 = 16'hfaaa;
    defparam reset_counter_usec_1045_add_4_3.INJECT1_0 = "NO";
    defparam reset_counter_usec_1045_add_4_3.INJECT1_1 = "NO";
    LUT4 i3_4_lut_adj_153 (.A(address_memory[3]), .B(address_memory[5]), 
         .C(address_memory[4]), .D(address_memory[6]), .Z(n5273)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(206[31:53])
    defparam i3_4_lut_adj_153.init = 16'hfffe;
    CCU2D reset_counter_usec_1045_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(reset_counter_usec[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n5059), .S1(n45_adj_892));   // d:/git/jojo_endat/encodertop.vhd(146[29:47])
    defparam reset_counter_usec_1045_add_4_1.INIT0 = 16'hF000;
    defparam reset_counter_usec_1045_add_4_1.INIT1 = 16'h0555;
    defparam reset_counter_usec_1045_add_4_1.INJECT1_0 = "NO";
    defparam reset_counter_usec_1045_add_4_1.INJECT1_1 = "NO";
    CCU2D usec_interrupt_counter_1049_add_4_9 (.A0(usec_interrupt_counter[7]), 
          .B0(GND_net), .C0(GND_net), .D0(GND_net), .A1(GND_net), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5058), .S0(n38));   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049_add_4_9.INIT0 = 16'hfaaa;
    defparam usec_interrupt_counter_1049_add_4_9.INIT1 = 16'h0000;
    defparam usec_interrupt_counter_1049_add_4_9.INJECT1_0 = "NO";
    defparam usec_interrupt_counter_1049_add_4_9.INJECT1_1 = "NO";
    FD1S3AX memory_out_i30 (.D(memory_out_buf[30]), .CK(clk), .Q(memory_out[30]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i30.GSR = "ENABLED";
    FD1S3AX memory_out_i29 (.D(memory_out_buf[29]), .CK(clk), .Q(memory_out[29]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i29.GSR = "ENABLED";
    FD1S3AX memory_out_i28 (.D(memory_out_buf[28]), .CK(clk), .Q(memory_out[28]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i28.GSR = "ENABLED";
    FD1S3AX memory_out_i27 (.D(memory_out_buf[27]), .CK(clk), .Q(memory_out[27]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i27.GSR = "ENABLED";
    FD1S3AX memory_out_i26 (.D(memory_out_buf[26]), .CK(clk), .Q(memory_out[26]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i26.GSR = "ENABLED";
    FD1S3AX memory_out_i25 (.D(memory_out_buf[25]), .CK(clk), .Q(memory_out[25]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i25.GSR = "ENABLED";
    FD1S3AX memory_out_i24 (.D(memory_out_buf[24]), .CK(clk), .Q(memory_out[24]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i24.GSR = "ENABLED";
    FD1S3AX memory_out_i23 (.D(memory_out_buf[23]), .CK(clk), .Q(memory_out[23]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i23.GSR = "ENABLED";
    FD1S3AX memory_out_i22 (.D(memory_out_buf[22]), .CK(clk), .Q(memory_out[22]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i22.GSR = "ENABLED";
    CCU2D interrupt_counter_1047_add_4_7 (.A0(interrupt_counter[5]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(interrupt_counter[6]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5044), .COUT(n5045), .S0(n80), 
          .S1(n79));   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047_add_4_7.INIT0 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_7.INIT1 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_7.INJECT1_0 = "NO";
    defparam interrupt_counter_1047_add_4_7.INJECT1_1 = "NO";
    CCU2D interrupt_counter_1047_add_4_5 (.A0(interrupt_counter[3]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(interrupt_counter[4]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5043), .COUT(n5044), .S0(n82), 
          .S1(n81));   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047_add_4_5.INIT0 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_5.INIT1 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_5.INJECT1_0 = "NO";
    defparam interrupt_counter_1047_add_4_5.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_88 (.A(clk_counter[0]), .B(clk_counter[5]), .Z(n5913)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i1_2_lut_rep_88.init = 16'heeee;
    LUT4 i3_3_lut_4_lut (.A(clk_counter[0]), .B(clk_counter[5]), .C(clk_counter[3]), 
         .D(n5900), .Z(n8)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i3_3_lut_4_lut.init = 16'h0010;
    LUT4 i1_2_lut_3_lut (.A(clk_counter[0]), .B(clk_counter[5]), .C(clk_counter[4]), 
         .Z(n4)) /* synthesis lut_function=(A+(B+(C))) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i1_2_lut_3_lut.init = 16'hfefe;
    FD1S3AX memory_out_i21 (.D(memory_out_buf[21]), .CK(clk), .Q(memory_out[21]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i21.GSR = "ENABLED";
    FD1S3AX memory_out_i20 (.D(memory_out_buf[20]), .CK(clk), .Q(memory_out[20]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i20.GSR = "ENABLED";
    FD1S3AX memory_out_i19 (.D(memory_out_buf[19]), .CK(clk), .Q(memory_out[19]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i19.GSR = "ENABLED";
    FD1S3AX memory_out_i18 (.D(memory_out_buf[18]), .CK(clk), .Q(memory_out[18]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i18.GSR = "ENABLED";
    FD1S3AX memory_out_i17 (.D(memory_out_buf[17]), .CK(clk), .Q(memory_out[17]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i17.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_90 (.A(clk_counter[7]), .B(clk_counter[1]), .Z(n5915)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i1_2_lut_rep_90.init = 16'heeee;
    LUT4 memory_out_buf_31__I_90_4_lut (.A(memory_out_buf_31__N_176), .B(mcu_settings1[9]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_174)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_90_4_lut.init = 16'hcfca;
    LUT4 i3895_3_lut_rep_75_4_lut (.A(clk_counter[7]), .B(clk_counter[1]), 
         .C(clk_counter[6]), .D(clk_counter[2]), .Z(n5900)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i3895_3_lut_rep_75_4_lut.init = 16'hfffe;
    FD1S3AX memory_out_i16 (.D(memory_out_buf[16]), .CK(clk), .Q(memory_out[16]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i16.GSR = "ENABLED";
    FD1S3AX memory_out_i15 (.D(memory_out_buf[15]), .CK(clk), .Q(memory_out[15]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i15.GSR = "ENABLED";
    LUT4 i2_4_lut_adj_154 (.A(address_memory[0]), .B(read_memory), .C(address_memory[1]), 
         .D(n5273), .Z(n5278)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;
    defparam i2_4_lut_adj_154.init = 16'h0004;
    FD1S3AX memory_out_i14 (.D(memory_out_buf[14]), .CK(clk), .Q(memory_out[14]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i14.GSR = "ENABLED";
    LUT4 memory_out_buf_31__I_122_4_lut (.A(memory_out_buf_31__N_216), .B(mcu_settings1[1]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_214)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_122_4_lut.init = 16'hcfca;
    LUT4 memory_out_buf_31__I_92_4_lut (.A(endat_position[9]), .B(endat_position[0]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_176)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_92_4_lut.init = 16'hcac0;
    LUT4 memory_out_buf_31__I_118_4_lut (.A(memory_out_buf_31__N_212), .B(mcu_settings1[2]), 
         .C(memory_out_buf_31__N_64), .D(n5896), .Z(memory_out_buf_31__N_209)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_118_4_lut.init = 16'hc0ca;
    TSALL TSALL_INST (.TSALL(GND_net));
    LUT4 memory_out_buf_31__I_114_4_lut (.A(endat_position[3]), .B(mcu_settings1[3]), 
         .C(memory_out_buf_31__N_64), .D(n3130), .Z(memory_out_buf_31__N_204)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_114_4_lut.init = 16'hcac0;
    LUT4 m1_lut (.Z(n6224)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    LUT4 memory_out_buf_31__I_88_4_lut (.A(endat_position[10]), .B(endat_position[1]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_171)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+!(D))+!B !(C+(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_88_4_lut.init = 16'hcacf;
    CCU2D usec_interrupt_counter_1049_add_4_7 (.A0(usec_interrupt_counter[5]), 
          .B0(GND_net), .C0(GND_net), .D0(GND_net), .A1(usec_interrupt_counter[6]), 
          .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n5057), .COUT(n5058), 
          .S0(n40), .S1(n39_adj_889));   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049_add_4_7.INIT0 = 16'hfaaa;
    defparam usec_interrupt_counter_1049_add_4_7.INIT1 = 16'hfaaa;
    defparam usec_interrupt_counter_1049_add_4_7.INJECT1_0 = "NO";
    defparam usec_interrupt_counter_1049_add_4_7.INJECT1_1 = "NO";
    LUT4 i843_1_lut_rep_100 (.A(reset), .Z(clk_enable_251)) /* synthesis lut_function=(!(A)) */ ;   // d:/git/jojo_endat/encodertop.vhd(139[4] 151[11])
    defparam i843_1_lut_rep_100.init = 16'h5555;
    LUT4 i2_3_lut_3_lut (.A(reset), .B(n1546), .C(n5899), .Z(clk_enable_235)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;   // d:/git/jojo_endat/encodertop.vhd(139[4] 151[11])
    defparam i2_3_lut_3_lut.init = 16'h0404;
    FD1S3AX memory_out_i13 (.D(memory_out_buf[13]), .CK(clk), .Q(memory_out[13]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i13.GSR = "ENABLED";
    FD1S3AX memory_out_i12 (.D(memory_out_buf[12]), .CK(clk), .Q(memory_out[12]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i12.GSR = "ENABLED";
    FD1S3AX memory_out_i11 (.D(memory_out_buf[11]), .CK(clk), .Q(memory_out[11]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i11.GSR = "ENABLED";
    LUT4 i1_2_lut_2_lut (.A(reset), .B(write_memory), .Z(n5296)) /* synthesis lut_function=(!(A+!(B))) */ ;   // d:/git/jojo_endat/encodertop.vhd(139[4] 151[11])
    defparam i1_2_lut_2_lut.init = 16'h4444;
    LUT4 memory_out_buf_31__I_82_4_lut (.A(memory_out_buf_31__N_166), .B(mcu_settings1[11]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_164)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_82_4_lut.init = 16'hc0ca;
    FD1S3AX memory_out_i10 (.D(memory_out_buf[10]), .CK(clk), .Q(memory_out[10]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i10.GSR = "ENABLED";
    FD1S3AX memory_out_i9 (.D(memory_out_buf[9]), .CK(clk), .Q(memory_out[9]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i9.GSR = "ENABLED";
    LUT4 i2_4_lut_adj_155 (.A(n83), .B(usec_interrupt_counter[7]), .C(n5931), 
         .D(n103), .Z(clk_enable_248)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;
    defparam i2_4_lut_adj_155.init = 16'hfeff;
    LUT4 memory_out_buf_31__I_110_4_lut (.A(endat_position[4]), .B(mcu_settings1[4]), 
         .C(memory_out_buf_31__N_64), .D(n3130), .Z(memory_out_buf_31__N_199)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_110_4_lut.init = 16'hcac0;
    LUT4 i3989_4_lut (.A(reset_counter_usec_7__N_292), .B(reset_counter_usec[7]), 
         .C(reset_counter_usec[3]), .D(n5269), .Z(n3605)) /* synthesis lut_function=(!((B+(C+(D)))+!A)) */ ;
    defparam i3989_4_lut.init = 16'h0002;
    FD1S3AX memory_out_i8 (.D(memory_out_buf[8]), .CK(clk), .Q(memory_out[8]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i8.GSR = "ENABLED";
    LUT4 memory_out_buf_31__I_106_4_lut (.A(memory_out_buf_31__N_196), .B(mcu_settings1[5]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_194)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_106_4_lut.init = 16'hcfca;
    FD1S3AX memory_out_i7 (.D(memory_out_buf[7]), .CK(clk), .Q(memory_out[7]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i7.GSR = "ENABLED";
    FD1S3AX memory_out_i6 (.D(memory_out_buf[6]), .CK(clk), .Q(memory_out[6]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i6.GSR = "ENABLED";
    FD1S3AX memory_out_i5 (.D(memory_out_buf[5]), .CK(clk), .Q(memory_out[5]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i5.GSR = "ENABLED";
    LUT4 i2_3_lut_adj_156 (.A(reset_counter_usec[2]), .B(n5079), .C(reset_counter_usec[4]), 
         .Z(n5269)) /* synthesis lut_function=(A+((C)+!B)) */ ;   // d:/git/jojo_endat/encodertop.vhd(142[9:32])
    defparam i2_3_lut_adj_156.init = 16'hfbfb;
    LUT4 i3_4_lut_adj_157 (.A(reset_counter_usec[0]), .B(reset_counter_usec[1]), 
         .C(reset_counter_usec[6]), .D(reset_counter_usec[5]), .Z(n5079)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut_adj_157.init = 16'h8000;
    FD1S3AX memory_out_i4 (.D(memory_out_buf[4]), .CK(clk), .Q(memory_out[4]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i4.GSR = "ENABLED";
    FD1S3AX memory_out_i3 (.D(memory_out_buf[3]), .CK(clk), .Q(memory_out[3]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i3.GSR = "ENABLED";
    FD1S3AX memory_out_i2 (.D(memory_out_buf[2]), .CK(clk), .Q(memory_out[2]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i2.GSR = "ENABLED";
    LUT4 i2_2_lut_adj_158 (.A(reset_counter_usec[3]), .B(reset_counter_usec[7]), 
         .Z(n7)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/encodertop.vhd(142[9:32])
    defparam i2_2_lut_adj_158.init = 16'heeee;
    FD1S3AX memory_out_i1 (.D(memory_out_buf[1]), .CK(clk), .Q(memory_out[1]));   // d:/git/jojo_endat/encodertop.vhd(194[4] 207[11])
    defparam memory_out_i1.GSR = "ENABLED";
    LUT4 memory_out_buf_31__I_102_4_lut (.A(memory_out_buf_31__N_192), .B(mcu_settings1[6]), 
         .C(memory_out_buf_31__N_64), .D(n5896), .Z(memory_out_buf_31__N_189)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_102_4_lut.init = 16'hc0ca;
    LUT4 i1_2_lut_rep_106 (.A(interrupt_buf[0]), .B(interrupt_buf[1]), .Z(n5931)) /* synthesis lut_function=(!(A+!(B))) */ ;   // d:/git/jojo_endat/encodertop.vhd(156[4] 188[11])
    defparam i1_2_lut_rep_106.init = 16'h4444;
    LUT4 i1_3_lut_4_lut (.A(interrupt_buf[0]), .B(interrupt_buf[1]), .C(n5299), 
         .D(n101), .Z(n2482)) /* synthesis lut_function=(A (C (D))+!A (B+(C (D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(156[4] 188[11])
    defparam i1_3_lut_4_lut.init = 16'hf444;
    LUT4 memory_out_buf_31__I_84_4_lut (.A(endat_position[11]), .B(endat_position[2]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_166)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_84_4_lut.init = 16'hcac0;
    CCU2D usec_interrupt_counter_1049_add_4_5 (.A0(usec_interrupt_counter[3]), 
          .B0(GND_net), .C0(GND_net), .D0(GND_net), .A1(usec_interrupt_counter[4]), 
          .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n5056), .COUT(n5057), 
          .S0(n42), .S1(n41));   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049_add_4_5.INIT0 = 16'hfaaa;
    defparam usec_interrupt_counter_1049_add_4_5.INIT1 = 16'hfaaa;
    defparam usec_interrupt_counter_1049_add_4_5.INJECT1_0 = "NO";
    defparam usec_interrupt_counter_1049_add_4_5.INJECT1_1 = "NO";
    LUT4 memory_out_buf_31__I_98_4_lut (.A(endat_position[7]), .B(mcu_settings1[7]), 
         .C(memory_out_buf_31__N_64), .D(n3130), .Z(memory_out_buf_31__N_184)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_98_4_lut.init = 16'hcac0;
    LUT4 i1_2_lut_4_lut (.A(read_memory), .B(address_memory[1]), .C(n5904), 
         .D(n5897), .Z(n3130)) /* synthesis lut_function=(A (B (C (D))+!B (D))+!A (D)) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 217[72])
    defparam i1_2_lut_4_lut.init = 16'hf700;
    LUT4 memory_out_buf_31__I_97_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[7]), .D(memory_out_buf_31__N_184), .Z(memory_out_buf_31__N_183)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_97_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_101_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[6]), .D(memory_out_buf_31__N_189), .Z(memory_out_buf_31__N_188)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_101_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_78_4_lut (.A(memory_out_buf_31__N_161), .B(mcu_settings1[12]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_159)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_78_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_80_4_lut (.A(endat_position[12]), .B(endat_position[3]), 
         .C(memory_out_buf_31__N_60), .D(n5897), .Z(memory_out_buf_31__N_161)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 219[104])
    defparam memory_out_buf_31__I_80_4_lut.init = 16'hcac0;
    LUT4 memory_out_buf_31__I_94_4_lut (.A(memory_out_buf_31__N_182), .B(mcu_settings1[8]), 
         .C(memory_out_buf_31__N_64), .D(n5896), .Z(memory_out_buf_31__N_179)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_94_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_121_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[1]), .D(memory_out_buf_31__N_214), .Z(memory_out_buf_31__N_213)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_121_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_113_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[3]), .D(memory_out_buf_31__N_204), .Z(memory_out_buf_31__N_203)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_113_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_109_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[4]), .D(memory_out_buf_31__N_199), .Z(memory_out_buf_31__N_198)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_109_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_126_4_lut (.A(memory_out_buf_31__N_222), .B(mcu_settings1[0]), 
         .C(memory_out_buf_31__N_64), .D(n5896), .Z(memory_out_buf_31__N_219)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_126_4_lut.init = 16'hc0ca;
    LUT4 memory_out_buf_31__I_105_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[5]), .D(memory_out_buf_31__N_194), .Z(memory_out_buf_31__N_193)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_105_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_117_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[2]), .D(memory_out_buf_31__N_209), .Z(memory_out_buf_31__N_208)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_117_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_93_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[8]), .D(memory_out_buf_31__N_179), .Z(memory_out_buf_31__N_178)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_93_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_89_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[9]), .D(memory_out_buf_31__N_174), .Z(memory_out_buf_31__N_173)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_89_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_85_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[10]), .D(memory_out_buf_31__N_169), .Z(memory_out_buf_31__N_168)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_85_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_81_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[11]), .D(memory_out_buf_31__N_164), .Z(memory_out_buf_31__N_163)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_81_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_77_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[12]), .D(memory_out_buf_31__N_159), .Z(memory_out_buf_31__N_158)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_77_3_lut_4_lut.init = 16'hfb40;
    OB led7_pad (.I(led7_c_c), .O(led7));   // d:/git/jojo_endat/encodertop.vhd(22[11:15])
    LUT4 memory_out_buf_31__I_73_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[13]), .D(memory_out_buf_31__N_154), .Z(memory_out_buf_31__N_153)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_73_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_69_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[14]), .D(memory_out_buf_31__N_149), .Z(memory_out_buf_31__N_148)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_69_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_65_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[15]), .D(memory_out_buf_31__N_144), .Z(memory_out_buf_31__N_143)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_65_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_61_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[16]), .D(memory_out_buf_31__N_139), .Z(memory_out_buf_31__N_138)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_61_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_57_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[17]), .D(memory_out_buf_31__N_134), .Z(memory_out_buf_31__N_133)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_57_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_53_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[18]), .D(memory_out_buf_31__N_129), .Z(memory_out_buf_31__N_128)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_53_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_49_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[19]), .D(memory_out_buf_31__N_124), .Z(memory_out_buf_31__N_123)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_49_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_45_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[20]), .D(memory_out_buf_31__N_119), .Z(memory_out_buf_31__N_118)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_45_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_41_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[21]), .D(memory_out_buf_31__N_114), .Z(memory_out_buf_31__N_113)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_41_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_37_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[22]), .D(memory_out_buf_31__N_109), .Z(memory_out_buf_31__N_108)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_37_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_33_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[23]), .D(memory_out_buf_31__N_104), .Z(memory_out_buf_31__N_103)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_33_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_29_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[24]), .D(memory_out_buf_31__N_99), .Z(memory_out_buf_31__N_98)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_29_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_25_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[25]), .D(memory_out_buf_31__N_94), .Z(memory_out_buf_31__N_93)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_25_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_21_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[26]), .D(memory_out_buf_31__N_89), .Z(memory_out_buf_31__N_88)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_21_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_17_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[27]), .D(memory_out_buf_31__N_84), .Z(memory_out_buf_31__N_83)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_17_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_13_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[28]), .D(memory_out_buf_31__N_79), .Z(memory_out_buf_31__N_78)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_13_3_lut_4_lut.init = 16'hfb40;
    CCU2D interrupt_counter_1047_add_4_3 (.A0(interrupt_counter[1]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(interrupt_counter[2]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5042), .COUT(n5043), .S0(n84), 
          .S1(n83_adj_887));   // d:/git/jojo_endat/encodertop.vhd(176[27:44])
    defparam interrupt_counter_1047_add_4_3.INIT0 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_3.INIT1 = 16'hfaaa;
    defparam interrupt_counter_1047_add_4_3.INJECT1_0 = "NO";
    defparam interrupt_counter_1047_add_4_3.INJECT1_1 = "NO";
    OB spi_miso_pad (.I(spi_miso_c), .O(spi_miso));   // d:/git/jojo_endat/encodertop.vhd(17[5:13])
    LUT4 memory_out_buf_31__I_9_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[29]), .D(memory_out_buf_31__N_74), .Z(memory_out_buf_31__N_73)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_9_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_5_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[30]), .D(memory_out_buf_31__N_69), .Z(memory_out_buf_31__N_68)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_5_3_lut_4_lut.init = 16'hfb40;
    LUT4 memory_out_buf_31__I_1_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[31]), .D(memory_out_buf_31__N_54), .Z(memory_out_buf_31__N_53)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_1_3_lut_4_lut.init = 16'hfb40;
    CCU2D usec_interrupt_counter_1049_add_4_3 (.A0(usec_interrupt_counter[1]), 
          .B0(GND_net), .C0(GND_net), .D0(GND_net), .A1(usec_interrupt_counter[2]), 
          .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n5055), .COUT(n5056), 
          .S0(n44), .S1(n43));   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049_add_4_3.INIT0 = 16'hfaaa;
    defparam usec_interrupt_counter_1049_add_4_3.INIT1 = 16'hfaaa;
    defparam usec_interrupt_counter_1049_add_4_3.INJECT1_0 = "NO";
    defparam usec_interrupt_counter_1049_add_4_3.INJECT1_1 = "NO";
    CCU2D usec_interrupt_counter_1049_add_4_1 (.A0(GND_net), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(usec_interrupt_counter[0]), 
          .B1(GND_net), .C1(GND_net), .D1(GND_net), .COUT(n5055), .S1(n45));   // d:/git/jojo_endat/encodertop.vhd(182[32:54])
    defparam usec_interrupt_counter_1049_add_4_1.INIT0 = 16'hF000;
    defparam usec_interrupt_counter_1049_add_4_1.INIT1 = 16'h0555;
    defparam usec_interrupt_counter_1049_add_4_1.INJECT1_0 = "NO";
    defparam usec_interrupt_counter_1049_add_4_1.INJECT1_1 = "NO";
    LUT4 memory_out_buf_31__I_125_3_lut_4_lut (.A(address_memory[2]), .B(n5278), 
         .C(dummy_register[0]), .D(memory_out_buf_31__N_219), .Z(memory_out_buf_31__N_218)) /* synthesis lut_function=(A (D)+!A (B (C)+!B (D))) */ ;
    defparam memory_out_buf_31__I_125_3_lut_4_lut.init = 16'hfb40;
    LUT4 read_memory_I_0_580_2_lut_3_lut_4_lut (.A(address_memory[0]), .B(n5904), 
         .C(read_memory), .D(address_memory[1]), .Z(memory_out_buf_31__N_64)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[54:76])
    defparam read_memory_I_0_580_2_lut_3_lut_4_lut.init = 16'h0020;
    CCU2D reset_counter_1044_add_4_11 (.A0(reset_counter[9]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5054), .S0(n46));   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044_add_4_11.INIT0 = 16'hfaaa;
    defparam reset_counter_1044_add_4_11.INIT1 = 16'h0000;
    defparam reset_counter_1044_add_4_11.INJECT1_0 = "NO";
    defparam reset_counter_1044_add_4_11.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut_4_lut (.A(address_memory[0]), .B(n5904), .C(n5296), 
         .D(address_memory[1]), .Z(clk_enable_247)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[54:76])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h0020;
    LUT4 read_memory_I_0_576_3_lut_4_lut (.A(address_memory[0]), .B(n5904), 
         .C(address_memory[1]), .D(read_memory), .Z(memory_out_buf_31__N_60)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[54:76])
    defparam read_memory_I_0_576_3_lut_4_lut.init = 16'h2000;
    LUT4 i1_2_lut_rep_72 (.A(address_memory[2]), .B(n5278), .Z(n5897)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_72.init = 16'h8888;
    LUT4 i2828_2_lut_3_lut (.A(address_memory[2]), .B(n5278), .C(endat_position[8]), 
         .Z(memory_out_buf_31__N_182)) /* synthesis lut_function=(((C)+!B)+!A) */ ;
    defparam i2828_2_lut_3_lut.init = 16'hf7f7;
    CCU2D reset_counter_1044_add_4_9 (.A0(reset_counter[7]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(reset_counter[8]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5053), .COUT(n5054), .S0(n48), 
          .S1(n47));   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044_add_4_9.INIT0 = 16'hfaaa;
    defparam reset_counter_1044_add_4_9.INIT1 = 16'hfaaa;
    defparam reset_counter_1044_add_4_9.INJECT1_0 = "NO";
    defparam reset_counter_1044_add_4_9.INJECT1_1 = "NO";
    LUT4 i2829_2_lut_3_lut (.A(address_memory[2]), .B(n5278), .C(endat_position[6]), 
         .Z(memory_out_buf_31__N_192)) /* synthesis lut_function=(((C)+!B)+!A) */ ;
    defparam i2829_2_lut_3_lut.init = 16'hf7f7;
    LUT4 i2831_3_lut_4_lut (.A(address_memory[2]), .B(n5278), .C(memory_out_buf_31__N_60), 
         .D(endat_position[5]), .Z(memory_out_buf_31__N_196)) /* synthesis lut_function=(!(A (B (C+!(D))+!B (C))+!A (C))) */ ;
    defparam i2831_3_lut_4_lut.init = 16'h0f07;
    LUT4 i2833_2_lut_3_lut (.A(address_memory[2]), .B(n5278), .C(endat_position[2]), 
         .Z(memory_out_buf_31__N_212)) /* synthesis lut_function=(((C)+!B)+!A) */ ;
    defparam i2833_2_lut_3_lut.init = 16'hf7f7;
    CCU2D reset_counter_1044_add_4_7 (.A0(reset_counter[5]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(reset_counter[6]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5052), .COUT(n5053), .S0(n50), 
          .S1(n49));   // d:/git/jojo_endat/encodertop.vhd(144[24:37])
    defparam reset_counter_1044_add_4_7.INIT0 = 16'hfaaa;
    defparam reset_counter_1044_add_4_7.INIT1 = 16'hfaaa;
    defparam reset_counter_1044_add_4_7.INJECT1_0 = "NO";
    defparam reset_counter_1044_add_4_7.INJECT1_1 = "NO";
    LUT4 i2835_3_lut_4_lut (.A(address_memory[2]), .B(n5278), .C(memory_out_buf_31__N_60), 
         .D(endat_position[1]), .Z(memory_out_buf_31__N_216)) /* synthesis lut_function=(!(A (B (C+!(D))+!B (C))+!A (C))) */ ;
    defparam i2835_3_lut_4_lut.init = 16'h0f07;
    LUT4 i2837_2_lut_3_lut (.A(address_memory[2]), .B(n5278), .C(endat_position[0]), 
         .Z(memory_out_buf_31__N_222)) /* synthesis lut_function=(((C)+!B)+!A) */ ;
    defparam i2837_2_lut_3_lut.init = 16'hf7f7;
    LUT4 i1_2_lut_4_lut_adj_159 (.A(address_memory[1]), .B(n5904), .C(address_memory[0]), 
         .D(n5296), .Z(clk_enable_39)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // d:/git/jojo_endat/encodertop.vhd(206[31:53])
    defparam i1_2_lut_4_lut_adj_159.init = 16'h0200;
    LUT4 read_memory_I_0_578_2_lut_4_lut (.A(address_memory[1]), .B(n5904), 
         .C(address_memory[0]), .D(read_memory), .Z(memory_out_buf_31__N_62)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // d:/git/jojo_endat/encodertop.vhd(206[31:53])
    defparam read_memory_I_0_578_2_lut_4_lut.init = 16'h0200;
    LUT4 memory_out_buf_31__I_74_4_lut (.A(memory_out_buf_31__N_156), .B(mcu_settings1[13]), 
         .C(memory_out_buf_31__N_64), .D(memory_out_buf_31__N_62), .Z(memory_out_buf_31__N_154)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/git/jojo_endat/encodertop.vhd(215[78] 216[77])
    defparam memory_out_buf_31__I_74_4_lut.init = 16'hcfca;
    spi_slave spi1 (.clk(clk), .clk_enable_251(clk_enable_251), .spi_sck_c(spi_sck_c), 
            .spi_mosi_c(spi_mosi_c), .spare6_c_c(spare6_c_c), .\address_memory[0] (address_memory[0]), 
            .clk_enable_235(clk_enable_235), .memory_in({memory_in}), .memory_out({memory_out}), 
            .read_memory(read_memory), .n6224(n6224), .n1546(n1546), .\address_memory[6] (address_memory[6]), 
            .\address_memory[5] (address_memory[5]), .\address_memory[4] (address_memory[4]), 
            .\address_memory[3] (address_memory[3]), .\address_memory[2] (address_memory[2]), 
            .\address_memory[1] (address_memory[1]), .n5899(n5899), .GND_net(GND_net), 
            .reset(reset), .spi_miso_c(spi_miso_c), .write_memory(write_memory));   // d:/git/jojo_endat/encodertop.vhd(96[8:17])
    VLO i1 (.Z(GND_net));
    pll pll1 (.clki_c(clki_c), .clk(clk), .GND_net(GND_net)) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(91[8:11])
    FD1S1A memory_out_buf_31__I_0_i1 (.D(memory_out_buf_31__N_218), .CK(read_memory), 
           .Q(memory_out_buf[0]));   // d:/git/jojo_endat/encodertop.vhd(214[2:16])
    defparam memory_out_buf_31__I_0_i1.GSR = "DISABLED";
    VHI i4442 (.Z(VCC_net));
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module endat
//

module endat (clk_counter, clk, GND_net, endat_dir_c, endat_clk_c, 
            endat_position, led7_c_c, n2955, n6224, n5915, n19, 
            n5900, n17, n18, n4, \modebits_buffer_7__N_828[2] , n5912, 
            n8, n5913, n5323, reset, endat_tx_c);
    output [7:0]clk_counter;
    input clk;
    input GND_net;
    output endat_dir_c;
    output endat_clk_c;
    output [31:0]endat_position;
    input led7_c_c;
    input n2955;
    input n6224;
    input n5915;
    output n19;
    input n5900;
    output n17;
    output n18;
    input n4;
    input \modebits_buffer_7__N_828[2] ;
    output n5912;
    input n8;
    input n5913;
    input n5323;
    input reset;
    output endat_tx_c;
    
    wire clk /* synthesis SET_AS_NETWORK=clk, is_clock=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(35[16:19])
    
    wire n2215;
    wire [7:0]n37;
    
    wire n5066, n5065, endat_dir_N_878;
    wire [5:0]bit_counter;   // d:/git/jojo_endat/endat.vhd(34[9:20])
    
    wire clk_enable_154, n5934, clk_enable_96, endat_clk_N_868, clk_enable_103, 
        clk_enable_104, clk_enable_105, clk_enable_106, clk_enable_107, 
        clk_enable_108;
    wire [5:0]n2397;
    wire [5:0]n2405;
    
    wire n2412;
    wire [5:0]n2413;
    wire [7:0]n1892;
    
    wire clk_enable_113, clk_enable_115, clk_enable_123, clk_enable_128, 
        clk_enable_130, clk_enable_132, clk_enable_133, clk_enable_134, 
        clk_enable_135, clk_enable_136, clk_enable_139, clk_enable_140, 
        clk_enable_142, clk_enable_143, clk_enable_144, clk_enable_145, 
        clk_enable_146, clk_enable_147, clk_enable_148, clk_enable_149, 
        clk_enable_150, clk_enable_155, clk_enable_156, clk_enable_157, 
        clk_enable_159, n8_c, clk_enable_176, n5064, n5063;
    wire [7:0]modebits_buffer;   // d:/git/jojo_endat/endat.vhd(36[9:24])
    
    wire clk_enable_184, n5038;
    wire [5:0]n2309;
    
    wire n6, n5;
    wire [5:0]bit_counter_5__N_810;
    
    wire n5893, n5276, n2957, n5890, n2558, n126, n5905, n5920, 
        n5898, n5914, n4328, n5332, n5895, n8_adj_879, n8_adj_880, 
        n5922, n5333, n8_adj_881, n8_adj_882, n5921, n11, n4366, 
        n8_adj_883, n8_adj_884, n41_adj_885, n5037, n5036, n2, n2096, 
        clk_enable_261, n5911, n2961, n2959, n5289, n5933, n5891, 
        n5932, n5927, n5107;
    
    FD1S3IX clk_counter_1050__i5 (.D(n37[5]), .CK(clk), .CD(n2215), .Q(clk_counter[5])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050__i5.GSR = "ENABLED";
    FD1S3IX clk_counter_1050__i4 (.D(n37[4]), .CK(clk), .CD(n2215), .Q(clk_counter[4])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050__i4.GSR = "ENABLED";
    FD1S3IX clk_counter_1050__i3 (.D(n37[3]), .CK(clk), .CD(n2215), .Q(clk_counter[3])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050__i3.GSR = "ENABLED";
    FD1S3IX clk_counter_1050__i2 (.D(n37[2]), .CK(clk), .CD(n2215), .Q(clk_counter[2])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050__i2.GSR = "ENABLED";
    FD1S3IX clk_counter_1050__i1 (.D(n37[1]), .CK(clk), .CD(n2215), .Q(clk_counter[1])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050__i1.GSR = "ENABLED";
    CCU2D clk_counter_1050_add_4_9 (.A0(clk_counter[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n5066), .S0(n37[7]));   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050_add_4_9.INIT0 = 16'hfaaa;
    defparam clk_counter_1050_add_4_9.INIT1 = 16'h0000;
    defparam clk_counter_1050_add_4_9.INJECT1_0 = "NO";
    defparam clk_counter_1050_add_4_9.INJECT1_1 = "NO";
    CCU2D clk_counter_1050_add_4_7 (.A0(clk_counter[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(clk_counter[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5065), .COUT(n5066), .S0(n37[5]), .S1(n37[6]));   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050_add_4_7.INIT0 = 16'hfaaa;
    defparam clk_counter_1050_add_4_7.INIT1 = 16'hfaaa;
    defparam clk_counter_1050_add_4_7.INJECT1_0 = "NO";
    defparam clk_counter_1050_add_4_7.INJECT1_1 = "NO";
    FD1S3AY endat_dir_121 (.D(endat_dir_N_878), .CK(clk), .Q(endat_dir_c)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_dir_121.GSR = "ENABLED";
    FD1P3AY bit_counter__i0 (.D(n5934), .SP(clk_enable_154), .CK(clk), 
            .Q(bit_counter[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam bit_counter__i0.GSR = "ENABLED";
    FD1P3AY endat_clk_119 (.D(endat_clk_N_868), .SP(clk_enable_96), .CK(clk), 
            .Q(endat_clk_c)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_clk_119.GSR = "ENABLED";
    FD1P3AX endat_position__i1 (.D(led7_c_c), .SP(clk_enable_103), .CK(clk), 
            .Q(endat_position[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i1.GSR = "DISABLED";
    FD1P3AX endat_position__i2 (.D(led7_c_c), .SP(clk_enable_104), .CK(clk), 
            .Q(endat_position[2])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i2.GSR = "DISABLED";
    FD1P3AX endat_position__i3 (.D(led7_c_c), .SP(clk_enable_105), .CK(clk), 
            .Q(endat_position[3])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i3.GSR = "DISABLED";
    FD1P3AX endat_position__i4 (.D(led7_c_c), .SP(clk_enable_106), .CK(clk), 
            .Q(endat_position[4])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i4.GSR = "DISABLED";
    FD1P3AX endat_position__i5 (.D(led7_c_c), .SP(clk_enable_107), .CK(clk), 
            .Q(endat_position[5])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i5.GSR = "DISABLED";
    FD1P3AX endat_position__i6 (.D(led7_c_c), .SP(clk_enable_108), .CK(clk), 
            .Q(endat_position[6])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i6.GSR = "DISABLED";
    PFUMX mux_993_i6 (.BLUT(n2397[5]), .ALUT(n2405[5]), .C0(n2412), .Z(n2413[5]));
    FD1S3AY endat_state_FSM_i1 (.D(n2955), .CK(clk), .Q(n1892[0]));   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam endat_state_FSM_i1.GSR = "ENABLED";
    PFUMX mux_993_i4 (.BLUT(n2397[3]), .ALUT(n2405[3]), .C0(n2412), .Z(n2413[3]));
    FD1P3AX endat_position__i7 (.D(led7_c_c), .SP(clk_enable_113), .CK(clk), 
            .Q(endat_position[7])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i7.GSR = "DISABLED";
    FD1P3AX endat_position__i8 (.D(led7_c_c), .SP(clk_enable_115), .CK(clk), 
            .Q(endat_position[8])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i8.GSR = "DISABLED";
    FD1P3AX endat_position__i9 (.D(led7_c_c), .SP(clk_enable_123), .CK(clk), 
            .Q(endat_position[9])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i9.GSR = "DISABLED";
    PFUMX mux_993_i5 (.BLUT(n2397[4]), .ALUT(n2405[4]), .C0(n2412), .Z(n2413[4]));
    FD1P3AX endat_position__i10 (.D(led7_c_c), .SP(clk_enable_128), .CK(clk), 
            .Q(endat_position[10])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i10.GSR = "DISABLED";
    FD1P3AX endat_position__i11 (.D(led7_c_c), .SP(clk_enable_130), .CK(clk), 
            .Q(endat_position[11])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i11.GSR = "DISABLED";
    FD1P3AX endat_position__i12 (.D(led7_c_c), .SP(clk_enable_132), .CK(clk), 
            .Q(endat_position[12])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i12.GSR = "DISABLED";
    FD1P3AX endat_position__i13 (.D(led7_c_c), .SP(clk_enable_133), .CK(clk), 
            .Q(endat_position[13])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i13.GSR = "DISABLED";
    FD1P3AX endat_position__i14 (.D(led7_c_c), .SP(clk_enable_134), .CK(clk), 
            .Q(endat_position[14])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i14.GSR = "DISABLED";
    FD1P3AX endat_position__i15 (.D(led7_c_c), .SP(clk_enable_135), .CK(clk), 
            .Q(endat_position[15])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i15.GSR = "DISABLED";
    FD1P3AX endat_position__i16 (.D(led7_c_c), .SP(clk_enable_136), .CK(clk), 
            .Q(endat_position[16])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i16.GSR = "DISABLED";
    FD1P3AX bit_counter__i5 (.D(n2413[5]), .SP(clk_enable_154), .CK(clk), 
            .Q(bit_counter[5])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam bit_counter__i5.GSR = "ENABLED";
    FD1P3AX endat_position__i17 (.D(led7_c_c), .SP(clk_enable_139), .CK(clk), 
            .Q(endat_position[17])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i17.GSR = "DISABLED";
    FD1P3AX endat_position__i18 (.D(led7_c_c), .SP(clk_enable_140), .CK(clk), 
            .Q(endat_position[18])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i18.GSR = "DISABLED";
    FD1P3AX endat_position__i19 (.D(led7_c_c), .SP(clk_enable_142), .CK(clk), 
            .Q(endat_position[19])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i19.GSR = "DISABLED";
    FD1P3AX endat_position__i20 (.D(led7_c_c), .SP(clk_enable_143), .CK(clk), 
            .Q(endat_position[20])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i20.GSR = "DISABLED";
    FD1P3AX endat_position__i21 (.D(led7_c_c), .SP(clk_enable_144), .CK(clk), 
            .Q(endat_position[21])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i21.GSR = "DISABLED";
    FD1P3AX endat_position__i22 (.D(led7_c_c), .SP(clk_enable_145), .CK(clk), 
            .Q(endat_position[22])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i22.GSR = "DISABLED";
    FD1P3AX endat_position__i23 (.D(led7_c_c), .SP(clk_enable_146), .CK(clk), 
            .Q(endat_position[23])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i23.GSR = "DISABLED";
    FD1P3AX endat_position__i24 (.D(led7_c_c), .SP(clk_enable_147), .CK(clk), 
            .Q(endat_position[24])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i24.GSR = "DISABLED";
    FD1P3AX endat_position__i25 (.D(led7_c_c), .SP(clk_enable_148), .CK(clk), 
            .Q(endat_position[25])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i25.GSR = "DISABLED";
    FD1P3AX endat_position__i26 (.D(led7_c_c), .SP(clk_enable_149), .CK(clk), 
            .Q(endat_position[26])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i26.GSR = "DISABLED";
    FD1P3AX endat_position__i27 (.D(led7_c_c), .SP(clk_enable_150), .CK(clk), 
            .Q(endat_position[27])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i27.GSR = "DISABLED";
    FD1P3AX bit_counter__i4 (.D(n2413[4]), .SP(clk_enable_154), .CK(clk), 
            .Q(bit_counter[4])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam bit_counter__i4.GSR = "ENABLED";
    FD1P3AX bit_counter__i3 (.D(n2413[3]), .SP(clk_enable_154), .CK(clk), 
            .Q(bit_counter[3])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam bit_counter__i3.GSR = "ENABLED";
    FD1P3AY bit_counter__i2 (.D(n2413[2]), .SP(clk_enable_154), .CK(clk), 
            .Q(bit_counter[2])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam bit_counter__i2.GSR = "ENABLED";
    FD1P3AY bit_counter__i1 (.D(n2413[1]), .SP(clk_enable_154), .CK(clk), 
            .Q(bit_counter[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam bit_counter__i1.GSR = "ENABLED";
    FD1P3AX endat_position__i28 (.D(led7_c_c), .SP(clk_enable_155), .CK(clk), 
            .Q(endat_position[28])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i28.GSR = "DISABLED";
    FD1P3AX endat_position__i29 (.D(led7_c_c), .SP(clk_enable_156), .CK(clk), 
            .Q(endat_position[29])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i29.GSR = "DISABLED";
    PFUMX mux_993_i2 (.BLUT(n2397[1]), .ALUT(n2405[1]), .C0(n2412), .Z(n2413[1]));
    FD1P3AX endat_position__i30 (.D(led7_c_c), .SP(clk_enable_157), .CK(clk), 
            .Q(endat_position[30])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i30.GSR = "DISABLED";
    FD1P3AX endat_position__i31 (.D(led7_c_c), .SP(clk_enable_159), .CK(clk), 
            .Q(endat_position[31])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i31.GSR = "DISABLED";
    PFUMX mux_993_i3 (.BLUT(n2397[2]), .ALUT(n2405[2]), .C0(n2412), .Z(n2413[2]));
    LUT4 i1_2_lut_3_lut (.A(bit_counter[3]), .B(bit_counter[4]), .C(bit_counter[2]), 
         .Z(n8_c)) /* synthesis lut_function=(A+!(B (C))) */ ;   // d:/git/jojo_endat/endat.vhd(183[25:36])
    defparam i1_2_lut_3_lut.init = 16'hbfbf;
    FD1P3AX endat_position__i0 (.D(led7_c_c), .SP(clk_enable_176), .CK(clk), 
            .Q(endat_position[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_position__i0.GSR = "DISABLED";
    CCU2D clk_counter_1050_add_4_5 (.A0(clk_counter[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(clk_counter[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5064), .COUT(n5065), .S0(n37[3]), .S1(n37[4]));   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050_add_4_5.INIT0 = 16'hfaaa;
    defparam clk_counter_1050_add_4_5.INIT1 = 16'hfaaa;
    defparam clk_counter_1050_add_4_5.INJECT1_0 = "NO";
    defparam clk_counter_1050_add_4_5.INJECT1_1 = "NO";
    CCU2D clk_counter_1050_add_4_3 (.A0(clk_counter[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(clk_counter[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5063), .COUT(n5064), .S0(n37[1]), .S1(n37[2]));   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050_add_4_3.INIT0 = 16'hfaaa;
    defparam clk_counter_1050_add_4_3.INIT1 = 16'hfaaa;
    defparam clk_counter_1050_add_4_3.INJECT1_0 = "NO";
    defparam clk_counter_1050_add_4_3.INJECT1_1 = "NO";
    FD1P3AX modebits_buffer__i3 (.D(n6224), .SP(clk_enable_184), .CK(clk), 
            .Q(modebits_buffer[2])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam modebits_buffer__i3.GSR = "ENABLED";
    CCU2D add_934_7 (.A0(n2309[0]), .B0(n6), .C0(n5), .D0(bit_counter[5]), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n5038), 
          .S0(bit_counter_5__N_810[5]));   // d:/git/jojo_endat/endat.vhd(126[9] 129[16])
    defparam add_934_7.INIT0 = 16'h56aa;
    defparam add_934_7.INIT1 = 16'h0000;
    defparam add_934_7.INJECT1_0 = "NO";
    defparam add_934_7.INJECT1_1 = "NO";
    CCU2D clk_counter_1050_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(clk_counter[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n5063), .S1(n37[0]));   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050_add_4_1.INIT0 = 16'hF000;
    defparam clk_counter_1050_add_4_1.INIT1 = 16'h0555;
    defparam clk_counter_1050_add_4_1.INJECT1_0 = "NO";
    defparam clk_counter_1050_add_4_1.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut (.A(n5893), .B(n5276), .C(endat_dir_N_878), .D(clk_enable_184), 
         .Z(n2957)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (D))) */ ;   // d:/git/jojo_endat/endat.vhd(168[12:28])
    defparam i1_3_lut_4_lut.init = 16'hffe0;
    LUT4 i2878_4_lut_4_lut (.A(n5890), .B(n2558), .C(bit_counter[4]), 
         .D(bit_counter[5]), .Z(n2405[5])) /* synthesis lut_function=(!(A+(B (C (D)+!C !(D))+!B !(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2878_4_lut_4_lut.init = 16'h1540;
    LUT4 i1031_2_lut_rep_65 (.A(n126), .B(n1892[3]), .Z(n5890)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i1031_2_lut_rep_65.init = 16'h2222;
    LUT4 i2882_3_lut_3_lut_4_lut (.A(n126), .B(n1892[3]), .C(bit_counter[1]), 
         .D(bit_counter[0]), .Z(n2405[1])) /* synthesis lut_function=(!(A ((C (D)+!C !(D))+!B)+!A (C (D)+!C !(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2882_3_lut_3_lut_4_lut.init = 16'h0dd0;
    LUT4 i2879_3_lut_3_lut_4_lut (.A(n126), .B(n1892[3]), .C(bit_counter[4]), 
         .D(n2558), .Z(n2405[4])) /* synthesis lut_function=(!(A ((C (D)+!C !(D))+!B)+!A (C (D)+!C !(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2879_3_lut_3_lut_4_lut.init = 16'h0dd0;
    LUT4 i2880_3_lut_3_lut_4_lut (.A(n126), .B(n1892[3]), .C(bit_counter[3]), 
         .D(n5905), .Z(n2405[3])) /* synthesis lut_function=(!(A ((C (D)+!C !(D))+!B)+!A (C (D)+!C !(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2880_3_lut_3_lut_4_lut.init = 16'h0dd0;
    LUT4 i2881_3_lut_3_lut_4_lut (.A(n126), .B(n1892[3]), .C(bit_counter[2]), 
         .D(n5920), .Z(n2405[2])) /* synthesis lut_function=(!(A ((C (D)+!C !(D))+!B)+!A (C (D)+!C !(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2881_3_lut_3_lut_4_lut.init = 16'h0dd0;
    LUT4 i1_2_lut_rep_73_4_lut (.A(clk_counter[2]), .B(clk_counter[6]), 
         .C(n5915), .D(clk_counter[3]), .Z(n5898)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i1_2_lut_rep_73_4_lut.init = 16'hfffe;
    LUT4 i2_3_lut_4_lut (.A(bit_counter[3]), .B(n5914), .C(bit_counter[4]), 
         .D(n4328), .Z(n5332)) /* synthesis lut_function=((B+!(C (D)))+!A) */ ;   // d:/git/jojo_endat/endat.vhd(186[33:50])
    defparam i2_3_lut_4_lut.init = 16'hdfff;
    LUT4 i4041_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_c), 
         .D(bit_counter[1]), .Z(clk_enable_143)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4041_2_lut_2_lut_3_lut_4_lut.init = 16'h0001;
    LUT4 i3987_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_879), 
         .D(bit_counter[1]), .Z(clk_enable_176)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i3987_2_lut_2_lut_3_lut_4_lut.init = 16'h0001;
    LUT4 i4070_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_880), 
         .D(bit_counter[1]), .Z(clk_enable_132)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4070_2_lut_2_lut_3_lut_4_lut.init = 16'h0001;
    LUT4 i1_2_lut_3_lut_4_lut (.A(bit_counter[4]), .B(n5922), .C(n5914), 
         .D(bit_counter[3]), .Z(n5333)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(186[33:50])
    defparam i1_2_lut_3_lut_4_lut.init = 16'hfeff;
    LUT4 i4082_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_881), 
         .D(bit_counter[1]), .Z(clk_enable_115)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4082_2_lut_2_lut_3_lut_4_lut.init = 16'h0001;
    LUT4 i4094_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_882), 
         .D(bit_counter[1]), .Z(clk_enable_106)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4094_2_lut_2_lut_3_lut_4_lut.init = 16'h0001;
    LUT4 i2_3_lut_4_lut_adj_138 (.A(bit_counter[4]), .B(n5922), .C(bit_counter[3]), 
         .D(n5921), .Z(n11)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(186[33:50])
    defparam i2_3_lut_4_lut_adj_138.init = 16'hfffe;
    LUT4 i4014_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n4366), 
         .D(bit_counter[1]), .Z(clk_enable_155)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4014_2_lut_2_lut_3_lut_4_lut.init = 16'h0010;
    LUT4 i4029_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_883), 
         .D(bit_counter[1]), .Z(clk_enable_147)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4029_2_lut_2_lut_3_lut_4_lut.init = 16'h0001;
    LUT4 i4058_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_884), 
         .D(bit_counter[1]), .Z(clk_enable_136)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4058_2_lut_2_lut_3_lut_4_lut.init = 16'h0001;
    LUT4 i4064_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_880), 
         .D(bit_counter[1]), .Z(clk_enable_134)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4064_2_lut_2_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i4035_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_c), 
         .D(bit_counter[1]), .Z(clk_enable_145)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4035_2_lut_2_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i4088_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_882), 
         .D(bit_counter[1]), .Z(clk_enable_108)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4088_2_lut_2_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i4100_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_879), 
         .D(bit_counter[1]), .Z(clk_enable_104)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4100_2_lut_2_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i4010_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n4366), 
         .D(bit_counter[1]), .Z(clk_enable_157)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4010_2_lut_2_lut_3_lut_4_lut.init = 16'h1000;
    LUT4 i4023_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_883), 
         .D(bit_counter[1]), .Z(clk_enable_149)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4023_2_lut_2_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i4050_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_884), 
         .D(bit_counter[1]), .Z(clk_enable_140)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4050_2_lut_2_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i4076_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[0]), .B(n5895), .C(n8_adj_881), 
         .D(bit_counter[1]), .Z(clk_enable_128)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4076_2_lut_2_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i47_4_lut (.A(n5893), .B(n5333), .C(led7_c_c), .D(n11), .Z(n126)) /* synthesis lut_function=(!(A+!((C (D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(157[12:90])
    defparam i47_4_lut.init = 16'h5111;
    LUT4 i993_2_lut (.A(n1892[2]), .B(n1892[3]), .Z(n2412)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i993_2_lut.init = 16'heeee;
    LUT4 i8_4_lut (.A(bit_counter[1]), .B(n1892[3]), .C(bit_counter[4]), 
         .D(clk_counter[0]), .Z(n19)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i8_4_lut.init = 16'h8000;
    LUT4 i6_3_lut (.A(n5900), .B(bit_counter[3]), .C(clk_counter[3]), 
         .Z(n17)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;
    defparam i6_3_lut.init = 16'h0404;
    LUT4 i7_4_lut (.A(bit_counter[5]), .B(n41_adj_885), .C(bit_counter[2]), 
         .D(bit_counter[0]), .Z(n18)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;
    defparam i7_4_lut.init = 16'h4000;
    LUT4 i4061_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_880), 
         .D(bit_counter[1]), .Z(clk_enable_135)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4061_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    LUT4 i4032_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_c), 
         .D(bit_counter[1]), .Z(clk_enable_146)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4032_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    LUT4 i4097_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_879), 
         .D(bit_counter[1]), .Z(clk_enable_105)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4097_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    LUT4 i4073_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_881), 
         .D(bit_counter[1]), .Z(clk_enable_130)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4073_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    LUT4 i4008_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n4366), 
         .D(bit_counter[1]), .Z(clk_enable_159)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4008_2_lut_2_lut_3_lut_4_lut.init = 16'h4000;
    LUT4 i4020_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_883), 
         .D(bit_counter[1]), .Z(clk_enable_150)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4020_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    CCU2D add_934_5 (.A0(n2309[0]), .B0(n6), .C0(n5), .D0(bit_counter[3]), 
          .A1(n2309[0]), .B1(n6), .C1(n5), .D1(bit_counter[4]), .CIN(n5037), 
          .COUT(n5038), .S0(bit_counter_5__N_810[3]), .S1(bit_counter_5__N_810[4]));   // d:/git/jojo_endat/endat.vhd(126[9] 129[16])
    defparam add_934_5.INIT0 = 16'h56aa;
    defparam add_934_5.INIT1 = 16'h56aa;
    defparam add_934_5.INJECT1_0 = "NO";
    defparam add_934_5.INJECT1_1 = "NO";
    CCU2D add_934_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n2309[0]), .B1(n6), .C1(n5), .D1(bit_counter[0]), .COUT(n5036), 
          .S1(bit_counter_5__N_810[0]));   // d:/git/jojo_endat/endat.vhd(126[9] 129[16])
    defparam add_934_1.INIT0 = 16'hF000;
    defparam add_934_1.INIT1 = 16'h56aa;
    defparam add_934_1.INJECT1_0 = "NO";
    defparam add_934_1.INJECT1_1 = "NO";
    LUT4 i4044_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_884), 
         .D(bit_counter[1]), .Z(clk_enable_142)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4044_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    LUT4 i4085_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_882), 
         .D(bit_counter[1]), .Z(clk_enable_113)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4085_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    LUT4 i4067_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_880), 
         .D(bit_counter[1]), .Z(clk_enable_133)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4067_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4038_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_c), 
         .D(bit_counter[1]), .Z(clk_enable_144)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4038_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4079_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_881), 
         .D(bit_counter[1]), .Z(clk_enable_123)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4079_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4103_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_879), 
         .D(bit_counter[1]), .Z(clk_enable_103)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4103_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4012_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n4366), 
         .D(bit_counter[1]), .Z(clk_enable_156)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4012_2_lut_2_lut_3_lut_4_lut.init = 16'h0040;
    LUT4 i2862_4_lut_4_lut (.A(endat_dir_N_878), .B(bit_counter[1]), .C(bit_counter[2]), 
         .D(n2), .Z(n2096)) /* synthesis lut_function=(!(A (B (C+!(D))+!B (C)))) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2862_4_lut_4_lut.init = 16'h5f57;
    LUT4 i4026_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_883), 
         .D(bit_counter[1]), .Z(clk_enable_148)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4026_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4053_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_884), 
         .D(bit_counter[1]), .Z(clk_enable_139)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4053_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i2_4_lut_4_lut (.A(endat_dir_N_878), .B(n4), .C(n5898), .D(n1892[2]), 
         .Z(clk_enable_261)) /* synthesis lut_function=((B (D)+!B ((D)+!C))+!A) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2_4_lut_4_lut.init = 16'hff57;
    LUT4 i4091_2_lut_2_lut_3_lut_4_lut (.A(n5895), .B(bit_counter[0]), .C(n8_adj_882), 
         .D(bit_counter[1]), .Z(clk_enable_107)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i4091_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i2915_2_lut_2_lut (.A(endat_dir_N_878), .B(bit_counter_5__N_810[2]), 
         .Z(n2397[2])) /* synthesis lut_function=((B)+!A) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2915_2_lut_2_lut.init = 16'hdddd;
    LUT4 i2916_2_lut_2_lut (.A(endat_dir_N_878), .B(bit_counter_5__N_810[1]), 
         .Z(n2397[1])) /* synthesis lut_function=((B)+!A) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2916_2_lut_2_lut.init = 16'hdddd;
    LUT4 i2906_2_lut_rep_86 (.A(bit_counter[3]), .B(bit_counter[4]), .Z(n5911)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2906_2_lut_rep_86.init = 16'h8888;
    LUT4 equal_644_i8_2_lut_3_lut (.A(bit_counter[3]), .B(bit_counter[4]), 
         .C(bit_counter[2]), .Z(n8_adj_883)) /* synthesis lut_function=(((C)+!B)+!A) */ ;
    defparam equal_644_i8_2_lut_3_lut.init = 16'hf7f7;
    LUT4 i2908_2_lut_3_lut (.A(bit_counter[3]), .B(bit_counter[4]), .C(bit_counter[2]), 
         .Z(n4366)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i2908_2_lut_3_lut.init = 16'h8080;
    LUT4 i1_2_lut_rep_87 (.A(n1892[0]), .B(\modebits_buffer_7__N_828[2] ), 
         .Z(n5912)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i1_2_lut_rep_87.init = 16'h2222;
    LUT4 i1_4_lut_4_lut (.A(n1892[0]), .B(\modebits_buffer_7__N_828[2] ), 
         .C(n8), .D(clk_counter[4]), .Z(endat_clk_N_868)) /* synthesis lut_function=(!(A (B)+!A !(C (D)))) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i1_4_lut_4_lut.init = 16'h7222;
    LUT4 i3980_4_lut (.A(n1892[3]), .B(n1892[2]), .C(n5893), .D(n5332), 
         .Z(clk_enable_154)) /* synthesis lut_function=(!(A (C+!(D))+!A (B (C)))) */ ;
    defparam i3980_4_lut.init = 16'h1f15;
    FD1S3AX endat_state_FSM_i4 (.D(n2961), .CK(clk), .Q(n1892[3]));   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam endat_state_FSM_i4.GSR = "ENABLED";
    LUT4 i2870_2_lut (.A(bit_counter[2]), .B(bit_counter[1]), .Z(n4328)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2870_2_lut.init = 16'h8888;
    FD1S3AX endat_state_FSM_i3 (.D(n2959), .CK(clk), .Q(n1892[2]));   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam endat_state_FSM_i3.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_89 (.A(bit_counter[5]), .B(bit_counter[0]), .Z(n5914)) /* synthesis lut_function=(A+!(B)) */ ;   // d:/git/jojo_endat/endat.vhd(168[12:28])
    defparam i1_2_lut_rep_89.init = 16'hbbbb;
    LUT4 i1_2_lut (.A(clk_counter[4]), .B(clk_counter[5]), .Z(n41_adj_885)) /* synthesis lut_function=(A (B)) */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam i1_2_lut.init = 16'h8888;
    LUT4 i1_4_lut (.A(n1892[0]), .B(n5289), .C(clk_counter[2]), .D(n5913), 
         .Z(clk_enable_96)) /* synthesis lut_function=(A+!((C+(D))+!B)) */ ;
    defparam i1_4_lut.init = 16'haaae;
    FD1S3AX endat_state_FSM_i2 (.D(n2957), .CK(clk), .Q(endat_dir_N_878));   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam endat_state_FSM_i2.GSR = "ENABLED";
    LUT4 i1_2_lut_4_lut (.A(n5898), .B(n41_adj_885), .C(clk_counter[0]), 
         .D(n1892[0]), .Z(n2215)) /* synthesis lut_function=(A (D)+!A (B (C+(D))+!B (D))) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i1_2_lut_4_lut.init = 16'hff40;
    LUT4 mux_993_i1_then_3_lut (.A(n1892[3]), .B(n126), .C(bit_counter[0]), 
         .Z(n5933)) /* synthesis lut_function=(!(A (C)+!A (B+(C)))) */ ;
    defparam mux_993_i1_then_3_lut.init = 16'h0b0b;
    LUT4 i1_2_lut_rep_66_4_lut (.A(n5898), .B(n41_adj_885), .C(clk_counter[0]), 
         .D(n5276), .Z(n5891)) /* synthesis lut_function=(A+(((D)+!C)+!B)) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i1_2_lut_rep_66_4_lut.init = 16'hffbf;
    LUT4 i2_2_lut_4_lut (.A(n5898), .B(n41_adj_885), .C(clk_counter[0]), 
         .D(n5921), .Z(n6)) /* synthesis lut_function=(A+(((D)+!C)+!B)) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i2_2_lut_4_lut.init = 16'hffbf;
    LUT4 mux_993_i1_else_3_lut (.A(endat_dir_N_878), .B(n1892[3]), .C(bit_counter_5__N_810[0]), 
         .D(bit_counter[0]), .Z(n5932)) /* synthesis lut_function=(!(A (B (D)+!B !(C))+!A (B (D)))) */ ;
    defparam mux_993_i1_else_3_lut.init = 16'h31fd;
    LUT4 i1_2_lut_3_lut_adj_139 (.A(bit_counter[3]), .B(bit_counter[4]), 
         .C(bit_counter[2]), .Z(n8_adj_884)) /* synthesis lut_function=(A+((C)+!B)) */ ;   // d:/git/jojo_endat/endat.vhd(183[25:36])
    defparam i1_2_lut_3_lut_adj_139.init = 16'hfbfb;
    LUT4 i3_4_lut (.A(n5915), .B(clk_counter[6]), .C(clk_counter[3]), 
         .D(clk_counter[4]), .Z(n5289)) /* synthesis lut_function=(!(A+(B+!(C (D)+!C !(D))))) */ ;
    defparam i3_4_lut.init = 16'h1001;
    LUT4 i1_2_lut_3_lut_adj_140 (.A(bit_counter[4]), .B(bit_counter[3]), 
         .C(bit_counter[2]), .Z(n8_adj_881)) /* synthesis lut_function=(A+((C)+!B)) */ ;   // d:/git/jojo_endat/endat.vhd(183[25:36])
    defparam i1_2_lut_3_lut_adj_140.init = 16'hfbfb;
    LUT4 i1_2_lut_3_lut_adj_141 (.A(bit_counter[4]), .B(bit_counter[3]), 
         .C(bit_counter[2]), .Z(n8_adj_880)) /* synthesis lut_function=(A+!(B (C))) */ ;   // d:/git/jojo_endat/endat.vhd(183[25:36])
    defparam i1_2_lut_3_lut_adj_141.init = 16'hbfbf;
    LUT4 i2913_2_lut (.A(bit_counter_5__N_810[4]), .B(endat_dir_N_878), 
         .Z(n2397[4])) /* synthesis lut_function=(A (B)) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2913_2_lut.init = 16'h8888;
    LUT4 i1103_2_lut_rep_95 (.A(bit_counter[1]), .B(bit_counter[0]), .Z(n5920)) /* synthesis lut_function=(A (B)) */ ;   // d:/git/jojo_endat/endat.vhd(187[25:36])
    defparam i1103_2_lut_rep_95.init = 16'h8888;
    LUT4 i1117_2_lut_3_lut_4_lut (.A(bit_counter[1]), .B(bit_counter[0]), 
         .C(bit_counter[3]), .D(bit_counter[2]), .Z(n2558)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // d:/git/jojo_endat/endat.vhd(187[25:36])
    defparam i1117_2_lut_3_lut_4_lut.init = 16'h8000;
    LUT4 i1110_2_lut_rep_80_3_lut (.A(bit_counter[1]), .B(bit_counter[0]), 
         .C(bit_counter[2]), .Z(n5905)) /* synthesis lut_function=(A (B (C))) */ ;   // d:/git/jojo_endat/endat.vhd(187[25:36])
    defparam i1110_2_lut_rep_80_3_lut.init = 16'h8080;
    LUT4 i1_2_lut_rep_96 (.A(bit_counter[0]), .B(bit_counter[5]), .Z(n5921)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/endat.vhd(168[12:28])
    defparam i1_2_lut_rep_96.init = 16'heeee;
    LUT4 i2_3_lut_4_lut_adj_142 (.A(bit_counter[0]), .B(bit_counter[5]), 
         .C(n5927), .D(n5922), .Z(n5276)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(168[12:28])
    defparam i2_3_lut_4_lut_adj_142.init = 16'hfffe;
    LUT4 not_equal_19_i7_2_lut_rep_97 (.A(bit_counter[1]), .B(bit_counter[2]), 
         .Z(n5922)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/endat.vhd(122[33:49])
    defparam not_equal_19_i7_2_lut_rep_97.init = 16'heeee;
    LUT4 i2914_2_lut (.A(bit_counter_5__N_810[3]), .B(endat_dir_N_878), 
         .Z(n2397[3])) /* synthesis lut_function=(A (B)) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2914_2_lut.init = 16'h8888;
    LUT4 equal_664_i7_2_lut_rep_102 (.A(bit_counter[3]), .B(bit_counter[4]), 
         .Z(n5927)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/endat.vhd(183[25:36])
    defparam equal_664_i7_2_lut_rep_102.init = 16'heeee;
    LUT4 equal_668_i8_2_lut_3_lut (.A(bit_counter[3]), .B(bit_counter[4]), 
         .C(bit_counter[2]), .Z(n8_adj_879)) /* synthesis lut_function=(A+(B+(C))) */ ;   // d:/git/jojo_endat/endat.vhd(183[25:36])
    defparam equal_668_i8_2_lut_3_lut.init = 16'hfefe;
    LUT4 equal_664_i8_2_lut_3_lut (.A(bit_counter[3]), .B(bit_counter[4]), 
         .C(bit_counter[2]), .Z(n8_adj_882)) /* synthesis lut_function=(A+(B+!(C))) */ ;   // d:/git/jojo_endat/endat.vhd(183[25:36])
    defparam equal_664_i8_2_lut_3_lut.init = 16'hefef;
    LUT4 i1_2_lut_3_lut_4_lut_adj_143 (.A(bit_counter[3]), .B(bit_counter[4]), 
         .C(bit_counter[2]), .D(bit_counter[1]), .Z(n5)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/git/jojo_endat/endat.vhd(183[25:36])
    defparam i1_2_lut_3_lut_4_lut_adj_143.init = 16'hfffe;
    LUT4 i2912_2_lut (.A(bit_counter_5__N_810[5]), .B(endat_dir_N_878), 
         .Z(n2397[5])) /* synthesis lut_function=(A (B)) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i2912_2_lut.init = 16'h8888;
    FD1S3IX clk_counter_1050__i0 (.D(n37[0]), .CK(clk), .CD(n2215), .Q(clk_counter[0])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050__i0.GSR = "ENABLED";
    LUT4 i1_2_lut_adj_144 (.A(n1892[0]), .B(\modebits_buffer_7__N_828[2] ), 
         .Z(clk_enable_184)) /* synthesis lut_function=(A (B)) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i1_2_lut_adj_144.init = 16'h8888;
    LUT4 i2_3_lut (.A(n11), .B(n5893), .C(n5276), .Z(n2309[0])) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // d:/git/jojo_endat/endat.vhd(126[9] 129[16])
    defparam i2_3_lut.init = 16'h2020;
    LUT4 i2_3_lut_rep_70 (.A(n5323), .B(n1892[3]), .C(reset), .Z(n5895)) /* synthesis lut_function=(A+((C)+!B)) */ ;
    defparam i2_3_lut_rep_70.init = 16'hfbfb;
    LUT4 i1511_4_lut (.A(n1892[3]), .B(n126), .C(n5107), .D(n1892[2]), 
         .Z(n2961)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i1511_4_lut.init = 16'heca0;
    LUT4 i3_4_lut_adj_145 (.A(n5911), .B(n5893), .C(n5914), .D(n4328), 
         .Z(n5107)) /* synthesis lut_function=((B+(C+!(D)))+!A) */ ;   // d:/git/jojo_endat/endat.vhd(168[12:28])
    defparam i3_4_lut_adj_145.init = 16'hfdff;
    LUT4 i1509_4_lut (.A(n126), .B(n5891), .C(n1892[2]), .D(endat_dir_N_878), 
         .Z(n2959)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (C+(D))))) */ ;   // d:/git/jojo_endat/endat.vhd(60[7] 195[16])
    defparam i1509_4_lut.init = 16'h7350;
    LUT4 i2885_2_lut (.A(modebits_buffer[2]), .B(bit_counter[0]), .Z(n2)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/git/jojo_endat/endat.vhd(115[38:49])
    defparam i2885_2_lut.init = 16'h2222;
    FD1P3IX endat_tx_120 (.D(n2096), .SP(clk_enable_261), .CD(n1892[2]), 
            .CK(clk), .Q(endat_tx_c)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=10, LSE_RCOL=15, LSE_LLINE=115, LSE_RLINE=115 */ ;   // d:/git/jojo_endat/endat.vhd(48[6] 196[13])
    defparam endat_tx_120.GSR = "ENABLED";
    FD1S3IX clk_counter_1050__i7 (.D(n37[7]), .CK(clk), .CD(n2215), .Q(clk_counter[7])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050__i7.GSR = "ENABLED";
    FD1S3IX clk_counter_1050__i6 (.D(n37[6]), .CK(clk), .CD(n2215), .Q(clk_counter[6])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam clk_counter_1050__i6.GSR = "ENABLED";
    CCU2D add_934_3 (.A0(n2309[0]), .B0(n6), .C0(n5), .D0(bit_counter[1]), 
          .A1(n2309[0]), .B1(n6), .C1(n5), .D1(bit_counter[2]), .CIN(n5036), 
          .COUT(n5037), .S0(bit_counter_5__N_810[1]), .S1(bit_counter_5__N_810[2]));   // d:/git/jojo_endat/endat.vhd(126[9] 129[16])
    defparam add_934_3.INIT0 = 16'h56aa;
    defparam add_934_3.INIT1 = 16'h56aa;
    defparam add_934_3.INJECT1_0 = "NO";
    defparam add_934_3.INJECT1_1 = "NO";
    LUT4 i1_3_lut_rep_68_4_lut (.A(clk_counter[3]), .B(n5900), .C(clk_counter[0]), 
         .D(n41_adj_885), .Z(n5893)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;   // d:/git/jojo_endat/endat.vhd(171[25:36])
    defparam i1_3_lut_rep_68_4_lut.init = 16'hefff;
    PFUMX i4244 (.BLUT(n5932), .ALUT(n5933), .C0(n1892[2]), .Z(n5934));
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module spi_slave
//

module spi_slave (clk, clk_enable_251, spi_sck_c, spi_mosi_c, spare6_c_c, 
            \address_memory[0] , clk_enable_235, memory_in, memory_out, 
            read_memory, n6224, n1546, \address_memory[6] , \address_memory[5] , 
            \address_memory[4] , \address_memory[3] , \address_memory[2] , 
            \address_memory[1] , n5899, GND_net, reset, spi_miso_c, 
            write_memory);
    input clk;
    input clk_enable_251;
    input spi_sck_c;
    input spi_mosi_c;
    input spare6_c_c;
    output \address_memory[0] ;
    input clk_enable_235;
    output [31:0]memory_in;
    input [31:0]memory_out;
    output read_memory;
    input n6224;
    output n1546;
    output \address_memory[6] ;
    output \address_memory[5] ;
    output \address_memory[4] ;
    output \address_memory[3] ;
    output \address_memory[2] ;
    output \address_memory[1] ;
    output n5899;
    input GND_net;
    input reset;
    output spi_miso_c;
    output write_memory;
    
    wire clk /* synthesis SET_AS_NETWORK=clk, is_clock=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(35[16:19])
    wire read_memory /* synthesis is_clock=1, SET_AS_NETWORK=read_memory */ ;   // d:/git/jojo_endat/encodertop.vhd(45[9:20])
    wire [39:0]data_word_buf;   // d:/git/jojo_endat/spi_slave.vhd(36[9:22])
    
    wire clk_enable_1;
    wire [1:0]spi_mosi_buf;   // d:/git/jojo_endat/spi_slave.vhd(29[22:34])
    
    wire clk_enable_2;
    wire [1:0]spi_sck_buf;   // d:/git/jojo_endat/spi_slave.vhd(29[9:20])
    
    wire clk_enable_4, clk_enable_5, clk_enable_6, clk_enable_7, clk_enable_40, 
        clk_enable_42, clk_enable_43, clk_enable_44, clk_enable_45;
    wire [1:0]spi_scs_buf;   // d:/git/jojo_endat/spi_slave.vhd(29[36:47])
    wire [7:0]command_byte_buf;   // d:/git/jojo_endat/spi_slave.vhd(35[9:25])
    
    wire clk_enable_221;
    wire [39:0]test_word;   // d:/git/jojo_endat/spi_slave.vhd(39[9:18])
    
    wire clk_enable_50, clk_enable_90, clk_enable_91, clk_enable_93, 
        clk_enable_94;
    wire [3:0]n1543;
    
    wire n5796, clk_enable_97, clk_enable_98, clk_enable_99, clk_enable_100, 
        clk_enable_101, clk_enable_102, clk_enable_114, n4316, n5082, 
        n5389, clk_enable_137, n2943, clk_enable_141, clk_enable_160, 
        clk_enable_161, clk_enable_162, clk_enable_163, clk_enable_164, 
        clk_enable_166, n5433, n62;
    wire [5:0]bit_counter;   // d:/git/jojo_endat/spi_slave.vhd(30[9:20])
    
    wire spi_miso_N_730, n5918, n5429, n5430, n5432, n5909, n5907, 
        n5923, n5901, n5924, n5418, n5417, n5910, n5416, n5903, 
        n5415, n5414, n5413, n5926, clk_enable_265, n3056, n3062, 
        n3064, n5412, n5411, n5427, n5428, n5431, n5410, n5400, 
        n5401, n5402, n5409, clk_enable_262, n5408, n5407, n5930, 
        clk_enable_254, clk_enable_255, clk_enable_256, n5406, n5404, 
        n5405, clk_enable_253, clk_enable_252, clk_enable_250, n5916, 
        n5908, n5906, n5399, n5398, n5917, n5902, n5894, clk_enable_260, 
        n5403, n5419, n5397, n5396, n6, n5420, n5928, clk_enable_257, 
        n5421, n5422, n5423, n5424, n5425, n5426, clk_enable_249, 
        n5041;
    wire [5:0]bit_counter_5__N_571;
    
    wire n5040, n5372, n4353, n2946, clk_enable_264, write_memory_N_725, 
        n5039, clk_enable_263, n2827;
    
    FD1P3AX data_word_buf_i0_i23 (.D(spi_mosi_buf[1]), .SP(clk_enable_1), 
            .CK(clk), .Q(data_word_buf[23])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i23.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i24 (.D(spi_mosi_buf[1]), .SP(clk_enable_2), 
            .CK(clk), .Q(data_word_buf[24])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i24.GSR = "DISABLED";
    FD1P3AX spi_sck_buf_i0_i0 (.D(spi_sck_c), .SP(clk_enable_251), .CK(clk), 
            .Q(spi_sck_buf[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam spi_sck_buf_i0_i0.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i25 (.D(spi_mosi_buf[1]), .SP(clk_enable_4), 
            .CK(clk), .Q(data_word_buf[25])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i25.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i26 (.D(spi_mosi_buf[1]), .SP(clk_enable_5), 
            .CK(clk), .Q(data_word_buf[26])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i26.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i27 (.D(spi_mosi_buf[1]), .SP(clk_enable_6), 
            .CK(clk), .Q(data_word_buf[27])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i27.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i28 (.D(spi_mosi_buf[1]), .SP(clk_enable_7), 
            .CK(clk), .Q(data_word_buf[28])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i28.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i11 (.D(spi_mosi_buf[1]), .SP(clk_enable_40), 
            .CK(clk), .Q(data_word_buf[11])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i11.GSR = "DISABLED";
    FD1P3AX spi_mosi_buf_i0_i0 (.D(spi_mosi_c), .SP(clk_enable_251), .CK(clk), 
            .Q(spi_mosi_buf[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam spi_mosi_buf_i0_i0.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i29 (.D(spi_mosi_buf[1]), .SP(clk_enable_42), 
            .CK(clk), .Q(data_word_buf[29])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i29.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i30 (.D(spi_mosi_buf[1]), .SP(clk_enable_43), 
            .CK(clk), .Q(data_word_buf[30])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i30.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i12 (.D(spi_mosi_buf[1]), .SP(clk_enable_44), 
            .CK(clk), .Q(data_word_buf[12])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i12.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i13 (.D(spi_mosi_buf[1]), .SP(clk_enable_45), 
            .CK(clk), .Q(data_word_buf[13])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i13.GSR = "DISABLED";
    FD1P3AX spi_scs_buf_i0_i0 (.D(spare6_c_c), .SP(clk_enable_251), .CK(clk), 
            .Q(spi_scs_buf[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam spi_scs_buf_i0_i0.GSR = "DISABLED";
    FD1P3AX address_memory__i1 (.D(command_byte_buf[0]), .SP(clk_enable_235), 
            .CK(clk), .Q(\address_memory[0] )) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam address_memory__i1.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i0 (.D(data_word_buf[8]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i0.GSR = "DISABLED";
    FD1P3AX test_word_i0 (.D(memory_out[0]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i0.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i31 (.D(spi_mosi_buf[1]), .SP(clk_enable_50), 
            .CK(clk), .Q(data_word_buf[31])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i31.GSR = "DISABLED";
    FD1P3AX test_word_i1 (.D(memory_out[1]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i1.GSR = "DISABLED";
    FD1P3AX test_word_i2 (.D(memory_out[2]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i2.GSR = "DISABLED";
    FD1P3AX test_word_i3 (.D(memory_out[3]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i3.GSR = "DISABLED";
    FD1P3AX test_word_i4 (.D(memory_out[4]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i4.GSR = "DISABLED";
    FD1P3AX test_word_i5 (.D(memory_out[5]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i5.GSR = "DISABLED";
    FD1P3AX test_word_i6 (.D(memory_out[6]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i6.GSR = "DISABLED";
    FD1P3AX test_word_i7 (.D(memory_out[7]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i7.GSR = "DISABLED";
    FD1P3AX test_word_i8 (.D(memory_out[8]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[8])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i8.GSR = "DISABLED";
    FD1P3AX test_word_i9 (.D(memory_out[9]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[9])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i9.GSR = "DISABLED";
    FD1P3AX test_word_i10 (.D(memory_out[10]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[10])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i10.GSR = "DISABLED";
    FD1P3AX test_word_i11 (.D(memory_out[11]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[11])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i11.GSR = "DISABLED";
    FD1P3AX test_word_i12 (.D(memory_out[12]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[12])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i12.GSR = "DISABLED";
    FD1P3AX test_word_i13 (.D(memory_out[13]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[13])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i13.GSR = "DISABLED";
    FD1P3AX test_word_i14 (.D(memory_out[14]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[14])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i14.GSR = "DISABLED";
    FD1P3AX test_word_i15 (.D(memory_out[15]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[15])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i15.GSR = "DISABLED";
    FD1P3AX test_word_i16 (.D(memory_out[16]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[16])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i16.GSR = "DISABLED";
    FD1P3AY test_word_i17 (.D(memory_out[17]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[17])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i17.GSR = "DISABLED";
    FD1P3AX test_word_i18 (.D(memory_out[18]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[18])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i18.GSR = "DISABLED";
    FD1P3AY test_word_i19 (.D(memory_out[19]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[19])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i19.GSR = "DISABLED";
    FD1P3AX test_word_i20 (.D(memory_out[20]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[20])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i20.GSR = "DISABLED";
    FD1P3AY test_word_i21 (.D(memory_out[21]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[21])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i21.GSR = "DISABLED";
    FD1P3AX test_word_i22 (.D(memory_out[22]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[22])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i22.GSR = "DISABLED";
    FD1P3AY test_word_i23 (.D(memory_out[23]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[23])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i23.GSR = "DISABLED";
    FD1P3AX test_word_i24 (.D(memory_out[24]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[24])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i24.GSR = "DISABLED";
    FD1P3AY test_word_i25 (.D(memory_out[25]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[25])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i25.GSR = "DISABLED";
    FD1P3AX test_word_i26 (.D(memory_out[26]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[26])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i26.GSR = "DISABLED";
    FD1P3AY test_word_i27 (.D(memory_out[27]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[27])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i27.GSR = "DISABLED";
    FD1P3AX test_word_i28 (.D(memory_out[28]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[28])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i28.GSR = "DISABLED";
    FD1P3AY test_word_i29 (.D(memory_out[29]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[29])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i29.GSR = "DISABLED";
    FD1P3AX test_word_i30 (.D(memory_out[30]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[30])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i30.GSR = "DISABLED";
    FD1P3AY test_word_i31 (.D(memory_out[31]), .SP(clk_enable_235), .CK(clk), 
            .Q(test_word[31])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i31.GSR = "DISABLED";
    FD1P3AX test_word_i32 (.D(command_byte_buf[0]), .SP(clk_enable_235), 
            .CK(clk), .Q(test_word[32])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i32.GSR = "DISABLED";
    FD1P3AX test_word_i33 (.D(command_byte_buf[1]), .SP(clk_enable_235), 
            .CK(clk), .Q(test_word[33])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i33.GSR = "DISABLED";
    FD1P3AX test_word_i34 (.D(command_byte_buf[2]), .SP(clk_enable_235), 
            .CK(clk), .Q(test_word[34])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i34.GSR = "DISABLED";
    FD1P3AX test_word_i35 (.D(command_byte_buf[3]), .SP(clk_enable_235), 
            .CK(clk), .Q(test_word[35])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i35.GSR = "DISABLED";
    FD1P3AX test_word_i36 (.D(command_byte_buf[4]), .SP(clk_enable_235), 
            .CK(clk), .Q(test_word[36])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i36.GSR = "DISABLED";
    FD1P3AX test_word_i37 (.D(command_byte_buf[5]), .SP(clk_enable_235), 
            .CK(clk), .Q(test_word[37])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i37.GSR = "DISABLED";
    FD1P3AX test_word_i38 (.D(command_byte_buf[6]), .SP(clk_enable_235), 
            .CK(clk), .Q(test_word[38])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i38.GSR = "DISABLED";
    FD1P3AX test_word_i39 (.D(command_byte_buf[7]), .SP(clk_enable_235), 
            .CK(clk), .Q(test_word[39])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam test_word_i39.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i14 (.D(spi_mosi_buf[1]), .SP(clk_enable_90), 
            .CK(clk), .Q(data_word_buf[14])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i14.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i32 (.D(spi_mosi_buf[1]), .SP(clk_enable_91), 
            .CK(clk), .Q(data_word_buf[32])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i32.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i33 (.D(spi_mosi_buf[1]), .SP(clk_enable_93), 
            .CK(clk), .Q(data_word_buf[33])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i33.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i21 (.D(spi_mosi_buf[1]), .SP(clk_enable_94), 
            .CK(clk), .Q(data_word_buf[21])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i21.GSR = "DISABLED";
    FD1S3JX spi_state_FSM_i0 (.D(n5796), .CK(clk), .PD(n1543[3]), .Q(n1543[0]));   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam spi_state_FSM_i0.GSR = "ENABLED";
    FD1P3AX data_word_buf_i0_i34 (.D(spi_mosi_buf[1]), .SP(clk_enable_97), 
            .CK(clk), .Q(data_word_buf[34])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i34.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i35 (.D(spi_mosi_buf[1]), .SP(clk_enable_98), 
            .CK(clk), .Q(data_word_buf[35])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i35.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i36 (.D(spi_mosi_buf[1]), .SP(clk_enable_99), 
            .CK(clk), .Q(data_word_buf[36])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i36.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i37 (.D(spi_mosi_buf[1]), .SP(clk_enable_100), 
            .CK(clk), .Q(data_word_buf[37])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i37.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i38 (.D(spi_mosi_buf[1]), .SP(clk_enable_101), 
            .CK(clk), .Q(data_word_buf[38])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i38.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i39 (.D(spi_mosi_buf[1]), .SP(clk_enable_102), 
            .CK(clk), .Q(data_word_buf[39])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i39.GSR = "DISABLED";
    FD1P3IX read_memory_141 (.D(n6224), .SP(clk_enable_114), .CD(n4316), 
            .CK(clk), .Q(read_memory)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam read_memory_141.GSR = "ENABLED";
    FD1S3AX spi_state_FSM_i3 (.D(n5082), .CK(clk), .Q(n1543[3]));   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam spi_state_FSM_i3.GSR = "ENABLED";
    FD1S3AX spi_state_FSM_i2 (.D(n5389), .CK(clk), .Q(n1543[2]));   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam spi_state_FSM_i2.GSR = "ENABLED";
    FD1P3AX data_word_buf_i0_i15 (.D(spi_mosi_buf[1]), .SP(clk_enable_137), 
            .CK(clk), .Q(data_word_buf[15])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i15.GSR = "DISABLED";
    FD1S3AX spi_state_FSM_i1 (.D(n2943), .CK(clk), .Q(n1546));   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam spi_state_FSM_i1.GSR = "ENABLED";
    FD1P3AX data_word_buf_i0_i16 (.D(spi_mosi_buf[1]), .SP(clk_enable_141), 
            .CK(clk), .Q(data_word_buf[16])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i16.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i17 (.D(spi_mosi_buf[1]), .SP(clk_enable_160), 
            .CK(clk), .Q(data_word_buf[17])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i17.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i10 (.D(spi_mosi_buf[1]), .SP(clk_enable_161), 
            .CK(clk), .Q(data_word_buf[10])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i10.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i18 (.D(spi_mosi_buf[1]), .SP(clk_enable_162), 
            .CK(clk), .Q(data_word_buf[18])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i18.GSR = "DISABLED";
    FD1P3AX data_word_buf_i0_i19 (.D(spi_mosi_buf[1]), .SP(clk_enable_163), 
            .CK(clk), .Q(data_word_buf[19])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i19.GSR = "DISABLED";
    FD1P3AX command_byte_buf_i0_i0 (.D(spi_mosi_buf[1]), .SP(clk_enable_164), 
            .CK(clk), .Q(command_byte_buf[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam command_byte_buf_i0_i0.GSR = "ENABLED";
    FD1P3AX data_word_buf_i0_i20 (.D(spi_mosi_buf[1]), .SP(clk_enable_166), 
            .CK(clk), .Q(data_word_buf[20])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i20.GSR = "DISABLED";
    PFUMX bit_counter_5__I_0_i63 (.BLUT(n5433), .ALUT(n62), .C0(bit_counter[5]), 
          .Z(spi_miso_N_730)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;
    FD1P3AX memory_in_i0_i31 (.D(data_word_buf[39]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[31])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i31.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i30 (.D(data_word_buf[38]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[30])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i30.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i29 (.D(data_word_buf[37]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[29])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i29.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i28 (.D(data_word_buf[36]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[28])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i28.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i27 (.D(data_word_buf[35]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[27])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i27.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i26 (.D(data_word_buf[34]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[26])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i26.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i25 (.D(data_word_buf[33]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[25])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i25.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i24 (.D(data_word_buf[32]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[24])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i24.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i23 (.D(data_word_buf[31]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[23])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i23.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i22 (.D(data_word_buf[30]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[22])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i22.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i21 (.D(data_word_buf[29]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[21])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i21.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i20 (.D(data_word_buf[28]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[20])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i20.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i19 (.D(data_word_buf[27]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[19])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i19.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i18 (.D(data_word_buf[26]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[18])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i18.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i17 (.D(data_word_buf[25]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[17])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i17.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i16 (.D(data_word_buf[24]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[16])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i16.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i15 (.D(data_word_buf[23]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[15])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i15.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i14 (.D(data_word_buf[22]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[14])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i14.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i13 (.D(data_word_buf[21]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[13])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i13.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i12 (.D(data_word_buf[20]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[12])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i12.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i11 (.D(data_word_buf[19]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[11])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i11.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i10 (.D(data_word_buf[18]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[10])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i10.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i9 (.D(data_word_buf[17]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[9])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i9.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i8 (.D(data_word_buf[16]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[8])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i8.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i7 (.D(data_word_buf[15]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[7])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i7.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i6 (.D(data_word_buf[14]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[6])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i6.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i5 (.D(data_word_buf[13]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[5])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i5.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i4 (.D(data_word_buf[12]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[4])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i4.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i3 (.D(data_word_buf[11]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[3])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i3.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i2 (.D(data_word_buf[10]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[2])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i2.GSR = "DISABLED";
    FD1P3AX memory_in_i0_i1 (.D(data_word_buf[9]), .SP(clk_enable_221), 
            .CK(clk), .Q(memory_in[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam memory_in_i0_i1.GSR = "DISABLED";
    LUT4 i2897_2_lut_rep_93 (.A(bit_counter[1]), .B(bit_counter[0]), .Z(n5918)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2897_2_lut_rep_93.init = 16'h8888;
    L6MUX21 i3943 (.D0(n5429), .D1(n5430), .SD(bit_counter[3]), .Z(n5432));
    LUT4 i4131_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5907), 
         .D(n5923), .Z(clk_enable_43)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4131_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i4111_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5901), 
         .D(n5924), .Z(clk_enable_100)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4111_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i3929_3_lut (.A(test_word[30]), .B(test_word[31]), .C(bit_counter[0]), 
         .Z(n5418)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3929_3_lut.init = 16'hcaca;
    LUT4 i3928_3_lut (.A(test_word[28]), .B(test_word[29]), .C(bit_counter[0]), 
         .Z(n5417)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3928_3_lut.init = 16'hcaca;
    LUT4 i4157_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5910), 
         .D(n5924), .Z(clk_enable_94)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4157_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i3927_3_lut (.A(test_word[26]), .B(test_word[27]), .C(bit_counter[0]), 
         .Z(n5416)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3927_3_lut.init = 16'hcaca;
    LUT4 i4166_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5903), 
         .D(n5924), .Z(clk_enable_45)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4166_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i3926_3_lut (.A(test_word[24]), .B(test_word[25]), .C(bit_counter[0]), 
         .Z(n5415)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3926_3_lut.init = 16'hcaca;
    LUT4 i4134_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5907), 
         .D(n5924), .Z(clk_enable_42)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4134_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i3925_3_lut (.A(test_word[22]), .B(test_word[23]), .C(bit_counter[0]), 
         .Z(n5414)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3925_3_lut.init = 16'hcaca;
    LUT4 i3924_3_lut (.A(test_word[20]), .B(test_word[21]), .C(bit_counter[0]), 
         .Z(n5413)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3924_3_lut.init = 16'hcaca;
    LUT4 i3995_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5910), 
         .D(n5926), .Z(clk_enable_166)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i3995_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i4114_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5901), 
         .D(n5926), .Z(clk_enable_99)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4114_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    FD1P3AX address_memory__i7 (.D(command_byte_buf[6]), .SP(clk_enable_235), 
            .CK(clk), .Q(\address_memory[6] )) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam address_memory__i7.GSR = "DISABLED";
    FD1P3AX address_memory__i6 (.D(command_byte_buf[5]), .SP(clk_enable_235), 
            .CK(clk), .Q(\address_memory[5] )) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam address_memory__i6.GSR = "DISABLED";
    LUT4 i4169_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5903), 
         .D(n5926), .Z(clk_enable_44)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4169_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    FD1P3AX address_memory__i5 (.D(command_byte_buf[4]), .SP(clk_enable_235), 
            .CK(clk), .Q(\address_memory[4] )) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam address_memory__i5.GSR = "DISABLED";
    FD1P3AX address_memory__i4 (.D(command_byte_buf[3]), .SP(clk_enable_235), 
            .CK(clk), .Q(\address_memory[3] )) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam address_memory__i4.GSR = "DISABLED";
    FD1P3AX address_memory__i3 (.D(command_byte_buf[2]), .SP(clk_enable_235), 
            .CK(clk), .Q(\address_memory[2] )) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam address_memory__i3.GSR = "DISABLED";
    LUT4 i4137_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5907), 
         .D(n5926), .Z(clk_enable_7)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4137_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    FD1P3AX address_memory__i2 (.D(command_byte_buf[1]), .SP(clk_enable_235), 
            .CK(clk), .Q(\address_memory[1] )) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam address_memory__i2.GSR = "DISABLED";
    FD1P3AX spi_scs_buf_i0_i1 (.D(spi_scs_buf[0]), .SP(clk_enable_251), 
            .CK(clk), .Q(spi_scs_buf[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam spi_scs_buf_i0_i1.GSR = "DISABLED";
    FD1P3AX spi_mosi_buf_i0_i1 (.D(spi_mosi_buf[0]), .SP(clk_enable_251), 
            .CK(clk), .Q(spi_mosi_buf[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam spi_mosi_buf_i0_i1.GSR = "DISABLED";
    FD1P3AX bit_counter_i5 (.D(n3056), .SP(clk_enable_265), .CK(clk), 
            .Q(bit_counter[5])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam bit_counter_i5.GSR = "ENABLED";
    FD1P3AX bit_counter_i2 (.D(n3062), .SP(clk_enable_265), .CK(clk), 
            .Q(bit_counter[2])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam bit_counter_i2.GSR = "ENABLED";
    FD1P3AX bit_counter_i1 (.D(n3064), .SP(clk_enable_265), .CK(clk), 
            .Q(bit_counter[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam bit_counter_i1.GSR = "ENABLED";
    LUT4 i3923_3_lut (.A(test_word[18]), .B(test_word[19]), .C(bit_counter[0]), 
         .Z(n5412)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3923_3_lut.init = 16'hcaca;
    LUT4 i3922_3_lut (.A(test_word[16]), .B(test_word[17]), .C(bit_counter[0]), 
         .Z(n5411)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3922_3_lut.init = 16'hcaca;
    LUT4 i4140_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5907), 
         .D(n5918), .Z(clk_enable_6)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4140_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    LUT4 i4000_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5910), 
         .D(n5918), .Z(clk_enable_163)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4000_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    L6MUX21 i3942 (.D0(n5427), .D1(n5428), .SD(bit_counter[3]), .Z(n5431));
    LUT4 i4172_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5903), 
         .D(n5918), .Z(clk_enable_40)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4172_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    LUT4 i4117_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5901), 
         .D(n5918), .Z(clk_enable_98)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4117_2_lut_2_lut_3_lut_4_lut.init = 16'h0400;
    LUT4 i3921_3_lut (.A(test_word[14]), .B(test_word[15]), .C(bit_counter[0]), 
         .Z(n5410)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3921_3_lut.init = 16'hcaca;
    LUT4 i4120_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5901), 
         .D(n5923), .Z(clk_enable_97)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4120_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4003_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5910), 
         .D(n5923), .Z(clk_enable_162)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4003_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4175_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5903), 
         .D(n5923), .Z(clk_enable_161)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4175_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    L6MUX21 i3913 (.D0(n5400), .D1(n5401), .SD(bit_counter[2]), .Z(n5402));
    LUT4 i4143_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5907), 
         .D(n5923), .Z(clk_enable_5)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4143_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i3920_3_lut (.A(test_word[12]), .B(test_word[13]), .C(bit_counter[0]), 
         .Z(n5409)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3920_3_lut.init = 16'hcaca;
    LUT4 i4006_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5910), 
         .D(n5924), .Z(clk_enable_160)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4006_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4178_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5903), 
         .D(n5924), .Z(clk_enable_262)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4178_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4123_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5901), 
         .D(n5924), .Z(clk_enable_93)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4123_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i4146_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5909), .C(n5907), 
         .D(n5924), .Z(clk_enable_4)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i4146_2_lut_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i3919_3_lut (.A(test_word[10]), .B(test_word[11]), .C(bit_counter[0]), 
         .Z(n5408)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3919_3_lut.init = 16'hcaca;
    LUT4 i3918_3_lut (.A(test_word[8]), .B(test_word[9]), .C(bit_counter[0]), 
         .Z(n5407)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3918_3_lut.init = 16'hcaca;
    LUT4 i4190_2_lut_3_lut_3_lut_4_lut (.A(n5930), .B(n1546), .C(bit_counter[2]), 
         .D(n5926), .Z(clk_enable_254)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam i4190_2_lut_3_lut_3_lut_4_lut.init = 16'h0080;
    LUT4 i4188_2_lut_3_lut_3_lut_4_lut (.A(n5930), .B(n1546), .C(bit_counter[2]), 
         .D(n5924), .Z(clk_enable_255)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam i4188_2_lut_3_lut_3_lut_4_lut.init = 16'h0080;
    LUT4 i4186_2_lut_3_lut_3_lut_4_lut (.A(n5930), .B(n1546), .C(bit_counter[2]), 
         .D(n5923), .Z(clk_enable_256)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam i4186_2_lut_3_lut_3_lut_4_lut.init = 16'h0080;
    LUT4 i3917_3_lut (.A(test_word[6]), .B(test_word[7]), .C(bit_counter[0]), 
         .Z(n5406)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3917_3_lut.init = 16'hcaca;
    LUT4 i3915_3_lut (.A(test_word[2]), .B(test_word[3]), .C(bit_counter[0]), 
         .Z(n5404)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3915_3_lut.init = 16'hcaca;
    LUT4 i3916_3_lut (.A(test_word[4]), .B(test_word[5]), .C(bit_counter[0]), 
         .Z(n5405)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3916_3_lut.init = 16'hcaca;
    LUT4 i4192_2_lut_2_lut_3_lut_4_lut (.A(n5930), .B(n1546), .C(n5918), 
         .D(bit_counter[2]), .Z(clk_enable_253)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam i4192_2_lut_2_lut_3_lut_4_lut.init = 16'h0080;
    LUT4 i4195_2_lut_2_lut_3_lut_4_lut (.A(n5930), .B(n1546), .C(n5923), 
         .D(bit_counter[2]), .Z(clk_enable_252)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam i4195_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i4198_2_lut_2_lut_3_lut_4_lut (.A(n5930), .B(n1546), .C(n5924), 
         .D(bit_counter[2]), .Z(clk_enable_250)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam i4198_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i4105_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[5]), .B(n5916), .C(n5908), 
         .D(n5909), .Z(clk_enable_102)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i4105_2_lut_2_lut_3_lut_4_lut.init = 16'h2000;
    LUT4 i4126_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[5]), .B(n5916), .C(n5906), 
         .D(n5909), .Z(clk_enable_91)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i4126_2_lut_2_lut_3_lut_4_lut.init = 16'h0200;
    LUT4 i3910_3_lut (.A(test_word[38]), .B(test_word[39]), .C(bit_counter[0]), 
         .Z(n5399)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3910_3_lut.init = 16'hcaca;
    LUT4 i3909_3_lut (.A(test_word[36]), .B(test_word[37]), .C(bit_counter[0]), 
         .Z(n5398)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3909_3_lut.init = 16'hcaca;
    LUT4 i3_3_lut_rep_74_4_lut_4_lut (.A(n5930), .B(n5906), .C(n5917), 
         .D(bit_counter[3]), .Z(n5899)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // d:/git/jojo_endat/spi_slave.vhd(134[29:47])
    defparam i3_3_lut_rep_74_4_lut_4_lut.init = 16'hfffd;
    LUT4 i1_2_lut_rep_69_4_lut_4_lut (.A(n5930), .B(n1546), .C(n5906), 
         .D(n5902), .Z(n5894)) /* synthesis lut_function=(A (B (C+(D)))+!A (B)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(134[29:47])
    defparam i1_2_lut_rep_69_4_lut_4_lut.init = 16'hccc4;
    LUT4 i4181_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[3]), .B(n5917), .C(n5906), 
         .D(n5909), .Z(clk_enable_260)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i4181_2_lut_2_lut_3_lut_4_lut.init = 16'h0200;
    PFUMX i3930 (.BLUT(n5403), .ALUT(n5404), .C0(bit_counter[1]), .Z(n5419));
    LUT4 i4055_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[3]), .B(n5917), .C(n5908), 
         .D(n5909), .Z(clk_enable_137)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i4055_2_lut_2_lut_3_lut_4_lut.init = 16'h2000;
    LUT4 i3908_3_lut (.A(test_word[34]), .B(test_word[35]), .C(bit_counter[0]), 
         .Z(n5397)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3908_3_lut.init = 16'hcaca;
    LUT4 i3907_3_lut (.A(test_word[32]), .B(test_word[33]), .C(bit_counter[0]), 
         .Z(n5396)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3907_3_lut.init = 16'hcaca;
    LUT4 n1547_bdd_4_lut (.A(n1543[0]), .B(spi_scs_buf[1]), .C(n6), .D(spi_scs_buf[0]), 
         .Z(n5796)) /* synthesis lut_function=(A ((D)+!B)+!A !(B+!(C (D)))) */ ;
    defparam n1547_bdd_4_lut.init = 16'hba22;
    LUT4 i4047_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5926), .C(n5910), 
         .D(n5909), .Z(clk_enable_141)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(134[9:24])
    defparam i4047_2_lut_2_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i4149_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5926), .C(n5907), 
         .D(n5909), .Z(clk_enable_2)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(134[9:24])
    defparam i4149_2_lut_2_lut_3_lut_4_lut.init = 16'h0100;
    L6MUX21 i3938 (.D0(n5419), .D1(n5420), .SD(bit_counter[2]), .Z(n5427));
    LUT4 i3997_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5926), .C(n1546), 
         .D(n5930), .Z(clk_enable_164)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(134[9:24])
    defparam i3997_2_lut_2_lut_3_lut_4_lut.init = 16'h1000;
    LUT4 i3914_3_lut (.A(test_word[0]), .B(test_word[1]), .C(bit_counter[0]), 
         .Z(n5403)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3914_3_lut.init = 16'hcaca;
    LUT4 i4128_2_lut_2_lut_3_lut_4_lut (.A(bit_counter[3]), .B(n5928), .C(n5908), 
         .D(n5909), .Z(clk_enable_50)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i4128_2_lut_2_lut_3_lut_4_lut.init = 16'h2000;
    LUT4 i1_2_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5918), .C(n1546), 
         .D(n5930), .Z(clk_enable_257)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'h8000;
    L6MUX21 i3939 (.D0(n5421), .D1(n5422), .SD(bit_counter[2]), .Z(n5428));
    L6MUX21 i3940 (.D0(n5423), .D1(n5424), .SD(bit_counter[2]), .Z(n5429));
    LUT4 i4151_2_lut_3_lut_3_lut_4_lut (.A(bit_counter[2]), .B(n5918), .C(n5909), 
         .D(n5910), .Z(clk_enable_1)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;
    defparam i4151_2_lut_3_lut_3_lut_4_lut.init = 16'h0080;
    L6MUX21 i3941 (.D0(n5425), .D1(n5426), .SD(bit_counter[2]), .Z(n5430));
    FD1P3AX data_word_buf_i0_i22 (.D(spi_mosi_buf[1]), .SP(clk_enable_249), 
            .CK(clk), .Q(data_word_buf[22])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i22.GSR = "DISABLED";
    PFUMX i3911 (.BLUT(n5396), .ALUT(n5397), .C0(bit_counter[1]), .Z(n5400));
    PFUMX i3912 (.BLUT(n5398), .ALUT(n5399), .C0(bit_counter[1]), .Z(n5401));
    LUT4 i4201_3_lut (.A(n1543[3]), .B(command_byte_buf[7]), .C(n5899), 
         .Z(clk_enable_114)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i4201_3_lut.init = 16'h0101;
    LUT4 i3992_2_lut (.A(n1546), .B(n1543[3]), .Z(n4316)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam i3992_2_lut.init = 16'h1111;
    PFUMX i3931 (.BLUT(n5405), .ALUT(n5406), .C0(bit_counter[1]), .Z(n5420));
    CCU2D add_928_7 (.A0(bit_counter[5]), .B0(n5902), .C0(n5906), .D0(n5930), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n5041), 
          .S0(bit_counter_5__N_571[5]));   // d:/git/jojo_endat/spi_slave.vhd(126[6] 128[13])
    defparam add_928_7.INIT0 = 16'h56aa;
    defparam add_928_7.INIT1 = 16'h0000;
    defparam add_928_7.INJECT1_0 = "NO";
    defparam add_928_7.INJECT1_1 = "NO";
    CCU2D add_928_5 (.A0(bit_counter[3]), .B0(n5902), .C0(n5906), .D0(n5930), 
          .A1(bit_counter[4]), .B1(n5902), .C1(n5906), .D1(n5930), .CIN(n5040), 
          .COUT(n5041), .S0(bit_counter_5__N_571[3]), .S1(bit_counter_5__N_571[4]));   // d:/git/jojo_endat/spi_slave.vhd(126[6] 128[13])
    defparam add_928_5.INIT0 = 16'h56aa;
    defparam add_928_5.INIT1 = 16'h56aa;
    defparam add_928_5.INJECT1_0 = "NO";
    defparam add_928_5.INJECT1_1 = "NO";
    LUT4 i3901_4_lut (.A(n5372), .B(n1546), .C(n1543[2]), .D(n5899), 
         .Z(n5389)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))) */ ;
    defparam i3901_4_lut.init = 16'ha088;
    LUT4 i3885_2_lut (.A(spi_scs_buf[0]), .B(spi_scs_buf[1]), .Z(n5372)) /* synthesis lut_function=((B)+!A) */ ;
    defparam i3885_2_lut.init = 16'hdddd;
    LUT4 i3944_3_lut (.A(n5431), .B(n5432), .C(bit_counter[4]), .Z(n5433)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i3944_3_lut.init = 16'hcaca;
    FD1P3AX command_byte_buf_i0_i1 (.D(spi_mosi_buf[1]), .SP(clk_enable_250), 
            .CK(clk), .Q(command_byte_buf[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam command_byte_buf_i0_i1.GSR = "ENABLED";
    PFUMX i3932 (.BLUT(n5407), .ALUT(n5408), .C0(bit_counter[1]), .Z(n5421));
    LUT4 i1_2_lut_rep_91 (.A(bit_counter[3]), .B(bit_counter[4]), .Z(n5916)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i1_2_lut_rep_91.init = 16'heeee;
    LUT4 i1_2_lut_rep_83_3_lut (.A(bit_counter[1]), .B(bit_counter[0]), 
         .C(bit_counter[2]), .Z(n5908)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_rep_83_3_lut.init = 16'h8080;
    LUT4 i1_2_lut (.A(n1546), .B(n1543[2]), .Z(n6)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i2938_2_lut_3_lut_4_lut (.A(n1546), .B(n5899), .C(bit_counter_5__N_571[2]), 
         .D(n1543[2]), .Z(n3062)) /* synthesis lut_function=(A (B (C)+!B (C+!(D)))+!A (C+!(D))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(97[6] 103[13])
    defparam i2938_2_lut_3_lut_4_lut.init = 16'hf0f7;
    LUT4 i2939_2_lut_3_lut_4_lut (.A(n1546), .B(n5899), .C(bit_counter_5__N_571[1]), 
         .D(n1543[2]), .Z(n3064)) /* synthesis lut_function=(A (B (C)+!B (C+!(D)))+!A (C+!(D))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(97[6] 103[13])
    defparam i2939_2_lut_3_lut_4_lut.init = 16'hf0f7;
    LUT4 i4184_2_lut_3_lut_4_lut (.A(n1546), .B(n5899), .C(n1543[3]), 
         .D(n1543[2]), .Z(n4353)) /* synthesis lut_function=(!(A (B+(C+(D)))+!A (C+(D)))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(97[6] 103[13])
    defparam i4184_2_lut_3_lut_4_lut.init = 16'h0007;
    LUT4 equal_624_i10_2_lut_rep_78_3_lut (.A(bit_counter[4]), .B(bit_counter[5]), 
         .C(bit_counter[3]), .Z(n5903)) /* synthesis lut_function=(A+(B+!(C))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(126[9:25])
    defparam equal_624_i10_2_lut_rep_78_3_lut.init = 16'hefef;
    LUT4 i2_2_lut_rep_77_3_lut (.A(bit_counter[4]), .B(bit_counter[5]), 
         .C(bit_counter[3]), .Z(n5902)) /* synthesis lut_function=(A+(B+(C))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(126[9:25])
    defparam i2_2_lut_rep_77_3_lut.init = 16'hfefe;
    LUT4 i2940_2_lut_3_lut_4_lut (.A(n1546), .B(n5899), .C(bit_counter_5__N_571[0]), 
         .D(n1543[2]), .Z(n2946)) /* synthesis lut_function=(A (B (C)+!B (C+!(D)))+!A (C+!(D))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(97[6] 103[13])
    defparam i2940_2_lut_3_lut_4_lut.init = 16'hf0f7;
    LUT4 i2_2_lut_rep_76_3_lut (.A(bit_counter[3]), .B(bit_counter[4]), 
         .C(bit_counter[5]), .Z(n5901)) /* synthesis lut_function=(A+(B+!(C))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i2_2_lut_rep_76_3_lut.init = 16'hefef;
    LUT4 i2_3_lut_4_lut (.A(spi_scs_buf[0]), .B(spi_scs_buf[1]), .C(n5899), 
         .D(n1543[2]), .Z(n5082)) /* synthesis lut_function=(!(A ((C+!(D))+!B)+!A (C+!(D)))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(139[9:27])
    defparam i2_3_lut_4_lut.init = 16'h0d00;
    LUT4 not_equal_88_i9_2_lut_rep_92 (.A(bit_counter[4]), .B(bit_counter[5]), 
         .Z(n5917)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(126[9:25])
    defparam not_equal_88_i9_2_lut_rep_92.init = 16'heeee;
    LUT4 i1603_4_lut_4_lut (.A(n1546), .B(n5899), .C(n1543[2]), .D(bit_counter_5__N_571[5]), 
         .Z(n3056)) /* synthesis lut_function=(A (B (D)+!B ((D)+!C))+!A (C (D))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(97[6] 103[13])
    defparam i1603_4_lut_4_lut.init = 16'hfa02;
    LUT4 i12_3_lut_4_lut (.A(n5899), .B(command_byte_buf[7]), .C(n1543[2]), 
         .D(n1546), .Z(clk_enable_264)) /* synthesis lut_function=(!(A (C+(D))+!A !(B (C+!(D))+!B !(C+(D))))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(134[9:77])
    defparam i12_3_lut_4_lut.init = 16'h404f;
    LUT4 i2860_2_lut_3_lut (.A(n5899), .B(command_byte_buf[7]), .C(n1543[2]), 
         .Z(write_memory_N_725)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(134[9:77])
    defparam i2860_2_lut_3_lut.init = 16'h4040;
    PFUMX i3933 (.BLUT(n5409), .ALUT(n5410), .C0(bit_counter[1]), .Z(n5422));
    LUT4 i2875_2_lut_3_lut (.A(bit_counter[3]), .B(bit_counter[4]), .C(n5402), 
         .Z(n62)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i2875_2_lut_3_lut.init = 16'h1010;
    LUT4 i1_2_lut_rep_98 (.A(bit_counter[0]), .B(bit_counter[1]), .Z(n5923)) /* synthesis lut_function=(A+!(B)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i1_2_lut_rep_98.init = 16'hbbbb;
    LUT4 i1_2_lut_rep_99 (.A(bit_counter[1]), .B(bit_counter[0]), .Z(n5924)) /* synthesis lut_function=(A+!(B)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(126[9:25])
    defparam i1_2_lut_rep_99.init = 16'hbbbb;
    CCU2D add_928_3 (.A0(bit_counter[1]), .B0(n5902), .C0(n5906), .D0(n5930), 
          .A1(bit_counter[2]), .B1(n5902), .C1(n5906), .D1(n5930), .CIN(n5039), 
          .COUT(n5040), .S0(bit_counter_5__N_571[1]), .S1(bit_counter_5__N_571[2]));   // d:/git/jojo_endat/spi_slave.vhd(126[6] 128[13])
    defparam add_928_3.INIT0 = 16'h56aa;
    defparam add_928_3.INIT1 = 16'h56aa;
    defparam add_928_3.INJECT1_0 = "NO";
    defparam add_928_3.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_101 (.A(bit_counter[0]), .B(bit_counter[1]), .Z(n5926)) /* synthesis lut_function=(A+(B)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i1_2_lut_rep_101.init = 16'heeee;
    LUT4 i1_2_lut_rep_81_3_lut (.A(bit_counter[0]), .B(bit_counter[1]), 
         .C(bit_counter[2]), .Z(n5906)) /* synthesis lut_function=(A+(B+(C))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(90[24:35])
    defparam i1_2_lut_rep_81_3_lut.init = 16'hfefe;
    LUT4 i1_2_lut_rep_103 (.A(bit_counter[5]), .B(bit_counter[4]), .Z(n5928)) /* synthesis lut_function=(A+!(B)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i1_2_lut_rep_103.init = 16'hbbbb;
    LUT4 i1_2_lut_rep_82_3_lut (.A(bit_counter[5]), .B(bit_counter[4]), 
         .C(bit_counter[3]), .Z(n5907)) /* synthesis lut_function=(A+!(B (C))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i1_2_lut_rep_82_3_lut.init = 16'hbfbf;
    LUT4 i1_2_lut_rep_85_3_lut (.A(bit_counter[5]), .B(bit_counter[4]), 
         .C(bit_counter[3]), .Z(n5910)) /* synthesis lut_function=(A+((C)+!B)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(123[21:32])
    defparam i1_2_lut_rep_85_3_lut.init = 16'hfbfb;
    LUT4 i1493_4_lut_4_lut (.A(spi_scs_buf[0]), .B(spi_scs_buf[1]), .C(n5894), 
         .D(n1543[0]), .Z(n2943)) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B (C))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam i1493_4_lut_4_lut.init = 16'hd4d0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_137 (.A(reset), .B(n1543[2]), .C(command_byte_buf[7]), 
         .D(n5899), .Z(clk_enable_221)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam i1_2_lut_3_lut_4_lut_adj_137.init = 16'h0040;
    FD1P3AX spi_sck_buf_i0_i1 (.D(spi_sck_buf[0]), .SP(clk_enable_251), 
            .CK(clk), .Q(spi_sck_buf[1])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam spi_sck_buf_i0_i1.GSR = "DISABLED";
    LUT4 i4017_2_lut_rep_105 (.A(spi_sck_buf[0]), .B(spi_sck_buf[1]), .Z(n5930)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(134[29:47])
    defparam i4017_2_lut_rep_105.init = 16'h2222;
    FD1P3AX command_byte_buf_i0_i2 (.D(spi_mosi_buf[1]), .SP(clk_enable_252), 
            .CK(clk), .Q(command_byte_buf[2])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam command_byte_buf_i0_i2.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_84_3_lut_4_lut (.A(spi_sck_buf[0]), .B(spi_sck_buf[1]), 
         .C(n1543[2]), .D(reset), .Z(n5909)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(134[29:47])
    defparam i1_2_lut_rep_84_3_lut_4_lut.init = 16'h0020;
    FD1P3AX command_byte_buf_i0_i3 (.D(spi_mosi_buf[1]), .SP(clk_enable_253), 
            .CK(clk), .Q(command_byte_buf[3])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam command_byte_buf_i0_i3.GSR = "ENABLED";
    FD1P3AX command_byte_buf_i0_i4 (.D(spi_mosi_buf[1]), .SP(clk_enable_254), 
            .CK(clk), .Q(command_byte_buf[4])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam command_byte_buf_i0_i4.GSR = "ENABLED";
    FD1P3AX command_byte_buf_i0_i5 (.D(spi_mosi_buf[1]), .SP(clk_enable_255), 
            .CK(clk), .Q(command_byte_buf[5])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam command_byte_buf_i0_i5.GSR = "ENABLED";
    FD1P3AX command_byte_buf_i0_i6 (.D(spi_mosi_buf[1]), .SP(clk_enable_256), 
            .CK(clk), .Q(command_byte_buf[6])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam command_byte_buf_i0_i6.GSR = "ENABLED";
    FD1P3AX command_byte_buf_i0_i7 (.D(spi_mosi_buf[1]), .SP(clk_enable_257), 
            .CK(clk), .Q(command_byte_buf[7])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam command_byte_buf_i0_i7.GSR = "ENABLED";
    FD1P3IX bit_counter_i3 (.D(bit_counter_5__N_571[3]), .SP(clk_enable_265), 
            .CD(n4353), .CK(clk), .Q(bit_counter[3])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam bit_counter_i3.GSR = "ENABLED";
    FD1P3IX bit_counter_i4 (.D(bit_counter_5__N_571[4]), .SP(clk_enable_265), 
            .CD(n4353), .CK(clk), .Q(bit_counter[4])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam bit_counter_i4.GSR = "ENABLED";
    LUT4 i1062_1_lut (.A(n1543[3]), .Z(clk_enable_265)) /* synthesis lut_function=(!(A)) */ ;   // d:/git/jojo_endat/spi_slave.vhd(70[4] 147[13])
    defparam i1062_1_lut.init = 16'h5555;
    PFUMX i3934 (.BLUT(n5411), .ALUT(n5412), .C0(bit_counter[1]), .Z(n5423));
    FD1P3AX data_word_buf_i0_i8 (.D(spi_mosi_buf[1]), .SP(clk_enable_260), 
            .CK(clk), .Q(data_word_buf[8])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i8.GSR = "DISABLED";
    LUT4 i4204_4_lut (.A(n1543[3]), .B(spi_sck_buf[0]), .C(n6), .D(spi_sck_buf[1]), 
         .Z(clk_enable_263)) /* synthesis lut_function=(!(A+(B (C)+!B !((D)+!C)))) */ ;
    defparam i4204_4_lut.init = 16'h1505;
    LUT4 i1381_4_lut (.A(n1546), .B(spi_miso_N_730), .C(n1543[2]), .D(n1543[3]), 
         .Z(n2827)) /* synthesis lut_function=(A (B+!(C+(D)))+!A (B (C+(D)))) */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam i1381_4_lut.init = 16'hccca;
    FD1P3AX data_word_buf_i0_i9 (.D(spi_mosi_buf[1]), .SP(clk_enable_262), 
            .CK(clk), .Q(data_word_buf[9])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam data_word_buf_i0_i9.GSR = "DISABLED";
    FD1P3AX spi_miso_buf_139 (.D(n2827), .SP(clk_enable_263), .CK(clk), 
            .Q(spi_miso_c)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam spi_miso_buf_139.GSR = "ENABLED";
    FD1P3AX write_memory_140 (.D(write_memory_N_725), .SP(clk_enable_264), 
            .CK(clk), .Q(write_memory)) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam write_memory_140.GSR = "ENABLED";
    FD1P3AX bit_counter_i0 (.D(n2946), .SP(clk_enable_265), .CK(clk), 
            .Q(bit_counter[0])) /* synthesis LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=17, LSE_LLINE=96, LSE_RLINE=96 */ ;   // d:/git/jojo_endat/spi_slave.vhd(49[3] 149[10])
    defparam bit_counter_i0.GSR = "ENABLED";
    PFUMX i3935 (.BLUT(n5413), .ALUT(n5414), .C0(bit_counter[1]), .Z(n5424));
    CCU2D add_928_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(bit_counter[0]), .B1(n5902), .C1(n5906), .D1(n5930), .COUT(n5039), 
          .S1(bit_counter_5__N_571[0]));   // d:/git/jojo_endat/spi_slave.vhd(126[6] 128[13])
    defparam add_928_1.INIT0 = 16'hF000;
    defparam add_928_1.INIT1 = 16'h56aa;
    defparam add_928_1.INJECT1_0 = "NO";
    defparam add_928_1.INJECT1_1 = "NO";
    PFUMX i3936 (.BLUT(n5415), .ALUT(n5416), .C0(bit_counter[1]), .Z(n5425));
    PFUMX i3937 (.BLUT(n5417), .ALUT(n5418), .C0(bit_counter[1]), .Z(n5426));
    LUT4 i4108_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5901), 
         .D(n5923), .Z(clk_enable_101)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4108_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i4154_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5910), 
         .D(n5923), .Z(clk_enable_249)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4154_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i4160_2_lut_2_lut_3_lut_4_lut (.A(n5909), .B(bit_counter[2]), .C(n5903), 
         .D(n5923), .Z(clk_enable_90)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4160_2_lut_2_lut_3_lut_4_lut.init = 16'h0008;
    
endmodule
//
// Verilog Description of module pll
//

module pll (clki_c, clk, GND_net) /* synthesis NGD_DRC_MASK=1 */ ;
    input clki_c;
    output clk;
    input GND_net;
    
    wire clki_c /* synthesis is_clock=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(14[10:14])
    wire clk /* synthesis SET_AS_NETWORK=clk, is_clock=1 */ ;   // d:/git/jojo_endat/encodertop.vhd(35[16:19])
    
    EHXPLLJ PLLInst_0 (.CLKI(clki_c), .CLKFB(clk), .PHASESEL0(GND_net), 
            .PHASESEL1(GND_net), .PHASEDIR(GND_net), .PHASESTEP(GND_net), 
            .LOADREG(GND_net), .STDBY(GND_net), .PLLWAKESYNC(GND_net), 
            .RST(GND_net), .RESETC(GND_net), .RESETD(GND_net), .RESETM(GND_net), 
            .ENCLKOP(GND_net), .ENCLKOS(GND_net), .ENCLKOS2(GND_net), 
            .ENCLKOS3(GND_net), .PLLCLK(GND_net), .PLLRST(GND_net), .PLLSTB(GND_net), 
            .PLLWE(GND_net), .PLLDATI0(GND_net), .PLLDATI1(GND_net), .PLLDATI2(GND_net), 
            .PLLDATI3(GND_net), .PLLDATI4(GND_net), .PLLDATI5(GND_net), 
            .PLLDATI6(GND_net), .PLLDATI7(GND_net), .PLLADDR0(GND_net), 
            .PLLADDR1(GND_net), .PLLADDR2(GND_net), .PLLADDR3(GND_net), 
            .PLLADDR4(GND_net), .CLKOP(clk)) /* synthesis FREQUENCY_PIN_CLKOP="100.000000", FREQUENCY_PIN_CLKI="25.000000", ICP_CURRENT="7", LPF_RESISTOR="8", syn_instantiated=1, LSE_LINE_FILE_ID=37, LSE_LCOL=8, LSE_RCOL=11, LSE_LLINE=91, LSE_RLINE=91 */ ;   // d:/git/jojo_endat/encodertop.vhd(91[8:11])
    defparam PLLInst_0.CLKI_DIV = 1;
    defparam PLLInst_0.CLKFB_DIV = 4;
    defparam PLLInst_0.CLKOP_DIV = 5;
    defparam PLLInst_0.CLKOS_DIV = 1;
    defparam PLLInst_0.CLKOS2_DIV = 1;
    defparam PLLInst_0.CLKOS3_DIV = 1;
    defparam PLLInst_0.CLKOP_ENABLE = "ENABLED";
    defparam PLLInst_0.CLKOS_ENABLE = "DISABLED";
    defparam PLLInst_0.CLKOS2_ENABLE = "DISABLED";
    defparam PLLInst_0.CLKOS3_ENABLE = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_A0 = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_B0 = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_C0 = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_D0 = "DISABLED";
    defparam PLLInst_0.CLKOP_CPHASE = 4;
    defparam PLLInst_0.CLKOS_CPHASE = 0;
    defparam PLLInst_0.CLKOS2_CPHASE = 0;
    defparam PLLInst_0.CLKOS3_CPHASE = 0;
    defparam PLLInst_0.CLKOP_FPHASE = 0;
    defparam PLLInst_0.CLKOS_FPHASE = 0;
    defparam PLLInst_0.CLKOS2_FPHASE = 0;
    defparam PLLInst_0.CLKOS3_FPHASE = 0;
    defparam PLLInst_0.FEEDBK_PATH = "CLKOP";
    defparam PLLInst_0.FRACN_ENABLE = "DISABLED";
    defparam PLLInst_0.FRACN_DIV = 0;
    defparam PLLInst_0.CLKOP_TRIM_POL = "RISING";
    defparam PLLInst_0.CLKOP_TRIM_DELAY = 0;
    defparam PLLInst_0.CLKOS_TRIM_POL = "FALLING";
    defparam PLLInst_0.CLKOS_TRIM_DELAY = 0;
    defparam PLLInst_0.PLL_USE_WB = "DISABLED";
    defparam PLLInst_0.PREDIVIDER_MUXA1 = 0;
    defparam PLLInst_0.PREDIVIDER_MUXB1 = 0;
    defparam PLLInst_0.PREDIVIDER_MUXC1 = 0;
    defparam PLLInst_0.PREDIVIDER_MUXD1 = 0;
    defparam PLLInst_0.OUTDIVIDER_MUXA2 = "DIVA";
    defparam PLLInst_0.OUTDIVIDER_MUXB2 = "DIVB";
    defparam PLLInst_0.OUTDIVIDER_MUXC2 = "DIVC";
    defparam PLLInst_0.OUTDIVIDER_MUXD2 = "DIVD";
    defparam PLLInst_0.PLL_LOCK_MODE = 0;
    defparam PLLInst_0.STDBY_ENABLE = "DISABLED";
    defparam PLLInst_0.DPHASE_SOURCE = "DISABLED";
    defparam PLLInst_0.PLLRST_ENA = "DISABLED";
    defparam PLLInst_0.MRST_ENA = "DISABLED";
    defparam PLLInst_0.DCRST_ENA = "DISABLED";
    defparam PLLInst_0.DDRST_ENA = "DISABLED";
    defparam PLLInst_0.INTFB_WAKE = "DISABLED";
    
endmodule
