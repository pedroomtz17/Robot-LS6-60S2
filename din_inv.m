function Tau=din_inv(q1,q2,q3,q1p,q2p,q3p,q1pp,q2pp,q3pp)
    q4=0;
    q4p=0;
    q4pp=0;
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
     
    qpp=[q1pp;q2pp;q3pp;q4pp];
    Tau=M*qpp+C+G;

end
 