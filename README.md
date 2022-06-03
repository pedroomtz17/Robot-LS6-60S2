# Robot-LS6-60S2

## Parámetros Denavit-Hartenberg 


<img src="/Images/ParametrosDH.JPG" width="761" height="585">

## Cinemática Directa
```sh
CD =
 
[ cos(q1 + q2 + q4), -sin(q1 + q2 + q4), 0, l3*cos(q1 + q2) + l2*cos(q1)]
[ sin(q1 + q2 + q4),  cos(q1 + q2 + q4), 0, l3*sin(q1 + q2) + l2*sin(q1)]
[                 0,                  0, 1,            l1 + l4 - l5 + q3]
[                 0,                  0, 0,                            1]
```
Comprobación

<img src="https://media.giphy.com/media/ENM8XVObYF0KlvLQgh/giphy.gif" width="560" height="420">

## Cinemática Inversa
- Posición 1
```sh
        xe=0; ye=0.5; ze=0; gamma=pi;
 ```
<img src="/Images/Position1.jpg" width="540" height="400">

- Posición 2
```sh
        xe=0; ye=0.5; ze=-0.154; gamma=pi;
 ```
<img src="/Images/Position2.jpg" width="540" height="400">

- Posición 3
```sh
        xe=-0.5547; ye=-0.104; ze=0; gamma=-pi;
 ```
<img src="/Images/Position3.jpg" width="540" height="400">

- Posición 4
```sh
        xe=-0.5547; ye=-0.104; ze=-0.1464; gamma=-pi;
 ```
<img src="/Images/Position4.jpg" width="540" height="400">

## Jacobiano por el método de propagación de velocidades

```sh
J05 = 
[ - l3*sin(q1 + q2) - l2*sin(q1), -l3*sin(q1 + q2), 0]
[   l3*cos(q1 + q2) + l2*cos(q1),  l3*cos(q1 + q2), 0]
[                              0,                0, 1]
 ```
  ## Determinante
 ```sh
 DET = l2*l3*sin(q2)
  ```
  
  
  ## Dinámica directa
  
a) Modelo con la postura cero (cuando todas las variables articulares valen cero grados) y
un torque de entrada cero
  
<img src="/Images/PosturaCero_CD.JPG" width="740" height="600">

Gráficas

<img src="/Images/PosturaCero_CD_Graficas.JPG">

Simulación 

<img src="https://media.giphy.com/media/gz8cSD9ccm9elGBBkk/giphy.gif" width="560" height="420">

b) Modelo con un torque diferente de cero en la primera junta

<img src="/Images/TorqueQ1_DD.JPG" width="740" height="600">

Gráficas

<img src="/Images/TorqueQ1_DD_Graficas.JPG">

Simulación 

<img src="https://media.giphy.com/media/sWzIVadP0aevM2ay5Y/giphy.gif" width="560" height="420">

## Puntos de Equilibrio

<img src="/Images/PuntoEquilibrio_DD.JPG" width="740" height="600">

Gráficas

<img src="/Images/PuntoEquilibrio_DD_Graficas.JPG">

Simulación 

<img src="/Images/PuntoEquilibrio_DD_Robot.JPG" width="540" height="400">

## Puntos Inestables

- Punto Inestable 1

<img src="/Images/PuntoInestable1_Simulink.JPG" width="740" height="600">

Gráficas

<img src="/Images/PuntoInestable1_Graficas.JPG">

- Punto Inestable 2

<img src="/Images/PuntoInestable2_Simulink.JPG" width="740" height="600">

Gráficas

<img src="/Images/PuntoInestable2_Graficas.JPG">
=======
## Modelado dinámico
### Modelo dinámico en forma matricial
```sh
        M =[ (39*cos(q2 + q4))/1250 + (251459*cos(q2))/400000 + (33*cos(q4))/1250 + 2738753/2000000, (39*cos(q2 + q4))/2500 + (251459*cos(q2))/800000 + (33*cos(q4))/1250 + 3711731/4000000,       0, (39*cos(q2 + q4))/2500 + (33*cos(q4))/2500 + 147/2500;
         (39*cos(q2 + q4))/2500 + (251459*cos(q2))/800000 + (33*cos(q4))/1250 + 3711731/4000000,                          (33*cos(q4))/1250 + 65297462298826248931/70368744177664000000,       0,                          (33*cos(q4))/2500 + 147/2500;
                                                                                      0,                                                                                      0, 123/100,                                                     0;
                                  (39*cos(q2 + q4))/2500 + (33*cos(q4))/2500 + 147/2500,                                                           (33*cos(q4))/2500 + 147/2500,       0,                                              147/2500];

 ```
### Vector de fuerzas gravitacionales
```sh
        G =[     0;
                 0;
           12.0663;
                 0];
 ```
