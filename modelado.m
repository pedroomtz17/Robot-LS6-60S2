% MODELADO (Robot de 4 GDL)
tic
clc; close all; clear all;
%DHC(alfa, a, theta, d)
syms l1 l2 l3 l4 l5 q1 q2 q3 q4 xe ye ze

S01=DHC(0,0,q1,l1);
S12=DHC(0,l2,q2,0);
S23=DHC(0,l3,0,l4);
%La junta 34 es prismática
S34=DHC(0,0,q4,q3);
S45=DHC(0,0,0,-l5);

%% Cinemática directa
CD=S01*S12*S23*S34*S45;

% Vectores de posición
S02=S01*S12;
S03=S01*S12*S23;
S04=S01*S12*S23*S34;
S05=S01*S12*S23*S34*S45;

%% Cinemática Inversa
syms xe ye ze alpha betha gamma
P05=transl(xe,ye,ze)*rotz(gamma)*roty(betha)*rotx(alpha);
eq=CD-P05;

eq1=eq(1,1); %CD(1,4)=xe, para método númerico se despeja
eq2=eq(1,2);
eq3=eq(1,3);
eq4=eq(1,4);

eq5=eq(2,1);
eq6=eq(2,2);
eq7=eq(2,3);
eq8=eq(2,4);

eq9=eq(3,1);
eq10=eq(3,2);
eq11=eq(3,3);
eq12=eq(3,4);

 eq13=eq(4,1);
 eq14=eq(4,2);
 eq15=eq(4,3);
 eq16=eq(4,4);

%% Modelo Cinemático Diferencial
% Matrices de rotacion
R01=S01(1:3,1:3); % Submatriz de rotación del sistema de referencia de 0 a 1
R12=S12(1:3,1:3);
R23=S23(1:3,1:3);
R34=S34(1:3,1:3);
R45=S45(1:3,1:3);

% Vector de posición (únicamente)
P01=S01(1:3,4);
P12=S12(1:3,4);
P23=S23(1:3,4);
P34=S34(1:3,4);
P45=S45(1:3,4);

% Simbólicos de las velocidades articulares
syms q1p q2p q3p q4p
Z=[0;0;1]; % Se establece que la rotación ocurre sólo en el eje Z

%% Propagación de velocidades
v00=[0;0;0];  %Para robots moviles se tiene valores !=0
w00=[0;0;0]; %En sistema 0 porque está empotrado
%En sistema 1
v11=transpose(R01)*(v00+cross(w00,P01)); %La suma de la velocidad en el sistema 1 M�?S proyección de velocidad (angular y lineal) previa
w11=transpose(R01)*w00+q1p*Z; %La suma de la proyección de la velocidad angular previa + la proyección en el eje Z (stándar para rotaciones)
%En sistema 2
v22=transpose(R12)*(v11+cross(w11,P12)); 
w22=transpose(R12)*w11+q2p*Z;
%En sistema 3 (junta prismática)
v33=transpose(R23)*(v22+cross(w22,P23))+q3p*Z; %q3p es velocidad lineal
w33=transpose(R23)*w22;
%En sistema 4
v44=transpose(R34)*(v33+cross(w33,P34)); 
w44=transpose(R34)*w33+q4p*Z; 
%En sistema 5
v55=transpose(R45)*(v44+cross(w44,P45)); 
w55=transpose(R45)*w44+0*Z; 

% Rotaciones y velocidades absolutas
R05=R01*R12*R23*R34*R45;
v05=R05*v55; %3x3 3x1 = 3x1
w05=R05*w55;

% Jacobiano absoluto (dado que no se controla la orientación se eliminan

% las velocidades angulares)
J05b=[diff(v05(1),q1p) diff(v05(1),q2p) diff(v05(1),q3p) diff(v05(1),q4p);...
     diff(v05(2),q1p) diff(v05(2),q2p) diff(v05(2),q3p) diff(v05(2),q4p);...
     diff(v05(3),q1p) diff(v05(3),q2p) diff(v05(3),q3p) diff(v05(3),q4p);...
     ];
 
% La ultima columna del J05 son 0s, indicando que no hay velocidades en el 
% efector final
% Al J05 (3x4) se le eliminó la 4ta columna para hacerla cuadrada

J05=[diff(v05(1),q1p) diff(v05(1),q2p) diff(v05(1),q3p) ;...
     diff(v05(2),q1p) diff(v05(2),q2p) diff(v05(2),q3p) ;...
     diff(v05(3),q1p) diff(v05(3),q2p) diff(v05(3),q3p) ;...
     ];
DET=simplify(det(J05));

rango=rank(J05); 

%Jacobiano inverso
J05Inv=inv(J05);

%Velocidad directa 
qp=[q1p;q2p;q3p];
xep=J05*qp;

%Calculo de la aceleracion
q=[q1;q2;q3];

J05p=diff_matrix(J05,qp,q);

%% Modelado dinámico
syms q1pp q2pp q3pp q4pp m1 m2 m3 m4 Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3 Ixx4 Iyy4 Izz4 g
syms c1x c1y c1z c2x c2y c2z c3x c3y c3z c4x c4y c4z %centros de masa
%Matrices de inercia
I1=[Ixx1,0,0;...
    0,Iyy1,0;...
    0,0,Izz1];

I2=[Ixx2,0,0;...
    0,Iyy2,0;...
    0,0,Izz2];

