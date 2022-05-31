% MODELADO (Robot de 4 GDL)
clc; close all; clear all;
%DHC(alfa, a, theta, d)
syms l1 l2 l3 l4 q1 q2 q3 q4 xe ye ze

S01=DHC(0,0,q1,l1);
S12=DHC(0,l2,q2,0);
S23=DHC(0,l3,0,0.05);
%La junta 34 es prismática
S34=DHC(0,0,q4,q3);
S45=DHC(0,0,0,-l4);

%% Cinemática directa
CD=S01*S12*S23*S34*S45;

% Vectores de posición
S02=S01*S12;
S03=S01*S12*S23;
S04=S01*S12*S23*S34;
S05=S01*S12*S23*S34*S45;

eq1=CD(1,4)-xe %CD(1,4)=xe, para método númerico se despeja
eq2=CD(2,4)-ye
eq3=CD(3,4)-ze

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
v11=transpose(R01)*(v00+cross(w00,P01)); %La suma de la velocidad en el sistema 1 MÁS proyección de velocidad (angular y lineal) previa
w11=transpose(R01)*w00+q1p*Z; %La suma de la proyección de la velocidad angular previa + la proyección en el eje Z (stándar para rotaciones)
%En sistema 2
v22=transpose(R12)*(v11+cross(w11,P12)); %Está sobre el poste, por lo tanto no tiene velocidad lineal
w22=transpose(R12)*w11+q2p*Z;
%En sistema 3
v33=transpose(R23)*(v22+cross(w22,P23))+q3p*Z; %Está sobre el poste, por lo tanto no tiene velocidad lineal
w33=transpose(R23)*w22;
%En sistema 4
v44=transpose(R34)*(v33+cross(w33,P34)); %Está sobre el poste, por lo tanto no tiene velocidad lineal
w44=transpose(R34)*w33+q4p*Z; %Ya no hay articulación por lo tanto no hay q4,por lo tanto w33=w44
%En sistema 5
v55=transpose(R45)*(v44+cross(w44,P45)); %Está sobre el poste, por lo tanto no tiene velocidad lineal
w55=transpose(R45)*w44+0*Z; %Ya no hay articulación por lo tanto no hay q4,por lo tanto w33=w44



