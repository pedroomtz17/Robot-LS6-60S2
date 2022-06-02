% Simulación 2
clc; clear all;close all;
parametros

global xe ye ze gamma
%xe=-0.5547;ye=-0.104;ze=-0.1464;gamma=-pi; %Posición 3

q0=[0,0,0.2,0];
%plot3(xe,ye,ze,'r*');

for i=0:1:3  
    if(i==0) %Posición inicial
        %Donde (0,0.5,0,0,0,pi) 
          xe=0;ye=0.5;ze=0;gamma=pi;
        q=fsolve(@c_inv,q0)

        figure(i+1)
        robot(q(1),q(2),q(3),q(4))
        hold on 
        plot3(xe,ye,ze,'r*')
        title('Posición inicial')
      
    elseif (i==1) %Posición 2
        xe=0;ye=0.5;ze=-0.154;gamma=pi; 
        q=fsolve(@c_inv,q0)
        
        figure(i+1)
        robot(q(1),q(2),q(3),q(4))
        hold on 
        plot3(xe,ye,ze,'r*')
        title('Posición 2')
        
    elseif(i==2) %Posición 3
        xe=-0.5547;ye=-0.104;ze=0;gamma=-pi; 
        
        q=fsolve(@c_inv,q0)
        
        figure(i+1) 
        robot(q(1),q(2),q(3),q(4))
        hold on 
        plot3(xe,ye,ze,'r*')
        title('Posición 3')
    else
        xe=-0.5547;ye=-0.104;ze=-0.1464;gamma=-pi; 
        
        q=fsolve(@c_inv,q0)
        
        figure(i+1) 
        robot(q(1),q(2),q(3),q(4))
        hold on 
        plot3(xe,ye,ze,'r*')
        title('Posición final')
         
    end
    i=i+1;

 end 