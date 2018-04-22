//         Left: A B C N
//        Right: ROT1 ROT2 Pos

// A           : Phase A
// B           : Phase B
// C           : Phase C
// N           : Neutral
// ROT1        : Mechanical plus
// ROT2        : Mechanical minus
// Pos         : Position

MODELDEF Setup1
{
PORT electrical: A;
PORT electrical: B;
PORT electrical: C;
PORT electrical: N;
PORT ROTATIONAL_V: ROT1;
PORT ROTATIONAL_V: ROT2;
PORT REAL OUT ANGLE[deg]: Pos = VM_Pos.V;
PORT REAL IN ANGLE[deg]: IniPos = 0;

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=2.53116 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=2.53116 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=2.53116 ); 
UMODEL Transformation_3To2 AB0 NAP:=N0_1, NAN:=N, NBP:=N0_2, NBN:=N, NCP:=N0_3, NCN:=N, NALPHA:=alpha, NBETA:=beta, NZERO:=zero () SRC: DLL( File:="Transformation.dll");

INTERN  EV       Speed  N1:=NM_1, N2:=GND  ( QUANT:=Torq.V, FACT:=1 ); 
INTERN  II       Torq  N1:=NM_6, N2:=NM_5  ( QUANT:=Speed.I, FACT:=1 ); 
UMODEL D2D D2D1 N1:=NM_5, N2:=ROT1 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
UMODEL D2D D2D2 N1:=NM_6, N2:=ROT2 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
INTERN  VM       VM_Pos  N1:=NM_2, N2:=GND  ; 
MODEL Setup1_AB0 model1 N_1:=alpha, N_2:=beta, N_3:=zero, N_4:=NM_1, N_5:=NM_2 ( pos0:=IniPos );


//         Left: N_1 N_2 N_3
//        Right: N_4 N_5

