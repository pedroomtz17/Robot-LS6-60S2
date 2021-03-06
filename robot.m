function []=robot(q1,q2,q3,q4)
global l1 l2 l3 l4 l5
parametros

clf;

S01=DHC(0,0,q1,l1);
S12=DHC(0,l2,q2,0);
S23=DHC(0,l3,0,l4);
%La junta 34 es prismática
S34=DHC(0,0,q4,q3);
S45=DHC(0,0,0,-l5);

CD=S01*S12*S23*S34*S45;

% Vectores de posición
S02=S01*S12;
S03=S01*S12*S23;
S04=S01*S12*S23*S34;
S05=S01*S12*S23*S34*S45;

%Trazo de eslabones
x=[0 S01(1,4) S02(1,4) S03(1,4) S04(1,4) S05(1,4)];
y=[0 S01(2,4) S02(2,4) S03(2,4) S04(2,4) S05(2,4)];
z=[0 S01(3,4) S02(3,4) S03(3,4) S04(3,4) S05(3,4)];

plot3(x,y,z,'color','#7E2F8E','linewidth',4);
hold on

%Trazo de sistemas de referencia
frame(eye(4),'r',0.1)
% frame(S01,'g',0.1)
% frame(S02,'b',0.1)
% %frame(S03,'r',0.1)
% frame(S04,'g',0.1)
frame(S05,'c',0.1)
grid on
title('Epson SCARA LS6-60S2 Robot');
n=0.6;
axis([-n n -n n -n n])
% axis([-0.7 0.2 -0.4 0.1 -0.2 0.4])
% campos([-0.7 -0.2 0.4]);
end
