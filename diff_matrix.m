function out=diff_matrix(M,qp,q)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UNIVERSIDAD NACIONAL AUTÃ“NOMA DE MÃ‰XICO
% FACULTAD DE INGENÃ?ERIA
% MECATRÃ“NICA
% CURSO DE ROBÃ“TICA
% ING. NOÃ‰ ALFREDO MARTÃ?NEZ SÃ?NCHEZ
% Fecha: 15-Noviembre-2021 Ciudad de MÃ©xico
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funciÃ³n realiza la derivada de una matriz
% Entradas: 
%          M matriz de dimensiones nxn
%          q vector de posiciones articulares nx1
%          qp vector de velocidades articulares nx1
% Salidas:
%          Mp matriz M derivada de dimensiones nxn  
% Ejemplo:
%          Mp=diff_matrix(M,qp,q)

[a,b]=size(M);
[c,d]=size(q);

for i=1:1:a
    for j=1:1:b
        e=1;
        for k=1:1:c
            Md(1,e)=diff(M(i,j),q(k));
            if e==c
                %disp([num2str(i),',',num2str(j)])
                Mp(i,j)=Md*qp;
            end
            e=e+1;
        end
    end
end
out=Mp;