MODELDEF Setup1_AB0
{
PORT electrical: N_1;
PORT electrical: N_4;
PORT electrical: N_2;
PORT electrical: N_5;
PORT electrical: N_3;
PORT REAL IN: pos0 = 0;

INTERN  L        L1d  N1:=N_1, N2:=N_8  ( L:=N_41.V, I0:=0 ); 
INTERN  L        Lmd  N1:=N_8, N2:=GND  ( L:=N_43.V, I0:=0 ); 
INTERN  R        Rfed  N1:=N_8, N2:=GND  ( R:=1.05717e+008 ); 
INTERN  L        L2d  N1:=N_9, N2:=N_8  ( L:=N_42.V, I0:=0 ); 
INTERN  R        R2d  N1:=N_10, N2:=N_9  ( R:=0.099425 ); 
INTERN  E        B2d  N1:=N_10, N2:=N_11  ( EMF:=2 * N_42.V * N_4.V * L2q.I, PARTDERIV:=1 ); 
INTERN  L        L2td  N1:=N_12, N2:=N_11  ( L:=0.0017498, I0:=0 ); 
INTERN  L        L2bd  N1:=N_13, N2:=N_11  ( L:=0.0119501, I0:=0 ); 
INTERN  M        K2d  ( L1:= L2td.L, L2:= L2bd.L, K:=0.586672 ); 
INTERN  R        R2td  N1:=N_14, N2:=N_12  ( R:=7.63582 ); 
INTERN  R        R2bd  N1:=N_15, N2:=N_13  ( R:=3.2725 ); 
INTERN  E        B2ttd  N1:=N_14, N2:=N_16  ( EMF:=0.0034996 * N_4.V * L2tq.I, PARTDERIV:=1 ); 
INTERN  E        B2btd  N1:=N_15, N2:=N_17  ( EMF:=0.00536546 * N_4.V * L2tq.I, PARTDERIV:=1 ); 
INTERN  E        B2tbd  N1:=N_16, N2:=N_18  ( EMF:=0.00536546 * N_4.V * L2bq.I, PARTDERIV:=1 ); 
INTERN  E        B2bbd  N1:=N_17, N2:=N_18  ( EMF:=0.0239003 * N_4.V * L2bq.I, PARTDERIV:=1 ); 
INTERN  E        Bmd  N1:=N_18, N2:=GND  ( EMF:=2 * N_43.V * N_4.V * Lmq.I, PARTDERIV:=1 ); 
INTERN  L        L1q  N1:=N_2, N2:=N_28  ( L:=N_41.V, I0:=0 ); 
INTERN  L        Lmq  N1:=N_28, N2:=GND  ( L:=N_43.V, I0:=0 ); 
INTERN  R        Rfeq  N1:=N_28, N2:=GND  ( R:=1.05717e+008 ); 
INTERN  L        L2q  N1:=N_29, N2:=N_28  ( L:=N_42.V, I0:=0 ); 
INTERN  R        R2q  N1:=N_30, N2:=N_29  ( R:=0.099425 ); 
INTERN  E        B2q  N1:=N_30, N2:=N_31  ( EMF:=-2 * N_42.V * N_4.V * L2d.I, PARTDERIV:=1 ); 
INTERN  L        L2tq  N1:=N_32, N2:=N_31  ( L:=0.0017498, I0:=0 ); 
INTERN  L        L2bq  N1:=N_33, N2:=N_31  ( L:=0.0119501, I0:=0 ); 
INTERN  M        K2q  ( L1:= L2tq.L, L2:= L2bq.L, K:=0.586672 ); 
INTERN  R        R2tq  N1:=N_34, N2:=N_32  ( R:=7.63582 ); 
INTERN  R        R2bq  N1:=N_35, N2:=N_33  ( R:=3.2725 ); 
INTERN  E        B2ttq  N1:=N_34, N2:=N_36  ( EMF:=-0.0034996 * N_4.V * L2td.I, PARTDERIV:=1 ); 
INTERN  E        B2btq  N1:=N_35, N2:=N_37  ( EMF:=-0.00536546 * N_4.V * L2td.I, PARTDERIV:=1 ); 
INTERN  E        B2tbq  N1:=N_36, N2:=N_38  ( EMF:=-0.00536546 * N_4.V * L2bd.I, PARTDERIV:=1 ); 
INTERN  E        B2bbq  N1:=N_37, N2:=N_38  ( EMF:=-0.0239003 * N_4.V * L2bd.I, PARTDERIV:=1 ); 
INTERN  E        Bmq  N1:=N_38, N2:=GND  ( EMF:=-2 * N_43.V * N_4.V * Lmd.I, PARTDERIV:=1 ); 
INTERN  L        L0  N1:=N_3, N2:=GND  ( L:=0.0188094, I0:=0 ); 
INTERN  I        BT  N1:=GND, N2:=N_4  ( IS:=2 * N_43.V * (L2d.I*Lmq.I - L2q.I*Lmd.I), PARTDERIV:=1 ); 
INTERN  VM       VM_Speed  N1:=N_4, N2:=GND  ; 
INTERN  IV       Gx  N1:=GND, N2:=N_55  ( QUANT:=VM_Speed.V, FACT:=1 ); 
INTERN  C        Cx  N1:=N_55, N2:=GND  ( C:=1, V0:=pos0*0.0174533 ); 
INTERN  VM       VM_Pos  N1:=N_55, N2:=GND  ; 
INTERN  EV       Ex2  N1:=GND, N2:=N_5  ( QUANT:=VM_Pos.V, FACT:=57.2958 ); 
INTERN  E        BIsr  N1:=GND, N2:=N_39  ( EMF:=sqrt(L1d.I*L1d.I + L1q.I*L1q.I), PARTDERIV:=1 ); 
INTERN  VM       VM_Isr  N1:=N_39, N2:=GND  ; 
INTERN  E        BIm  N1:=GND, N2:=N_40  ( EMF:=sqrt(Lmd.I*Lmd.I + Lmq.I*Lmq.I), PARTDERIV:=1 ); 
INTERN  VM       VM_Im  N1:=N_40, N2:=GND  ; 
INTERN  VM       VM_L1  N1:=N_41, N2:=GND  ; 
INTERN  NDSRC    PL1 N0:=N_41, N1:=GND  ( QUANT:={N_39.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_l1_table pwl TABLE=( 51, 0, 0.758269, 1.51654, 2.27481, 3.03308,\
 3.79134, 4.54961, 5.30788, 6.06615, 6.82442, 7.58269, 8.34096, 9.09923,\
 9.8575, 10.6158, 11.374, 12.1323, 12.8906, 13.6488, 14.4071, 15.1654, 15.9236,\
 16.6819, 17.4402, 18.1985, 18.9567, 19.715, 20.4733, 21.2315, 21.9898,\
 22.7481, 23.5063, 24.2646, 25.0229, 25.7811, 26.5394, 27.2977, 28.0559,\
 28.8142, 29.5725, 30.3308, 31.089, 31.8473, 32.6056, 33.3638, 34.1221,\
 34.8804, 35.6386, 36.3969, 37.1552, 37.9134, 1, 0.0190076, 0.0189977,\
 0.0189879, 0.018978, 0.0189682, 0.0189584, 0.0189397, 0.0189202, 0.0189008,\
 0.0188816, 0.0188624, 0.0188227, 0.0187794, 0.0187364, 0.0186938, 0.0186517,\
 0.0185601, 0.018387, 0.0181959, 0.018011, 0.0178314, 0.0176716, 0.0175229,\
 0.0173768, 0.017233, 0.0170915, 0.0169519, 0.016814, 0.0166777, 0.0165429,\
 0.0164094, 0.0162939, 0.0161962, 0.016099, 0.0160024, 0.0159062, 0.0158106,\
 0.0157154, 0.0156207, 0.0155264, 0.0154324, 0.0153493, 0.0152875, 0.0152258,\
 0.0151644, 0.015103, 0.0150418, 0.0149807, 0.0149197, 0.0148589, 0.0147981)\
 CONSTANT NOSPLINE" );
INTERN  VM       VM_L2  N1:=N_42, N2:=GND  ; 
INTERN  NDSRC    PL2 N0:=N_42, N1:=GND  ( QUANT:={N_39.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_l2_table pwl TABLE=( 51, 0, 0.758269, 1.51654, 2.27481, 3.03308,\
 3.79134, 4.54961, 5.30788, 6.06615, 6.82442, 7.58269, 8.34096, 9.09923,\
 9.8575, 10.6158, 11.374, 12.1323, 12.8906, 13.6488, 14.4071, 15.1654, 15.9236,\
 16.6819, 17.4402, 18.1985, 18.9567, 19.715, 20.4733, 21.2315, 21.9898,\
 22.7481, 23.5063, 24.2646, 25.0229, 25.7811, 26.5394, 27.2977, 28.0559,\
 28.8142, 29.5725, 30.3308, 31.089, 31.8473, 32.6056, 33.3638, 34.1221,\
 34.8804, 35.6386, 36.3969, 37.1552, 37.9134, 1, 0.0194067, 0.0193602,\
 0.0193142, 0.0192688, 0.0192239, 0.0191795, 0.0190957, 0.0190102, 0.0189265,\
 0.0188445, 0.0187641, 0.0186017, 0.0184294, 0.018264, 0.0181047, 0.017951,\
 0.0176296, 0.0170613, 0.0164785, 0.0159466, 0.0154519, 0.0150255, 0.014637,\
 0.0142619, 0.0138978, 0.0135428, 0.0131955, 0.0128547, 0.0125195, 0.0121891,\
 0.0118629, 0.0115814, 0.0113433, 0.0111069, 0.0108721, 0.0106386, 0.0104063,\
 0.0101753, 0.00994529, 0.0097163, 0.00948823, 0.00928634, 0.00913629,\
 0.00898658, 0.00883718, 0.0086881, 0.0085393, 0.00839079, 0.00824254,\
 0.00809455, 0.00794681) CONSTANT NOSPLINE" );
INTERN  VM       VM_Lm  N1:=N_43, N2:=GND  ; 
INTERN  NDSRC    PLm N0:=N_43, N1:=GND  ( QUANT:={N_40.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_lm_table pwl TABLE=( 51, 0, 0.0481449, 0.0962898, 0.144435,\
 0.19258, 0.240725, 0.287557, 0.328176, 0.368795, 0.409414, 0.448428, 0.48667,\
 0.52219, 0.559675, 0.597369, 0.633775, 0.669598, 0.705576, 0.740782, 0.775573,\
 0.810165, 0.844255, 0.87948, 0.916056, 0.958969, 1.0026, 1.04593, 1.08955,\
 1.14023, 1.18864, 1.22838, 1.26696, 1.30367, 1.33658, 1.36705, 1.39646,\
 1.43879, 1.48078, 1.52049, 1.58406, 1.64486, 1.88053, 2.26851, 3.11958,\
 4.40371, 6.90681, 10.3992, 12.629, 16.1036, 19.8253, 22.827, 1, 0.628092,\
 0.628092, 0.628092, 0.628092, 0.628092, 0.628092, 0.630959, 0.645008,\
 0.655962, 0.664742, 0.674343, 0.683489, 0.694907, 0.702395, 0.708694,\
 0.715699, 0.72257, 0.728583, 0.734778, 0.740806, 0.746501, 0.752176, 0.756433,\
 0.759241, 0.756799, 0.754026, 0.751699, 0.749361, 0.742575, 0.737769,\
 0.738523, 0.739898, 0.742259, 0.746609, 0.752087, 0.757902, 0.756621,\
 0.755587, 0.755745, 0.744505, 0.735369, 0.707531, 0.639843, 0.504058,\
 0.384542, 0.262692, 0.186103, 0.162822, 0.135202, 0.115923, 0.105978) CONSTANT\
 NOSPLINE" );
}

}
