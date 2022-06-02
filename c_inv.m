function F=c_inv(q)
global l1 l2 l3 l4 l5 xe ye ze alpha betha gamma
q1=q(1);q2=q(2);q3=q(3);q4=q(4);

F=[
%eq1 =
cos(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2)) - sin(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) - cos(betha)*cos(gamma);
%eq2 =
%cos(alpha)*sin(gamma) - sin(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2)) - cos(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) - cos(gamma)*sin(alpha)*sin(betha);
%eq3 =
%- sin(alpha)*sin(gamma) - cos(alpha)*cos(gamma)*sin(betha);
%eq4 =
l3*(cos(q1)*cos(q2) - sin(q1)*sin(q2)) - xe + l2*cos(q1);
%eq5 =
%cos(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) - cos(betha)*sin(gamma) + sin(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2));
%eq6 =
cos(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2)) - sin(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) - cos(alpha)*cos(gamma) - sin(alpha)*sin(betha)*sin(gamma);
%eq7 =
%cos(gamma)*sin(alpha) - cos(alpha)*sin(betha)*sin(gamma);
%eq8 =
l3*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) - ye + l2*sin(q1);
%eq9 =
%sin(betha)
%eq10 = 
%-cos(betha)*sin(alpha);
%eq11 = 
1 - cos(alpha)*cos(betha);
%eq12 =
l1 + l4 - l5 + q3 - ze;
];
end