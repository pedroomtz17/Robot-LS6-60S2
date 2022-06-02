%Parametros del robot (https://epsonemear.a.bigcontent.io/v1/static/a9866-brochure-lores-en-gb-ls-b_series)
global l1 l2 l3 l4 l5 m1 m2 m3 m4 lc1 lc2 lc3 lc4 Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3 Ixx4 Iyy4 Izz4 g
%Distancia a los centros de masa
global c1x c1y c1z c2x c2y c2z c3x c3y c3z
global c4x c4y c4z 

%Tamaño de eslabones en [m]
l1=0.178+0.025; l2=0.325; l3=0.275; l4=0.013+0.025; l5=0.4097;

% Masa:  (kilogramos)
m1=1.33;
m2=0.84;
m3=1.15;
m4= 0.08;
g=9.81;

%Momentos de inercia: ( kilogramos * metros cuadrados)
%Medido desde el sistema de coordenadas de salida.
Ixx1=0.03;
Iyy1=0.03;
Izz1=0.01;

Ixx2=0.04;
Iyy2=0.07;
Izz2=0.04;

Ixx3=0.13;
Iyy3=0.36;
Izz3=0.23;


Ixx4=0.01;
Iyy4=0.04;
Izz4=0.03;

c1x=-0.4; c1y=0; c1z=0.10;
c2x=0.16; c2y=0; c2z=0.21;
c3x=0.43; c3y=0; c3z=0.32;
c4x=0.6; c4y=0; c4z=0.36;



