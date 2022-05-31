function F=c_inv(q)
global l1 l2 l3 l4 xe ye ze gamma
q1=q(1); q2=q(2);q3=q(3);q4=q(4);

%eq1 =
F(1)=l3*(cos(q1)*cos(q2) - sin(q1)*sin(q2)) - xe + l2*cos(q1);
%eq2 =
F(2)=l3*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) - ye + l2*sin(q1);
%eq3 =
F(3)=l1 - l4 + q3 - ze + 1/20;
F(4)=q1+q2+q4-gamma;

end