### Fuerzas de coriolis
```sh
        C =[- (251459*q2p^2*sin(q2))/800000 - (33*q4p^2*sin(q4))/2500 - (39*q2p^2*sin(q2 + q4))/2500 - (39*q4p^2*sin(q2 + q4))/2500 - (251459*q1p*q2p*sin(q2))/400000 - (33*q1p*q4p*sin(q4))/1250 - (33*q2p*q4p*sin(q4))/1250 - (39*q1p*q2p*sin(q2 + q4))/1250 - (39*q1p*q4p*sin(q2 + q4))/1250 - (39*q2p*q4p*sin(q2 + q4))/1250;
                                                                                                                                                                       (251459*q1p^2*sin(q2))/800000 - (33*q4p^2*sin(q4))/2500 + (39*q1p^2*sin(q2 + q4))/2500 - (33*q1p*q4p*sin(q4))/1250 - (33*q2p*q4p*sin(q4))/1250;
                                                                                                                                                                                                                                                                                                                    0;
                                                                                                                                                                                                         (33*q1p^2*sin(q4))/2500 + (33*q2p^2*sin(q4))/2500 + (39*q1p^2*sin(q2 + q4))/2500 + (33*q1p*q2p*sin(q4))/1250];                              
    
 ```
### Fuerza externa
```sh
        Fext = [fy05*0.325*cos(q1) - fx05*0.325*sin(q1) + fy05*0.275*cos(q1 + q2) - fx05*0.275*sin(q1 + q2);
                                                          fy05*0.275*cos(q1 + q2) - fx05*0.275*sin(q1 + q2);
                                                                                                       fz05;
  
 ```
### Vector de friccion
```sh
        f=[0.3*q1p;0.3*q2p;0.3*q3p;0.3*q4p];
 ```
## Dinámica Inversa
Debido a que el fabricante no proporciona especificaciones de los motores, se propusieron las siguientes saturaciones:
 Para q1 [20, -20]
 Para q2 [25, -25]
 para q3 [16, -16]
 Para q4 [5, -5]
 
 <img src="/Images/Dinv.JPG" width="540" height="400">
 
### Evaluación Tramo 1

<img src="/Images/Dinv_Tr1.jpg" width="540" height="400">

Para el tramo 1 de la trayectoria propuesta el unico torque visible es el de q3, lo cual es correcto pues solo existe un desplazamiento en Z.

### Evaluación Tramo 2

<img src="/Images/Dinv_Tr2.jpg" width="540" height="400">

Para el tramo 2 se ven distintos valores de torques para los 3 motores q1, q2 y q3. (q4 no actúa en la trayectoria del robot).

### Evaluación Tramo 3

<img src="/Images/Dinv_Tr3.jpg" width="540" height="400">

Para el tramo 3 de la trayectoria propuesta el unico torque visible es el de q3, lo cual es correcto pues solo existe un desplazamiento en Z.

### Evaluación Tramo 4

<img src="/Images/Dinv_Tr4.jpg" width="540" height="400">

Para el tramo 4 se ven distintos valores de torques para los 3 motores q1, q2 y q3. (q4 no actúa en la trayectoria del robot).

Se concluye que, para la trayectoria propuesta en la cinemática, los torques son correctos y están dentro de las magnitudes soportadas por los motores. 

### Fuerzas externas

a)Fuerza externa Fz=200N

<img src="https://media.giphy.com/media/knEwCh5TIdIgGHEcgs/giphy.gif" width="560" height="420">

<img src="Images/AcelArt_Fz.jpg" width="560" height="420">

El movimiento es el esperado, el eslabon 3 se mueve en dirección Z rápidamente a causa de la gran fuerza que actúa y en la gráfica de aceleraciones se puede ver la aceleración inicial para despues llegar a una velocidad constante.

b)Fuerza externa Fx=200N

<img src="Images/FuerzaX200.JPG" width="560" height="420">

<img src="Images/FX200_robot.jpg" width="560" height="420">

<img src="Images/AcelArt_Fx.jpg" width="560" height="420">

El movimiento esperado era un movimiento en X, sin embargo, no se mueve ni un poco y esto se puede deber a las restricciones que tiene el modelo, pues si tuviera movimiento en X el robot estaría "libre", en la gráfica de aceleraciones como se puede ver no existe aceleración en ningun motor.

c)Fuerza externa Fx=20000000N

<img src="Images/FuerzaX200000.JPG" width="560" height="420">

<img src="Images/FX200_robot.jpg" width="560" height="420">

<img src="Images/AcelArt_Fx.jpg" width="560" height="420">

A pesar de que se aumenta demasiado el valor de la fuerza, no hay movimiento, por lo tanto se optó por aplicar una fuerza en Y.

d)Fuerza externa Fy=200N

<img src="https://media.giphy.com/media/wqpo6YDg5xOMYlRjZB/giphy.gif" width="560" height="420">

<img src="Images/AcelArt_Fy.jpg" width="560" height="420">

El movimiento es el esperado, la fuerza en Y provoca que el robot pierda su estabilidad, tambien se nota que en todas las juntas tienen aceleración excepto q3. 
>>>>>>> ReadmeDiego
