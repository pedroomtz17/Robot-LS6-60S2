clc; close all; clear all;
parametros

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Perfil quintico (TRAMO 3)
% Universididad Nacional Autónoma de México
% Robótica
% Noé Alfredo Martínez Sánchez
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tf=5; % tiempo final de la trayetoria
c=1;

%Posiciones iniciales y finales
pin=[-0.5547;-0.104;0];
pf=[-0.5547;-0.104;-0.1464];

%Orientaciones iniciales y finales
ai=[0;0;-pi];
af=[0;0;-pi];

% Posición
for t=0:1/10:tf
   time(c)=t;
   Rt=pin+(10*(t/tf)^3-15*(t/tf)^4+6*(t/tf)^5)*(pf-pin);
   x(c)=Rt(1);
   y(c)=Rt(2);
   z(c)=Rt(3);
   c=c+1;
end

c=1;
for t=0:1/10:tf
   Rt=ai+(10*(t/tf)^3-15*(t/tf)^4+6*(t/tf)^5)*(af-ai);
   a1(c)=Rt(1);
   a2(c)=Rt(2);
   a3(c)=Rt(3);
   c=c+1;
end

figure(1)
plot(time,x,'r');
hold on
plot(time,y,'g');
hold on
plot(time,z,'b');
hold on
plot(time,a1,'r*');
hold on
plot(time,a2,'g*');
hold on
plot(time,a3,'b*');
hold on
title('Posición espacio cartesiano T3')
xlabel('Tiempo[s]')
ylabel('Posición[m] Orientacion[rad]')
legend('x','y','z','\alpha','\beta','\gamma','orientation','horizontal','location','SouthEast')
grid on

% Velocidad cartesiana
c=1;
for t=0:1/10:tf
   time(c)=t;
   Vt=(30*(t^2/tf^3)-60*(t^3/tf^4)+30*(t^4/tf^5))*(pf-pin);
   xv(c)=Vt(1);
   yv(c)=Vt(2);
   zv(c)=Vt(3);
   c=c+1;
end

c=1;
for t=0:1/10:tf
   Vt=(30*(t^2/tf^3)-60*(t^3/tf^4)+30*(t^4/tf^5))*(af-ai);
   a1p(c)=Vt(1);
   a2p(c)=Vt(2);
   a3p(c)=Vt(3);
   c=c+1;
end

figure(2)
plot(time,xv,'r');
hold on
plot(time,yv,'g');
hold on
plot(time,zv,'b');
hold on
plot(time,a1p,'r*');
hold on
plot(time,a2p,'g*');
hold on
plot(time,a3p,'b*');
hold on
title('Velocidad espacio cartesiano T3')
xlabel('Tiempo [s]')
ylabel('Velocidad [m/s]-[rad/s]')
legend('x\prime','y\prime','z\prime','\alpha\prime','\beta\prime','\gamma\prime',...
    'orientation','horizontal','location','SouthEast')
grid on

% Aceleración cartesiana
c=1;
for t=0:1/10:tf
   time(c)=t;
   At=(60*(t/tf^3)-180*(t^2/tf^4)+120*(t^3/tf^5))*(pf-pin);
   xa(c)=At(1);
   ya(c)=At(2);
   za(c)=At(3);
   c=c+1;
end

c=1;
for t=0:1/10:tf
   At=(60*(t/tf^3)-180*(t^2/tf^4)+120*(t^3/tf^5))*(af-ai);
   a1pp(c)=At(1);
   a2pp(c)=At(2);
   a3pp(c)=At(3);
   c=c+1;
end
figure(3)
plot(time,xa,'r');
hold on
plot(time,ya,'g');
hold on
plot(time,za,'b');
hold on
plot(time,a1pp,'r*');
hold on
plot(time,a2pp,'g*');
hold on
plot(time,a3pp,'b*');
hold on
title('Aceleración espacio cartesiano T3')
xlabel('Tiempo [s]')
ylabel('Aceleración [m/s^2]-[rad/s^2]')
legend('x\prime\prime','y\prime\prime','z\prime\prime',...
    '\alpha\prime\prime','\beta\prime\prime','\gamma\prime\prime',...
    'orientation','horizontal','location','SouthEast')