I3=[Ixx3,0,0;...
    0,Iyy3,0;...
    0,0,Izz3];

I4=[Ixx4,0,0;...
    0,Iyy4,0;...
    0,0,Izz4];

%Vectores de posción a los centros de masa
P1_cm1=[c1x;c1y;c1z];
P2_cm2=[c2x;c2y;c2z];
P3_cm3=[c3x;c3y;c3z];
P4_cm4=[c4x;c4y;c4z];



%Cálculo de la energía cinética
k1=1/2*m1*transpose(v11+cross(w11,P1_cm1))*(v11+cross(w11,P1_cm1))+1/2*transpose(w11)*I1*w11;
k2=1/2*m2*transpose(v22+cross(w22,P2_cm2))*(v22+cross(w22,P2_cm2))+1/2*transpose(w22)*I2*w22;
k3=1/2*m3*transpose(v33+cross(w33,P3_cm3))*(v33+cross(w33,P3_cm3))+1/2*transpose(w33)*I3*w33;
k4=1/2*m4*transpose(v44+cross(w44,P4_cm4))*(v44+cross(w44,P4_cm4))+1/2*transpose(w44)*I4*w44;

kt=k1+k2+k3+k4;

% Alturas a los centros de masa
h1=subs(S02(3,4),l1,c1z);
h2=subs(S03(3,4),l2,c2z);
h3=subs(S04(3,4),l3,c3z);
h4=subs(S05(3,4),l4,c4z);

%Energía potencial
u1=m1*g*h1;
u2=m2*g*h2;
u3=m3*g*h3;
u4=m4*g*h4;

ut=u1+u2+u3+u4;

%Energía total
E=kt+ut;

%Lagrangiano
L=kt-ut;

Qp=[q1p;q2p;q3p;q4p;q1pp;q2pp;q3pp;q4pp];

tau1=[diff(diff(L,q1p),q1)  diff(diff(L,q1p),q2) diff(diff(L,q1p),q3) diff(diff(L,q1p),q4) ...
      diff(diff(L,q1p),q1p) diff(diff(L,q1p),q2p) diff(diff(L,q1p),q3p) diff(diff(L,q1p),q4p)]*Qp-diff(L,q1);

tau2=[diff(diff(L,q2p),q1)  diff(diff(L,q2p),q2) diff(diff(L,q2p),q3) diff(diff(L,q2p),q4)...
      diff(diff(L,q2p),q1p) diff(diff(L,q2p),q2p) diff(diff(L,q2p),q3p) diff(diff(L,q2p),q4p)]*Qp-diff(L,q2);

tau3=[diff(diff(L,q3p),q1)  diff(diff(L,q3p),q2) diff(diff(L,q3p),q3) diff(diff(L,q3p),q4)...
      diff(diff(L,q3p),q1p) diff(diff(L,q3p),q2p) diff(diff(L,q3p),q3p) diff(diff(L,q3p),q4p)]*Qp-diff(L,q3);

tau4=[diff(diff(L,q4p),q1)  diff(diff(L,q4p),q2) diff(diff(L,q4p),q3) diff(diff(L,q4p),q4)...
      diff(diff(L,q4p),q1p) diff(diff(L,q4p),q2p) diff(diff(L,q4p),q3p) diff(diff(L,q4p),q4p)]*Qp-diff(L,q4);

%% Modelo dinámico en forma matricial
M=[diff(tau1,q1pp),diff(tau1,q2pp),diff(tau1,q3pp),diff(tau1,q4pp);...
   diff(tau2,q1pp),diff(tau2,q2pp),diff(tau2,q3pp),diff(tau2,q4pp);...
   diff(tau3,q1pp),diff(tau3,q2pp),diff(tau3,q3pp),diff(tau3,q4pp);...
   diff(tau4,q1pp),diff(tau4,q2pp),diff(tau4,q3pp),diff(tau4,q4pp)];

rank(M)

% Vector de fuerzas gravitacionales G nx1
%g1=0 pues ningún movimiento hace que el poste cambie su altura por lo que
%no se genera un torque gravitacional
g1=subs(tau1,[q1pp,q2pp,q3pp,q4pp,q1p,q2p,q3p,q4p],[0,0,0,0,0,0,0,0]);
g2=subs(tau2,[q1pp,q2pp,q3pp,q4pp,q1p,q2p,q3p,q4p],[0,0,0,0,0,0,0,0]);
g3=subs(tau3,[q1pp,q2pp,q3pp,q4pp,q1p,q2p,q3p,q4p],[0,0,0,0,0,0,0,0]);
g4=subs(tau4,[q1pp,q2pp,q3pp,q4pp,q1p,q2p,q3p,q4p],[0,0,0,0,0,0,0,0]);

G=[g1;g2;g3;g4];

% Calculo de C(q,qp)qp
% C(q,qp)qp=Mp(q)qp-1/2*diff(transpose(qp)*M*qp)

qpp=[q1pp;q2pp;q3pp;q4pp];
qp=[q1p;q2p;q3p;q4p];
q=[q1;q2;q3;q4];

Mp=diff_matrix(M,qp,q);
KE=1/2*transpose(qp)*M*qp;
dKE=[diff(KE,q1);diff(KE,q2);diff(KE,q3);diff(KE,q4)];

C=Mp*qp-dKE;

% Evaluar las matrices
parametros

M=simplify(eval(M));
C=simplify(eval(C));
G=eval(G);

toc