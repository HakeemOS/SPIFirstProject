// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Sep 21 09:00:33 2023
// Host        : DESKTOP-PJ7659C running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/squid/OneDrive/Documents/Vivado/2023/SPIFirstProject/SPIFirstProject.sim/sim_1/synth/timing/xsim/spiMaster_tb_time_synth.v
// Design      : spiMaster_s
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module SPI_Rx
   (RxValid_t,
    D,
    CLK,
    rst_IBUF,
    clkSPI,
    cDetect,
    TxReady_OBUF,
    startOUT,
    RxMisoBit_IBUF,
    RxValid_t_reg_0);
  output RxValid_t;
  output [7:0]D;
  input CLK;
  input rst_IBUF;
  input clkSPI;
  input cDetect;
  input TxReady_OBUF;
  input startOUT;
  input RxMisoBit_IBUF;
  input RxValid_t_reg_0;

  wire CLK;
  wire [7:0]D;
  wire RxFlag;
  wire RxFlag_i_1_n_0;
  wire RxMisoBit_IBUF;
  wire \RxMisoData_t[0]_i_1_n_0 ;
  wire \RxMisoData_t[1]_i_1_n_0 ;
  wire \RxMisoData_t[2]_i_1_n_0 ;
  wire \RxMisoData_t[3]_i_1_n_0 ;
  wire \RxMisoData_t[3]_i_2_n_0 ;
  wire \RxMisoData_t[4]_i_1_n_0 ;
  wire \RxMisoData_t[4]_i_2_n_0 ;
  wire \RxMisoData_t[5]_i_1_n_0 ;
  wire \RxMisoData_t[5]_i_2_n_0 ;
  wire \RxMisoData_t[6]_i_1_n_0 ;
  wire \RxMisoData_t[7]_i_1_n_0 ;
  wire \RxMisoData_t[7]_i_2_n_0 ;
  wire \RxMisoData_t[7]_i_3_n_0 ;
  wire \RxMisoData_t[7]_i_4_n_0 ;
  wire RxValid_t;
  wire RxValid_t_i_1_n_0;
  wire RxValid_t_reg_0;
  wire TxReady_OBUF;
  wire [7:0]a;
  wire bitIndex;
  wire \bitIndex[0]_i_1__0_n_0 ;
  wire \bitIndex[1]_i_1__0_n_0 ;
  wire \bitIndex[2]_i_1__0_n_0 ;
  wire \bitIndex[4]_i_2__0_n_0 ;
  wire \bitIndex[4]_i_3__0_n_0 ;
  wire \bitIndex[4]_i_4_n_0 ;
  wire \bitIndex[4]_i_5_n_0 ;
  wire \bitIndex_reg_n_0_[0] ;
  wire \bitIndex_reg_n_0_[1] ;
  wire \bitIndex_reg_n_0_[2] ;
  wire \bitIndex_reg_n_0_[4] ;
  wire cDetect;
  wire clkSPI;
  wire rst_IBUF;
  wire sampleDelay;
  wire sampleDelay_i_1_n_0;
  wire sampleFlag;
  wire sampleFlag_reg_n_0;
  wire startOUT;

  LUT6 #(
    .INIT(64'h0EEEEEEEEEEEEEEE)) 
    RxFlag_i_1
       (.I0(startOUT),
        .I1(RxFlag),
        .I2(\bitIndex_reg_n_0_[4] ),
        .I3(\bitIndex_reg_n_0_[2] ),
        .I4(\bitIndex_reg_n_0_[1] ),
        .I5(\bitIndex_reg_n_0_[0] ),
        .O(RxFlag_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    RxFlag_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(RxFlag_i_1_n_0),
        .Q(RxFlag));
  LUT6 #(
    .INIT(64'hAAAAFEFFAAAA0200)) 
    \RxMisoData_t[0]_i_1 
       (.I0(\RxMisoData_t[7]_i_2_n_0 ),
        .I1(\bitIndex_reg_n_0_[0] ),
        .I2(\bitIndex_reg_n_0_[1] ),
        .I3(\RxMisoData_t[3]_i_2_n_0 ),
        .I4(\bitIndex[4]_i_3__0_n_0 ),
        .I5(a[0]),
        .O(\RxMisoData_t[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAFFBFAAAA0080)) 
    \RxMisoData_t[1]_i_1 
       (.I0(\RxMisoData_t[7]_i_2_n_0 ),
        .I1(\RxMisoData_t[3]_i_2_n_0 ),
        .I2(\bitIndex_reg_n_0_[0] ),
        .I3(\bitIndex_reg_n_0_[1] ),
        .I4(\bitIndex[4]_i_3__0_n_0 ),
        .I5(a[1]),
        .O(\RxMisoData_t[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAFFBFAAAA0080)) 
    \RxMisoData_t[2]_i_1 
       (.I0(\RxMisoData_t[7]_i_2_n_0 ),
        .I1(\RxMisoData_t[3]_i_2_n_0 ),
        .I2(\bitIndex_reg_n_0_[1] ),
        .I3(\bitIndex_reg_n_0_[0] ),
        .I4(\bitIndex[4]_i_3__0_n_0 ),
        .I5(a[2]),
        .O(\RxMisoData_t[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAABFFFAAAA8000)) 
    \RxMisoData_t[3]_i_1 
       (.I0(\RxMisoData_t[7]_i_2_n_0 ),
        .I1(\RxMisoData_t[3]_i_2_n_0 ),
        .I2(\bitIndex_reg_n_0_[0] ),
        .I3(\bitIndex_reg_n_0_[1] ),
        .I4(\bitIndex[4]_i_3__0_n_0 ),
        .I5(a[3]),
        .O(\RxMisoData_t[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \RxMisoData_t[3]_i_2 
       (.I0(\bitIndex_reg_n_0_[4] ),
        .I1(RxFlag),
        .I2(sampleFlag_reg_n_0),
        .I3(\bitIndex_reg_n_0_[2] ),
        .O(\RxMisoData_t[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAABFFFAAAA8000)) 
    \RxMisoData_t[4]_i_1 
       (.I0(\RxMisoData_t[7]_i_2_n_0 ),
        .I1(\RxMisoData_t[7]_i_4_n_0 ),
        .I2(\RxMisoData_t[4]_i_2_n_0 ),
        .I3(\bitIndex_reg_n_0_[2] ),
        .I4(\bitIndex[4]_i_3__0_n_0 ),
        .I5(a[4]),
        .O(\RxMisoData_t[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \RxMisoData_t[4]_i_2 
       (.I0(\bitIndex_reg_n_0_[0] ),
        .I1(\bitIndex_reg_n_0_[1] ),
        .O(\RxMisoData_t[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h080808FF08080800)) 
    \RxMisoData_t[5]_i_1 
       (.I0(RxMisoBit_IBUF),
        .I1(RxFlag),
        .I2(\bitIndex_reg_n_0_[4] ),
        .I3(\RxMisoData_t[5]_i_2_n_0 ),
        .I4(\bitIndex[4]_i_3__0_n_0 ),
        .I5(a[5]),
        .O(\RxMisoData_t[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    \RxMisoData_t[5]_i_2 
       (.I0(\bitIndex_reg_n_0_[0] ),
        .I1(\bitIndex_reg_n_0_[2] ),
        .I2(\bitIndex_reg_n_0_[1] ),
        .I3(\bitIndex_reg_n_0_[4] ),
        .I4(RxFlag),
        .I5(sampleFlag_reg_n_0),
        .O(\RxMisoData_t[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAFFFBAAAA0008)) 
    \RxMisoData_t[6]_i_1 
       (.I0(\RxMisoData_t[7]_i_2_n_0 ),
        .I1(\RxMisoData_t[7]_i_4_n_0 ),
        .I2(\RxMisoData_t[7]_i_3_n_0 ),
        .I3(\bitIndex_reg_n_0_[0] ),
        .I4(\bitIndex[4]_i_3__0_n_0 ),
        .I5(a[6]),
        .O(\RxMisoData_t[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAEFFFAAAA2000)) 
    \RxMisoData_t[7]_i_1 
       (.I0(\RxMisoData_t[7]_i_2_n_0 ),
        .I1(\RxMisoData_t[7]_i_3_n_0 ),
        .I2(\bitIndex_reg_n_0_[0] ),
        .I3(\RxMisoData_t[7]_i_4_n_0 ),
        .I4(\bitIndex[4]_i_3__0_n_0 ),
        .I5(a[7]),
        .O(\RxMisoData_t[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \RxMisoData_t[7]_i_2 
       (.I0(RxMisoBit_IBUF),
        .I1(RxFlag),
        .I2(\bitIndex_reg_n_0_[4] ),
        .O(\RxMisoData_t[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \RxMisoData_t[7]_i_3 
       (.I0(\bitIndex_reg_n_0_[1] ),
        .I1(\bitIndex_reg_n_0_[2] ),
        .O(\RxMisoData_t[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \RxMisoData_t[7]_i_4 
       (.I0(sampleFlag_reg_n_0),
        .I1(RxFlag),
        .I2(\bitIndex_reg_n_0_[4] ),
        .O(\RxMisoData_t[7]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \RxMisoData_t_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\RxMisoData_t[0]_i_1_n_0 ),
        .Q(a[0]));
  FDCE #(
    .INIT(1'b0)) 
    \RxMisoData_t_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\RxMisoData_t[1]_i_1_n_0 ),
        .Q(a[1]));
  FDCE #(
    .INIT(1'b0)) 
    \RxMisoData_t_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\RxMisoData_t[2]_i_1_n_0 ),
        .Q(a[2]));
  FDCE #(
    .INIT(1'b0)) 
    \RxMisoData_t_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\RxMisoData_t[3]_i_1_n_0 ),
        .Q(a[3]));
  FDCE #(
    .INIT(1'b0)) 
    \RxMisoData_t_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\RxMisoData_t[4]_i_1_n_0 ),
        .Q(a[4]));
  FDCE #(
    .INIT(1'b0)) 
    \RxMisoData_t_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\RxMisoData_t[5]_i_1_n_0 ),
        .Q(a[5]));
  FDCE #(
    .INIT(1'b0)) 
    \RxMisoData_t_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\RxMisoData_t[6]_i_1_n_0 ),
        .Q(a[6]));
  FDCE #(
    .INIT(1'b0)) 
    \RxMisoData_t_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\RxMisoData_t[7]_i_1_n_0 ),
        .Q(a[7]));
  LUT6 #(
    .INIT(64'h222EEEEE22222222)) 
    RxValid_t_i_1
       (.I0(RxValid_t_reg_0),
        .I1(\bitIndex[4]_i_5_n_0 ),
        .I2(startOUT),
        .I3(TxReady_OBUF),
        .I4(\bitIndex[4]_i_4_n_0 ),
        .I5(RxValid_t),
        .O(RxValid_t_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    RxValid_t_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(RxValid_t_i_1_n_0),
        .Q(RxValid_t));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \bitIndex[0]_i_1__0 
       (.I0(RxFlag),
        .I1(\bitIndex_reg_n_0_[4] ),
        .I2(\bitIndex_reg_n_0_[0] ),
        .O(\bitIndex[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFBBF)) 
    \bitIndex[1]_i_1__0 
       (.I0(\bitIndex_reg_n_0_[4] ),
        .I1(RxFlag),
        .I2(\bitIndex_reg_n_0_[1] ),
        .I3(\bitIndex_reg_n_0_[0] ),
        .O(\bitIndex[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFE1FFFF)) 
    \bitIndex[2]_i_1__0 
       (.I0(\bitIndex_reg_n_0_[0] ),
        .I1(\bitIndex_reg_n_0_[1] ),
        .I2(\bitIndex_reg_n_0_[2] ),
        .I3(\bitIndex_reg_n_0_[4] ),
        .I4(RxFlag),
        .O(\bitIndex[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hAEAEAEFFAEAEAEAE)) 
    \bitIndex[4]_i_1__0 
       (.I0(\bitIndex[4]_i_3__0_n_0 ),
        .I1(sampleFlag_reg_n_0),
        .I2(\bitIndex[4]_i_4_n_0 ),
        .I3(\bitIndex[4]_i_5_n_0 ),
        .I4(clkSPI),
        .I5(cDetect),
        .O(bitIndex));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \bitIndex[4]_i_2__0 
       (.I0(\bitIndex_reg_n_0_[2] ),
        .I1(\bitIndex_reg_n_0_[4] ),
        .I2(RxFlag),
        .I3(\bitIndex_reg_n_0_[1] ),
        .I4(\bitIndex_reg_n_0_[0] ),
        .O(\bitIndex[4]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h008A)) 
    \bitIndex[4]_i_3__0 
       (.I0(TxReady_OBUF),
        .I1(\bitIndex_reg_n_0_[4] ),
        .I2(RxFlag),
        .I3(startOUT),
        .O(\bitIndex[4]_i_3__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \bitIndex[4]_i_4 
       (.I0(\bitIndex_reg_n_0_[4] ),
        .I1(RxFlag),
        .O(\bitIndex[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \bitIndex[4]_i_5 
       (.I0(\bitIndex_reg_n_0_[0] ),
        .I1(\bitIndex_reg_n_0_[1] ),
        .I2(\bitIndex_reg_n_0_[2] ),
        .I3(\bitIndex_reg_n_0_[4] ),
        .O(\bitIndex[4]_i_5_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \bitIndex_reg[0] 
       (.C(CLK),
        .CE(bitIndex),
        .D(\bitIndex[0]_i_1__0_n_0 ),
        .PRE(rst_IBUF),
        .Q(\bitIndex_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \bitIndex_reg[1] 
       (.C(CLK),
        .CE(bitIndex),
        .D(\bitIndex[1]_i_1__0_n_0 ),
        .PRE(rst_IBUF),
        .Q(\bitIndex_reg_n_0_[1] ));
  FDPE #(
    .INIT(1'b1)) 
    \bitIndex_reg[2] 
       (.C(CLK),
        .CE(bitIndex),
        .D(\bitIndex[2]_i_1__0_n_0 ),
        .PRE(rst_IBUF),
        .Q(\bitIndex_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \bitIndex_reg[4] 
       (.C(CLK),
        .CE(bitIndex),
        .CLR(rst_IBUF),
        .D(\bitIndex[4]_i_2__0_n_0 ),
        .Q(\bitIndex_reg_n_0_[4] ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[0]__0_i_1 
       (.I0(a[0]),
        .I1(rst_IBUF),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[1]__0_i_1 
       (.I0(a[1]),
        .I1(rst_IBUF),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[2]__0_i_1 
       (.I0(a[2]),
        .I1(rst_IBUF),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[3]__0_i_1 
       (.I0(a[3]),
        .I1(rst_IBUF),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[4]__0_i_1 
       (.I0(a[4]),
        .I1(rst_IBUF),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[5]__0_i_1 
       (.I0(a[5]),
        .I1(rst_IBUF),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[6]__0_i_1 
       (.I0(a[6]),
        .I1(rst_IBUF),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[7]__0_i_2 
       (.I0(a[7]),
        .I1(rst_IBUF),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    sampleDelay_i_1
       (.I0(RxFlag),
        .I1(clkSPI),
        .I2(cDetect),
        .I3(sampleDelay),
        .O(sampleDelay_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    sampleDelay_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(sampleDelay_i_1_n_0),
        .Q(sampleDelay));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sampleFlag_i_1
       (.I0(RxFlag),
        .I1(sampleDelay),
        .O(sampleFlag));
  FDCE #(
    .INIT(1'b0)) 
    sampleFlag_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(sampleFlag),
        .Q(sampleFlag_reg_n_0));
endmodule

module SPI_Tx
   (cDetect,
    TxMosiBit_OBUF,
    TxReady_OBUF,
    clkSPI,
    CLK,
    rst_IBUF,
    startOUT,
    RxValid_OBUF,
    Q);
  output cDetect;
  output TxMosiBit_OBUF;
  output TxReady_OBUF;
  input clkSPI;
  input CLK;
  input rst_IBUF;
  input startOUT;
  input RxValid_OBUF;
  input [7:0]Q;

  wire CLK;
  wire [7:0]Q;
  wire RxValid_OBUF;
  wire TxEdge_i_1_n_0;
  wire TxEdge_reg_n_0;
  wire TxFlag_i_1_n_0;
  wire TxFlag_reg_n_0;
  wire TxMosiBit_OBUF;
  wire TxMosiBit_t;
  wire TxMosiBit_t_i_1_n_0;
  wire TxMosiBit_t_i_3_n_0;
  wire TxMosiBit_t_i_4_n_0;
  wire TxMosiBit_t_i_5_n_0;
  wire TxMosiBit_t_i_6_n_0;
  wire TxReady_OBUF;
  wire TxReady_t_i_1_n_0;
  wire \bitIndex[0]_i_1_n_0 ;
  wire \bitIndex[1]_i_1_n_0 ;
  wire \bitIndex[2]_i_1_n_0 ;
  wire \bitIndex[4]_i_1_n_0 ;
  wire \bitIndex[4]_i_2_n_0 ;
  wire \bitIndex[4]_i_3_n_0 ;
  wire \bitIndex_reg_n_0_[0] ;
  wire \bitIndex_reg_n_0_[1] ;
  wire \bitIndex_reg_n_0_[2] ;
  wire \bitIndex_reg_n_0_[4] ;
  wire cDetect;
  wire clkSPI;
  wire rst_IBUF;
  wire startOUT;

  LUT6 #(
    .INIT(64'hFFFF0004FBFF0004)) 
    TxEdge_i_1
       (.I0(rst_IBUF),
        .I1(clkSPI),
        .I2(cDetect),
        .I3(\bitIndex[4]_i_3_n_0 ),
        .I4(TxEdge_reg_n_0),
        .I5(startOUT),
        .O(TxEdge_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    TxEdge_reg
       (.C(CLK),
        .CE(1'b1),
        .D(TxEdge_i_1_n_0),
        .Q(TxEdge_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFDFFF0F0)) 
    TxFlag_i_1
       (.I0(RxValid_OBUF),
        .I1(TxEdge_reg_n_0),
        .I2(startOUT),
        .I3(\bitIndex_reg_n_0_[4] ),
        .I4(TxFlag_reg_n_0),
        .O(TxFlag_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    TxFlag_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(TxFlag_i_1_n_0),
        .Q(TxFlag_reg_n_0));
  LUT6 #(
    .INIT(64'h000050FF01000000)) 
    TxMosiBit_t_i_1
       (.I0(startOUT),
        .I1(RxValid_OBUF),
        .I2(TxEdge_reg_n_0),
        .I3(\bitIndex[4]_i_3_n_0 ),
        .I4(cDetect),
        .I5(clkSPI),
        .O(TxMosiBit_t_i_1_n_0));
  LUT6 #(
    .INIT(64'h00FF00EE00FE00EE)) 
    TxMosiBit_t_i_2
       (.I0(TxMosiBit_t_i_3_n_0),
        .I1(TxMosiBit_t_i_4_n_0),
        .I2(TxMosiBit_t_i_5_n_0),
        .I3(\bitIndex[4]_i_3_n_0 ),
        .I4(\bitIndex_reg_n_0_[0] ),
        .I5(TxMosiBit_t_i_6_n_0),
        .O(TxMosiBit_t));
  LUT5 #(
    .INIT(32'h000000E2)) 
    TxMosiBit_t_i_3
       (.I0(Q[0]),
        .I1(\bitIndex_reg_n_0_[2] ),
        .I2(Q[4]),
        .I3(\bitIndex_reg_n_0_[1] ),
        .I4(\bitIndex_reg_n_0_[0] ),
        .O(TxMosiBit_t_i_3_n_0));
  LUT5 #(
    .INIT(32'h44400040)) 
    TxMosiBit_t_i_4
       (.I0(\bitIndex_reg_n_0_[0] ),
        .I1(\bitIndex_reg_n_0_[1] ),
        .I2(Q[2]),
        .I3(\bitIndex_reg_n_0_[2] ),
        .I4(Q[6]),
        .O(TxMosiBit_t_i_4_n_0));
  LUT4 #(
    .INIT(16'h00E2)) 
    TxMosiBit_t_i_5
       (.I0(Q[1]),
        .I1(\bitIndex_reg_n_0_[2] ),
        .I2(Q[5]),
        .I3(\bitIndex_reg_n_0_[1] ),
        .O(TxMosiBit_t_i_5_n_0));
  LUT4 #(
    .INIT(16'hE200)) 
    TxMosiBit_t_i_6
       (.I0(Q[3]),
        .I1(\bitIndex_reg_n_0_[2] ),
        .I2(Q[7]),
        .I3(\bitIndex_reg_n_0_[1] ),
        .O(TxMosiBit_t_i_6_n_0));
  FDCE #(
    .INIT(1'b0)) 
    TxMosiBit_t_reg
       (.C(CLK),
        .CE(TxMosiBit_t_i_1_n_0),
        .CLR(rst_IBUF),
        .D(TxMosiBit_t),
        .Q(TxMosiBit_OBUF));
  LUT6 #(
    .INIT(64'h0FFF0F0F02000202)) 
    TxReady_t_i_1
       (.I0(RxValid_OBUF),
        .I1(TxEdge_reg_n_0),
        .I2(startOUT),
        .I3(\bitIndex_reg_n_0_[4] ),
        .I4(TxFlag_reg_n_0),
        .I5(TxReady_OBUF),
        .O(TxReady_t_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    TxReady_t_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(TxReady_t_i_1_n_0),
        .Q(TxReady_OBUF));
  LUT3 #(
    .INIT(8'hDF)) 
    \bitIndex[0]_i_1 
       (.I0(TxFlag_reg_n_0),
        .I1(\bitIndex_reg_n_0_[4] ),
        .I2(\bitIndex_reg_n_0_[0] ),
        .O(\bitIndex[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hFBBF)) 
    \bitIndex[1]_i_1 
       (.I0(\bitIndex_reg_n_0_[4] ),
        .I1(TxFlag_reg_n_0),
        .I2(\bitIndex_reg_n_0_[1] ),
        .I3(\bitIndex_reg_n_0_[0] ),
        .O(\bitIndex[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFFFFA9FF)) 
    \bitIndex[2]_i_1 
       (.I0(\bitIndex_reg_n_0_[2] ),
        .I1(\bitIndex_reg_n_0_[0] ),
        .I2(\bitIndex_reg_n_0_[1] ),
        .I3(TxFlag_reg_n_0),
        .I4(\bitIndex_reg_n_0_[4] ),
        .O(\bitIndex[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0202020202F20202)) 
    \bitIndex[4]_i_1 
       (.I0(clkSPI),
        .I1(cDetect),
        .I2(\bitIndex[4]_i_3_n_0 ),
        .I3(startOUT),
        .I4(RxValid_OBUF),
        .I5(TxEdge_reg_n_0),
        .O(\bitIndex[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h00000010)) 
    \bitIndex[4]_i_2 
       (.I0(\bitIndex_reg_n_0_[2] ),
        .I1(\bitIndex_reg_n_0_[4] ),
        .I2(TxFlag_reg_n_0),
        .I3(\bitIndex_reg_n_0_[1] ),
        .I4(\bitIndex_reg_n_0_[0] ),
        .O(\bitIndex[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \bitIndex[4]_i_3 
       (.I0(\bitIndex_reg_n_0_[4] ),
        .I1(TxFlag_reg_n_0),
        .O(\bitIndex[4]_i_3_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \bitIndex_reg[0] 
       (.C(CLK),
        .CE(\bitIndex[4]_i_1_n_0 ),
        .D(\bitIndex[0]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(\bitIndex_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \bitIndex_reg[1] 
       (.C(CLK),
        .CE(\bitIndex[4]_i_1_n_0 ),
        .D(\bitIndex[1]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(\bitIndex_reg_n_0_[1] ));
  FDPE #(
    .INIT(1'b1)) 
    \bitIndex_reg[2] 
       (.C(CLK),
        .CE(\bitIndex[4]_i_1_n_0 ),
        .D(\bitIndex[2]_i_1_n_0 ),
        .PRE(rst_IBUF),
        .Q(\bitIndex_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \bitIndex_reg[4] 
       (.C(CLK),
        .CE(\bitIndex[4]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\bitIndex[4]_i_2_n_0 ),
        .Q(\bitIndex_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    cDetect_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(clkSPI),
        .Q(cDetect));
endmodule

module clk_SPI
   (clkSPI,
    clkSPI_t_reg_0,
    E,
    CLK,
    rst_IBUF,
    startOUT,
    cDetect);
  output clkSPI;
  output clkSPI_t_reg_0;
  output [0:0]E;
  input CLK;
  input rst_IBUF;
  input startOUT;
  input cDetect;

  wire CLK;
  wire [0:0]E;
  wire cDetect;
  wire clkSPI;
  wire clkSPI_t_i_1_n_0;
  wire clkSPI_t_i_2_n_0;
  wire clkSPI_t_reg_0;
  wire count;
  wire count_i_1_n_0;
  wire initFlag;
  wire initFlag_i_1_n_0;
  wire [4:1]p_0_in;
  wire \pulseCount[0]_i_1_n_0 ;
  wire \pulseCount[4]_i_1_n_0 ;
  wire [4:1]pulseCount_reg;
  wire \pulseCount_reg_n_0_[0] ;
  wire rst_IBUF;
  wire startOUT;

  LUT2 #(
    .INIT(4'hB)) 
    RxValid_t_i_2
       (.I0(clkSPI),
        .I1(cDetect),
        .O(clkSPI_t_reg_0));
  LUT5 #(
    .INIT(32'hF7000808)) 
    clkSPI_t_i_1
       (.I0(clkSPI_t_i_2_n_0),
        .I1(count),
        .I2(startOUT),
        .I3(initFlag),
        .I4(clkSPI),
        .O(clkSPI_t_i_1_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    clkSPI_t_i_2
       (.I0(pulseCount_reg[1]),
        .I1(pulseCount_reg[2]),
        .I2(pulseCount_reg[3]),
        .I3(pulseCount_reg[4]),
        .O(clkSPI_t_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    clkSPI_t_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(clkSPI_t_i_1_n_0),
        .Q(clkSPI));
  LUT6 #(
    .INIT(64'hFFFEAAAA00015555)) 
    count_i_1
       (.I0(E),
        .I1(pulseCount_reg[1]),
        .I2(pulseCount_reg[2]),
        .I3(pulseCount_reg[3]),
        .I4(pulseCount_reg[4]),
        .I5(count),
        .O(count_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    count_reg
       (.C(CLK),
        .CE(1'b1),
        .D(count_i_1_n_0),
        .Q(count),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hD)) 
    initFlag_i_1
       (.I0(rst_IBUF),
        .I1(initFlag),
        .O(initFlag_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    initFlag_reg
       (.C(CLK),
        .CE(1'b1),
        .D(initFlag_i_1_n_0),
        .Q(initFlag),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    \pulseCount[0]_i_1 
       (.I0(\pulseCount_reg_n_0_[0] ),
        .I1(startOUT),
        .O(\pulseCount[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \pulseCount[1]_i_1 
       (.I0(\pulseCount_reg_n_0_[0] ),
        .I1(pulseCount_reg[1]),
        .I2(startOUT),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \pulseCount[2]_i_1 
       (.I0(\pulseCount_reg_n_0_[0] ),
        .I1(pulseCount_reg[1]),
        .I2(pulseCount_reg[2]),
        .I3(startOUT),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \pulseCount[3]_i_1 
       (.I0(pulseCount_reg[1]),
        .I1(\pulseCount_reg_n_0_[0] ),
        .I2(pulseCount_reg[2]),
        .I3(pulseCount_reg[3]),
        .I4(startOUT),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFF0002AAAA)) 
    \pulseCount[4]_i_1 
       (.I0(count),
        .I1(pulseCount_reg[1]),
        .I2(pulseCount_reg[2]),
        .I3(pulseCount_reg[3]),
        .I4(pulseCount_reg[4]),
        .I5(startOUT),
        .O(\pulseCount[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000007FFF8000)) 
    \pulseCount[4]_i_2 
       (.I0(pulseCount_reg[2]),
        .I1(\pulseCount_reg_n_0_[0] ),
        .I2(pulseCount_reg[1]),
        .I3(pulseCount_reg[3]),
        .I4(pulseCount_reg[4]),
        .I5(startOUT),
        .O(p_0_in[4]));
  FDCE #(
    .INIT(1'b0)) 
    \pulseCount_reg[0] 
       (.C(CLK),
        .CE(\pulseCount[4]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\pulseCount[0]_i_1_n_0 ),
        .Q(\pulseCount_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \pulseCount_reg[1] 
       (.C(CLK),
        .CE(\pulseCount[4]_i_1_n_0 ),
        .D(p_0_in[1]),
        .PRE(rst_IBUF),
        .Q(pulseCount_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \pulseCount_reg[2] 
       (.C(CLK),
        .CE(\pulseCount[4]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(p_0_in[2]),
        .Q(pulseCount_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \pulseCount_reg[3] 
       (.C(CLK),
        .CE(\pulseCount[4]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(p_0_in[3]),
        .Q(pulseCount_reg[3]));
  FDPE #(
    .INIT(1'b1)) 
    \pulseCount_reg[4] 
       (.C(CLK),
        .CE(\pulseCount[4]_i_1_n_0 ),
        .D(p_0_in[4]),
        .PRE(rst_IBUF),
        .Q(pulseCount_reg[4]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \q[7]_i_1 
       (.I0(startOUT),
        .I1(rst_IBUF),
        .O(E));
endmodule

(* N = "8" *) (* spiMode = "2'b00" *) 
(* NotValidForBitStream *)
module spiMaster_s
   (clk,
    TxValidIN,
    RxMisoBit,
    TxMosiIN,
    rst,
    RxValid,
    TxReady,
    TxMosiBit,
    RxMisoData);
  input clk;
  input TxValidIN;
  input RxMisoBit;
  input [7:0]TxMosiIN;
  input rst;
  output RxValid;
  output TxReady;
  output TxMosiBit;
  output [7:0]RxMisoData;

  wire RxMisoBit;
  wire RxMisoBit_IBUF;
  wire [7:0]RxMisoData;
  wire [7:0]RxMisoData_OBUF;
  wire RxValid;
  wire RxValid_OBUF;
  wire RxValid_t;
  wire SPI_Rx0_n_1;
  wire SPI_Rx0_n_2;
  wire SPI_Rx0_n_3;
  wire SPI_Rx0_n_4;
  wire SPI_Rx0_n_5;
  wire SPI_Rx0_n_6;
  wire SPI_Rx0_n_7;
  wire SPI_Rx0_n_8;
  wire TxMosiBit;
  wire TxMosiBit_OBUF;
  wire [7:0]TxMosiIN;
  wire [7:0]TxMosiIN_IBUF;
  wire TxReady;
  wire TxReady_OBUF;
  wire TxValidIN;
  wire TxValidIN_IBUF;
  wire cDetect;
  wire clk;
  wire clk0_n_1;
  wire clk0_n_2;
  wire clkSPI;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire p_1_out;
  wire p_4_out;
  wire [7:0]q;
  wire \q[0]_i_1_n_0 ;
  wire \q[1]_i_1_n_0 ;
  wire \q[2]_i_1_n_0 ;
  wire \q[3]_i_1_n_0 ;
  wire \q[4]_i_1_n_0 ;
  wire \q[5]_i_1_n_0 ;
  wire \q[6]_i_1_n_0 ;
  wire \q[7]__0_i_1_n_0 ;
  wire \q[7]_i_2_n_0 ;
  wire rst;
  wire rst_IBUF;
  wire sCountFollow;
  wire sCountFollow_reg_n_0;
  wire sCountLead;
  wire sCountLead_reg_n_0;
  wire startOUT;

initial begin
 $sdf_annotate("spiMaster_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF RxMisoBit_IBUF_inst
       (.I(RxMisoBit),
        .O(RxMisoBit_IBUF));
  OBUF \RxMisoData_OBUF[0]_inst 
       (.I(RxMisoData_OBUF[0]),
        .O(RxMisoData[0]));
  OBUF \RxMisoData_OBUF[1]_inst 
       (.I(RxMisoData_OBUF[1]),
        .O(RxMisoData[1]));
  OBUF \RxMisoData_OBUF[2]_inst 
       (.I(RxMisoData_OBUF[2]),
        .O(RxMisoData[2]));
  OBUF \RxMisoData_OBUF[3]_inst 
       (.I(RxMisoData_OBUF[3]),
        .O(RxMisoData[3]));
  OBUF \RxMisoData_OBUF[4]_inst 
       (.I(RxMisoData_OBUF[4]),
        .O(RxMisoData[4]));
  OBUF \RxMisoData_OBUF[5]_inst 
       (.I(RxMisoData_OBUF[5]),
        .O(RxMisoData[5]));
  OBUF \RxMisoData_OBUF[6]_inst 
       (.I(RxMisoData_OBUF[6]),
        .O(RxMisoData[6]));
  OBUF \RxMisoData_OBUF[7]_inst 
       (.I(RxMisoData_OBUF[7]),
        .O(RxMisoData[7]));
  OBUF RxValid_OBUF_inst
       (.I(RxValid_OBUF),
        .O(RxValid));
  SPI_Rx SPI_Rx0
       (.CLK(clk_IBUF_BUFG),
        .D({SPI_Rx0_n_1,SPI_Rx0_n_2,SPI_Rx0_n_3,SPI_Rx0_n_4,SPI_Rx0_n_5,SPI_Rx0_n_6,SPI_Rx0_n_7,SPI_Rx0_n_8}),
        .RxMisoBit_IBUF(RxMisoBit_IBUF),
        .RxValid_t(RxValid_t),
        .RxValid_t_reg_0(clk0_n_1),
        .TxReady_OBUF(TxReady_OBUF),
        .cDetect(cDetect),
        .clkSPI(clkSPI),
        .rst_IBUF(rst_IBUF),
        .startOUT(startOUT));
  SPI_Tx SPI_Tx0
       (.CLK(clk_IBUF_BUFG),
        .Q(q),
        .RxValid_OBUF(RxValid_OBUF),
        .TxMosiBit_OBUF(TxMosiBit_OBUF),
        .TxReady_OBUF(TxReady_OBUF),
        .cDetect(cDetect),
        .clkSPI(clkSPI),
        .rst_IBUF(rst_IBUF),
        .startOUT(startOUT));
  OBUF TxMosiBit_OBUF_inst
       (.I(TxMosiBit_OBUF),
        .O(TxMosiBit));
  IBUF \TxMosiIN_IBUF[0]_inst 
       (.I(TxMosiIN[0]),
        .O(TxMosiIN_IBUF[0]));
  IBUF \TxMosiIN_IBUF[1]_inst 
       (.I(TxMosiIN[1]),
        .O(TxMosiIN_IBUF[1]));
  IBUF \TxMosiIN_IBUF[2]_inst 
       (.I(TxMosiIN[2]),
        .O(TxMosiIN_IBUF[2]));
  IBUF \TxMosiIN_IBUF[3]_inst 
       (.I(TxMosiIN[3]),
        .O(TxMosiIN_IBUF[3]));
  IBUF \TxMosiIN_IBUF[4]_inst 
       (.I(TxMosiIN[4]),
        .O(TxMosiIN_IBUF[4]));
  IBUF \TxMosiIN_IBUF[5]_inst 
       (.I(TxMosiIN[5]),
        .O(TxMosiIN_IBUF[5]));
  IBUF \TxMosiIN_IBUF[6]_inst 
       (.I(TxMosiIN[6]),
        .O(TxMosiIN_IBUF[6]));
  IBUF \TxMosiIN_IBUF[7]_inst 
       (.I(TxMosiIN[7]),
        .O(TxMosiIN_IBUF[7]));
  OBUF TxReady_OBUF_inst
       (.I(TxReady_OBUF),
        .O(TxReady));
  IBUF TxValidIN_IBUF_inst
       (.I(TxValidIN),
        .O(TxValidIN_IBUF));
  clk_SPI clk0
       (.CLK(clk_IBUF_BUFG),
        .E(clk0_n_2),
        .cDetect(cDetect),
        .clkSPI(clkSPI),
        .clkSPI_t_reg_0(clk0_n_1),
        .rst_IBUF(rst_IBUF),
        .startOUT(startOUT));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[0]_i_1 
       (.I0(TxMosiIN_IBUF[0]),
        .I1(rst_IBUF),
        .O(\q[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[1]_i_1 
       (.I0(TxMosiIN_IBUF[1]),
        .I1(rst_IBUF),
        .O(\q[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[2]_i_1 
       (.I0(TxMosiIN_IBUF[2]),
        .I1(rst_IBUF),
        .O(\q[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[3]_i_1 
       (.I0(TxMosiIN_IBUF[3]),
        .I1(rst_IBUF),
        .O(\q[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[4]_i_1 
       (.I0(TxMosiIN_IBUF[4]),
        .I1(rst_IBUF),
        .O(\q[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[5]_i_1 
       (.I0(TxMosiIN_IBUF[5]),
        .I1(rst_IBUF),
        .O(\q[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[6]_i_1 
       (.I0(TxMosiIN_IBUF[6]),
        .I1(rst_IBUF),
        .O(\q[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \q[7]__0_i_1 
       (.I0(RxValid_OBUF),
        .I1(rst_IBUF),
        .O(\q[7]__0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \q[7]_i_2 
       (.I0(TxMosiIN_IBUF[7]),
        .I1(rst_IBUF),
        .O(\q[7]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(clk0_n_2),
        .CLR(rst_IBUF),
        .D(\q[0]_i_1_n_0 ),
        .Q(q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0]__0 
       (.C(clk_IBUF_BUFG),
        .CE(\q[7]__0_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(SPI_Rx0_n_8),
        .Q(RxMisoData_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(clk0_n_2),
        .CLR(rst_IBUF),
        .D(\q[1]_i_1_n_0 ),
        .Q(q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[1]__0 
       (.C(clk_IBUF_BUFG),
        .CE(\q[7]__0_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(SPI_Rx0_n_7),
        .Q(RxMisoData_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(clk0_n_2),
        .CLR(rst_IBUF),
        .D(\q[2]_i_1_n_0 ),
        .Q(q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[2]__0 
       (.C(clk_IBUF_BUFG),
        .CE(\q[7]__0_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(SPI_Rx0_n_6),
        .Q(RxMisoData_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(clk0_n_2),
        .CLR(rst_IBUF),
        .D(\q[3]_i_1_n_0 ),
        .Q(q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[3]__0 
       (.C(clk_IBUF_BUFG),
        .CE(\q[7]__0_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(SPI_Rx0_n_5),
        .Q(RxMisoData_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(clk0_n_2),
        .CLR(rst_IBUF),
        .D(\q[4]_i_1_n_0 ),
        .Q(q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[4]__0 
       (.C(clk_IBUF_BUFG),
        .CE(\q[7]__0_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(SPI_Rx0_n_4),
        .Q(RxMisoData_OBUF[4]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(clk0_n_2),
        .CLR(rst_IBUF),
        .D(\q[5]_i_1_n_0 ),
        .Q(q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[5]__0 
       (.C(clk_IBUF_BUFG),
        .CE(\q[7]__0_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(SPI_Rx0_n_3),
        .Q(RxMisoData_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(clk0_n_2),
        .CLR(rst_IBUF),
        .D(\q[6]_i_1_n_0 ),
        .Q(q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[6]__0 
       (.C(clk_IBUF_BUFG),
        .CE(\q[7]__0_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(SPI_Rx0_n_2),
        .Q(RxMisoData_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(clk0_n_2),
        .CLR(rst_IBUF),
        .D(\q[7]_i_2_n_0 ),
        .Q(q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[7]__0 
       (.C(clk_IBUF_BUFG),
        .CE(\q[7]__0_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(SPI_Rx0_n_1),
        .Q(RxMisoData_OBUF[7]));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    sCountFollow_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(sCountLead_reg_n_0),
        .Q(sCountFollow_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    sCountFollow_reg__0
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(sCountLead),
        .Q(sCountFollow),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    sCountLead_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(RxValid_t),
        .Q(sCountLead_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    sCountLead_reg__0
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(TxValidIN_IBUF),
        .Q(sCountLead),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    startOUT__0_i_1
       (.I0(sCountLead_reg_n_0),
        .I1(sCountFollow_reg_n_0),
        .O(p_1_out));
  LUT2 #(
    .INIT(4'h2)) 
    startOUT_i_1
       (.I0(sCountLead),
        .I1(sCountFollow),
        .O(p_4_out));
  FDRE #(
    .INIT(1'b0)) 
    startOUT_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_4_out),
        .Q(startOUT),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    startOUT_reg__0
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_out),
        .Q(RxValid_OBUF),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