grid on

figure(4)
global xe ye ze gamma

c=1;
q0=[pi,0,0,0];%condición inicial
for i=1:1:length(x)
  clf
  %Trayectoria de efector
  xe=x(i);
  ye=y(i);
  ze=z(i);
  gamma=pi;
  
  q=fsolve(@c_inv,q0);
  q1(c)=q(1); q2(c)=q(2); q3(c)=q(3);  
  
  DET(c)= l2*l3*sin(q(2));
  %% Calculo de la velocidad articular
  xp=[xv(i);yv(i);zv(i)];%velocidad cartesiana
  xpp=[xa(i);ya(i);za(i)];%aceleración cartesiana
  
  %Jacobiano 77 inverso
  J05i=   [                       cos(q(1) + q(2))/(l2*sin(q(2))),                       sin(q(1) + q(2))/(l2*sin(q(2))), 0;
        -(l3*cos(q(1) + q(2)) + l2*cos(q(1)))/(l2*l3*sin(q(2))), -(l3*sin(q(1) + q(2)) + l2*sin(q(1)))/(l2*l3*sin(q(2))), 0;
                                                                      0,                                               0, 1];
  
  %mapeo de la velocidad cartesiana a velocidad articular 
  qp=J05i*xp;
  q1p(c)=qp(1); q2p(c)=qp(2); q3p(c)=qp(3);
  
  %% Calculo de la aceleración articular
  J05p = [ - l2*qp(1)*cos(q(1)) - l3*qp(1)*cos(q(1) + q(2)) - l3*qp(2) *cos(q(1) + q(2)), -l3*cos(q(1) + q(2))*(qp(1) + qp(2)), 0;
           - l2*qp(1)*sin(q(1)) - l3*qp(1)*sin(q(1) + q(2)) - l3*qp(2)*sin(q(1) + q(2)), -l3*sin(q(1) + q(2))*(qp(1)+ qp(2)), 0;
                                                                      0,                            0, 0];
 
  %mapeo de la aceleración cartesiana a aceleración articular
  qpp=J05i*xpp-J05i*J05p*J05i*xp;
  q1pp(c)=qpp(1); q2pp(c)=qpp(2); q3pp(c)=qpp(3); 
  robot(q(1),q(2),q(3),q(4))
  hold on
  plot3(x,y,z,'b*')
  campos([1 1 1])
  pause(0.001)
  q0=q;
  c=c+1;
     
end

% q11 = transpose([time;rad2deg(q1)]);
% q12 = transpose([time;rad2deg(q2)]);
% q13 = transpose([time;rad2deg(q3)]);

q11 = transpose([time;q1]);
q12 = transpose([time;q2]);
q13 = transpose([time;q3]);

%Graficas de posición de las juntas
figure(5)
plot(time,rad2deg(q1),'r');
hold on
plot(time,rad2deg(q2),'g');
plot(time,rad2deg(q3),'b');
title('Espacio de juntas en posición T3');
xlabel('Tiempo [s]');
ylabel('Grados');
legend('q1','q2','q3');
grid on;

figure(6)
plot(DET)
title('Determinante T1');
grid on

%Graficas de velocidad articular
figure(7)
plot(time,rad2deg(q1p),'r');
hold on
plot(time,rad2deg(q2p),'g');
plot(time,rad2deg(q3p),'b');
title('Espacio de juntas en velocidad T3');
xlabel('Tiempo [s]');
ylabel('Grados/s');
legend('q1p','q2p','q3p');
grid on;

%Graficas de velocidad articular
figure(8)
plot(time,rad2deg(q1pp),'r');
hold on
plot(time,rad2deg(q2pp),'g');
plot(time,rad2deg(q3pp),'b');
title('Espacio de juntas en aceleración T3');
xlabel('Tiempo [s]');
ylabel('Grados/seg^2');
legend('q1pp','q2pp','q3pp');
grid on;