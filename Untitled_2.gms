$Title A Standar CGE Model in Ch. 6 (STDCGE, SEQ=276)

*Definition of sets for suffix
Set      u       SAM entry       /BRD, MLK, CAP, LAB, IDT, TRF, HOH, GOV,
                                 INV, EXT/
         i(u)    goods           /BRD, MLK/
         h(u)    factor          /CAP, LAB/;
Alias (u,v), (i,j), (h,k);
*

*Loading data
Table    SAM(u,v)        Social acconting matrix
         BRD     MLK     CAP     LAB     IDT
BRD      21      8
MLK      17      9
CAP      20      30
LAB      15      25
IDT      5       4
TRF      1       2
HOH                      50      40
GOV                                      9
INV
EXT      13      11

+        TRF     HOH     GOV     INV     EXT
BRD              20      19      16      8
MLK              30      14      15      4
CAP
LAB
IDT
TRF
HOH
GOV      3       23
INV              17      2               12
EXT
;
*Loading the initial values
Parameter        Y0(j)           composite factor
                 F0(h,j)         the h-th factor input by the j-th firm
                 X0(i,j)         intermediate input
                 Z0(j)           output of the j-th good
                 Xp0(i)          household comsumption of the i-th good
                 Xg0(i)          government demand
                 Xv0(i)          investment demand
                 E0(i)           expert
                 M0(i)           import
                 Q0(i)           Armington's composite good
                 D0(i)           domestic good
                 Sp0             private saving
                 Sg0             government saving
                 Td0             direct tax
                 Tz0(j)          production tax
                 Tm0(j)          import tariff

                 FF(h)           factor endowment of the h-th factor
                 Sf              foreign saving in US dollars
                 pWe(i)          export price in US dollars
                 pWm(i)          import price in US dollars
                 tauz(i)         production tax rate
                 taum(i)         import tariff rate
;
Td0      =SAM("GOV","HOH");
Tz0      =SAM("IDT",j);
Tm0      =SAM("TRF",j);

F0       =SAM(h,j);
Y0       =SAM(h,F0(h,j));
X0(h,j)  =SAM(i,j);
Z0(j)    =Y0(j)+sum(i,X0(i,j));
M0(i)    =SAM("EXT",i);

tauz(j)  =Tz0(j)/Z0(j);
taum(j)  =Tm0(j)/M0(j);

Xp0(i)   =SAM(i,"HOH");
Xv0(i)   =SAM(i,"INV");
E0(i)    =SAM(i,"EXT");
Q0(i)    =Xp0(i)+Xg0(i)+Xv0(i)+sum(j,X0(i,j));
D0(i)    =(1+tauz(i))*Z0(i)-E0(i);
Sp0      =SAM("INV","HOH");
Sg0      =SAM("INV","GOV");
Sf       =SAM("INV","EXT");

pWe(i)   =1;
pWm(i)   =1;

Display Y0,F0,X0,Z0,Xp0,Xg0,Xv0,E0,M0,Q0,D0,Sp0,Sg0,Td0,Tz0,Tm0,
        FF,SF,tauz,taum;
*Calibration
Parameter        sigma(i)        elasticity of substitution
                 psi(i)          elasticity of transformation
                 eta(i)          substitution elasticity parameter
                 phi(i)          transformation elasticity parameter
;
sigma(i) =2;
psi(i)   =2;
eta(i)=(sigma(i)-1)/sigma(i);
phi(i)=(psi(i)+1)/psi(i);

parameter        alpha(i)        share oarameter in utility func.
                 beta(i)         share parameter in production func.
                 b(j)            scale parameter in production func.
                 ax(i,j)         intermediate input requerement coeff.
                 ay(j)           composite fact. input req. coeff.
                 mu(i)           government comsuption share
                 lambda(i)       investment demamd share
                 deltam(i)       share par. in Armington func.
                 deltad(i)       share par. in Armington func.
                 gamma(i)        scale par. in Armington func.
                 xid(i)          share par. in transformation func.
                 xie(i)          share par. in transformation func.
                 theta(i)        share par. in transformation func.




