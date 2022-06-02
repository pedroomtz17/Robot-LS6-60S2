function perf = tr1(t)

    tf=t; % tiempo final de la trayetoria
    c=1;

    %Posiciones iniciales y finales
    pin=[0;0.6;0];
    pf=[0;0.6;-0.154];

    %Orientaciones iniciales y finales
    ai=[0;0;pi];
    af=[0;0;pi];

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

    global xe ye ze gamma

    c=1;
    q0=[pi/2,pi,0,pi,0,0];%condición inicial
    for i=1:1:length(x)
        clf
        %Trayectoria de efector
        xe=x(i);
        ye=y(i);
        ze=z(i);
        gamma=pi;
  
        q=fsolve(@c_inv,q0);
        q1(c)=q(1); q2(c)=q(2); q3(c)=q(3);  
  
        %% Calculo de la velocidad articular
        xp=[zv(i);a2p(i);a3p(i)];%velocidad cartesiana
        xpp=[za(i);a2pp(i);a3pp(i)];%aceleración cartesiana
        %Jacobiano 77 inverso
        J05i= [                           cos(q(1) + q(2))/(l2*sin(q(2))),                       sin(q(1) + q(2))/(l2*sin(q(2))), 0;
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
        q0=q;
        c=c+1;
     
    end
    perf = [q1,q2,q3,q1p,q2p,q3p,q1pp,q2pp,q3pp];
end