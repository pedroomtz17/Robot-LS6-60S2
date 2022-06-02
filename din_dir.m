function qpp=din_dir(q1,q2,q3,q4,q1p,q2p,q3p,q4p,t1,t2,t3,t4,fx05,fy05,fz05)

M =[ (39*cos(q2 + q4))/1250 + (251459*cos(q2))/400000 + (33*cos(q4))/1250 + 2738753/2000000, (39*cos(q2 + q4))/2500 + (251459*cos(q2))/800000 + (33*cos(q4))/1250 + 3711731/4000000,       0, (39*cos(q2 + q4))/2500 + (33*cos(q4))/2500 + 147/2500;
 (39*cos(q2 + q4))/2500 + (251459*cos(q2))/800000 + (33*cos(q4))/1250 + 3711731/4000000,                          (33*cos(q4))/1250 + 65297462298826248931/70368744177664000000,       0,                          (33*cos(q4))/2500 + 147/2500;
                                                                                      0,                                                                                      0, 123/100,                                                     0;
                                  (39*cos(q2 + q4))/2500 + (33*cos(q4))/2500 + 147/2500,                                                           (33*cos(q4))/2500 + 147/2500,       0,                                              147/2500];



C =[- (251459*q2p^2*sin(q2))/800000 - (33*q4p^2*sin(q4))/2500 - (39*q2p^2*sin(q2 + q4))/2500 - (39*q4p^2*sin(q2 + q4))/2500 - (251459*q1p*q2p*sin(q2))/400000 - (33*q1p*q4p*sin(q4))/1250 - (33*q2p*q4p*sin(q4))/1250 - (39*q1p*q2p*sin(q2 + q4))/1250 - (39*q1p*q4p*sin(q2 + q4))/1250 - (39*q2p*q4p*sin(q2 + q4))/1250;
                                                                                                                                                                       (251459*q1p^2*sin(q2))/800000 - (33*q4p^2*sin(q4))/2500 + (39*q1p^2*sin(q2 + q4))/2500 - (33*q1p*q4p*sin(q4))/1250 - (33*q2p*q4p*sin(q4))/1250;
                                                                                                                                                                                                                                                                                                                    0;
                                                                                                                                                                                                         (33*q1p^2*sin(q4))/2500 + (33*q2p^2*sin(q4))/2500 + (39*q1p^2*sin(q2 + q4))/2500 + (33*q1p*q2p*sin(q4))/1250];                              
                                                            
G =[     0;
         0;
   12.0663;
         0];
     
tau=[t1;t2;t3;t4];

%Fuerza externa
Fext = [fx05*((sin(q4)*(l3 + l2*cos(q2)) + l2*cos(q4)*sin(q2))*(cos(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2)) - sin(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1))) - (cos(q4)*(l3 + l2*cos(q2)) - l2*sin(q2)*sin(q4))*(cos(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) + sin(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2)))) + fy05*((sin(q4)*(l3 + l2*cos(q2)) + l2*cos(q4)*sin(q2))*(cos(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) + sin(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2))) + (cos(q4)*(l3 + l2*cos(q2)) - l2*sin(q2)*sin(q4))*(cos(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2)) - sin(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1))));
                                                                                                                                                         fy05*(l3*cos(q4)*(cos(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2)) - sin(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1))) + l3*sin(q4)*(cos(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) + sin(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2)))) - fx05*(l3*cos(q4)*(cos(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1)) + sin(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2))) - l3*sin(q4)*(cos(q4)*(cos(q1)*cos(q2) - sin(q1)*sin(q2)) - sin(q4)*(cos(q1)*sin(q2) + cos(q2)*sin(q1))));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    fz05];
 
    
%vector columna de fricciones (energía disipativa al presentarse velocidad)
f=[1*q1p;0.123*q2p;2*q3p;0.123*q4p];
% qpp=inv(M)*(tau-C-G);
qpp=inv(M)*(tau-f+Fext-C-G);


end