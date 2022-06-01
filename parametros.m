%Parametros del robot (https://epsonemear.a.bigcontent.io/v1/static/a9866-brochure-lores-en-gb-ls-b_series)
global l1 l2 l3 l4 m1 m2 m3 m4 lc1 lc2 lc3 lc4 Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3 Ixx4 Iyy4 Izz4 g
 
%Tamaño de eslabones en [m]
l1=0.1665; l2=0.325; l3=0.275 ;l4=0.4;

lc1=l1/2;
lc2=l2/2;
lc3=l3/3;
lc4=l4/2;
% Masa:  (kilogramos)
m1=1.33;
m2=0.84;
m3=1.15;
m4= 0.08;
g=9.81;

%Momentos de inercia: ( kilogramos * metros cuadrados)
%Medido desde el sistema de coordenadas de salida.
Ixx1=0.03;
Iyy1=0.01;
Izz1=0.03;

Ixx2=0.07;
Iyy2=0.04;
Izz2=0.04;

Ixx3=0.36;
Iyy3=0.23;
Izz3=0.13;


Ixx4=0.04;
Iyy4=0.03;
Izz4=0.01;


