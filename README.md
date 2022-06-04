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

En la siguiente simulación se pueden observar los sistemas de referencia que se establecieron en el modelado previo del robot, así como 
el movimiento de cada una de las articulaciones

<img src="https://media.giphy.com/media/ENM8XVObYF0KlvLQgh/giphy.gif" width="560" height="420">

## Cinemática Inversa

A continuación, se muestran 4 puntos que pertenecen a la trayectoria que sigue el efector final del robot para poder tomar una tapa de plástico y colocarla en el contenedor. Observar que el efector final se ubica justamente en la coordenadas indicadas, por lo que se comprueba que la cinemática inversa es correcta.

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
  
En la ecuación del determinante se observa que solo está en función de la variable articular q2, por lo que se debe tener especial cuidado en dicha articulación al momento definir una trayectoría del robot, ya que se pueden generar singularidades.

Las singularidades se presentan en los siguientes casos:

  <img src="/Images/Singularidad.jpg">

 ```sh
 DET = l2*l3*sin(q2)
  ```
 ## Trayectoria

#### Para abordar el problema de la trayectoria, se plantearon 4 perfiles quínticos empleando líneas rectas cuyos puntos de inicio y fin se tomaron de una simulación elaborada con ayuda del software RoboDK.

 <img src="https://media.giphy.com/media/F4qjSV3Sjd9D6zDoXB/giphy.gif">
 
 #### A continuación se muestran el trazo del robot su determinante y las respectivas gráficas en los espacios articulares y cartesianos.
 
 ### *Tramo 1*
 
 <img src="https://media.giphy.com/media/0so0jiFmMNFkApfPW1/giphy.gif" width="560" height="420">

#### Determinante

  <img src="/Images/Tramo1/DET_T1.png">

#### Espacio articular

  <img src="/Images/Tramo1/JS_T1.png">
  
  #### Espacio cartesiano
  <img src="/Images/Tramo1/CS_T1.png">
 
### *Tramo 2*
 <img src="https://media.giphy.com/media/GfTWnUMLQzaQgGd9AF/giphy.gif" width="560" height="420">
 
#### Determinante

  <img src="/Images/Tramo2/DET_T2.png">

#### Espacio articular

  <img src="/Images/Tramo2/JS_T2.png">
  
  #### Espacio cartesiano
  <img src="/Images/Tramo2/CS_T2.png">
  
### *Tramo 3*
 <img src="https://media.giphy.com/media/GZ3ERSQS1uLY8Y4ydQ/giphy.gif" width="560" height="420">
 
#### Determinante

  <img src="/Images/Tramo3/DET_T3.png">

#### Espacio articular

  <img src="/Images/Tramo3/JS_T3.png">
  
  #### Espacio cartesiano
  <img src="/Images/Tramo3/CS_T3.png">
  
  ### *Tramo 4*
 <img src="https://media.giphy.com/media/Gr2OXWweowp9nXTKgW/giphy.gif" width="560" height="420">
 
#### Determinante

  <img src="/Images/Tramo4/DET_T4.png">

#### Espacio articular

  <img src="/Images/Tramo4/JS_T4.png">
  
  #### Espacio cartesiano
  <img src="/Images/Tramo4/CS_T4.png">


## Rango de movimiento para las articulaciones

#### Las especificaciones resaltan que las articulaciones J1 y J2 están limitadas a una amplitud de 132[°] y 150[°] respectivamente. Mientras que para la junta prismática J3, tiene un desplazamiento vetical máximo de 200 [mm] hacia abajo. 

  <img src="/Images/Specs.png"> 
  
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
  
  ## Dinámica directa
  
a) Modelo con la postura cero (cuando todas las variables articulares valen cero grados) y
un torque de entrada cero
 
 Diagrama de bloques en SIMULINK
 
<img src="/Images/PosturaCero_CD.JPG" width="740" height="600">

Gráficas

En las siguientes gráficas se observa que el sistema es inestable, al colocar el robot en la postura cero y cuando el torque en los motores es cero. Esto se puede deber al efecto de la gravedad y porque no se  consideró ningún elemento que disipe energía en las articulaciones.

<img src="/Images/PosturaCero_CD_Graficas.JPG">

Simulación 

En la siguiente simulación se observa el comportamiento del robot indicado en las gráficas previas.  Notar que las variables articulares q1, q2 y q4 se mantienen en cero, mientras que q3 tiene al infinito (sistema inestable).

<img src="https://media.giphy.com/media/gz8cSD9ccm9elGBBkk/giphy.gif" width="560" height="420">

b) Modelo con un torque diferente de cero en la primera junta

 Diagrama de bloques en SIMULINK

<img src="/Images/TorqueQ1_DD.JPG" width="740" height="600">

Gráficas

En las siguientes gráficas se observa que el sistema de nuevo es inestable cuando la variable articular presenta un toque de 5 [Nm]. De igual manera al ejemplo anterior, esto se puede deber al efecto de la gravedad y por la falta de elementos disipativos de energía en el sistema.

<img src="/Images/TorqueQ1_DD_Graficas.JPG">

Simulación 

En la simulación se muestra el efecto del torque de 5 [Nm] en la articulación q1, el cual genera la rotación del robot. También se puede observar que se generan singularidades, ya que algunos eslabones colapsan.

<img src="https://media.giphy.com/media/sWzIVadP0aevM2ay5Y/giphy.gif" width="560" height="420">


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

## Puntos de Equilibrio

 Diagrama de bloques en SIMULINK

<img src="/Images/PuntoEquilibrio_DD.JPG" width="740" height="600">

Gráficas

El sistema de equilibrio representa el estado en el que toda la energía del sistema se disipa, es decir, cuando las variables articulares, velocidad y aceleración son cero. En las siguientes gráficas se muestra dicho comportamiento, en cual fue necesario aplicar un torque de 12.0663 [Nm] en la articulación q3 para lograrlo (ver el diagrama de bloques previo).

<img src="/Images/PuntoEquilibrio_DD_Graficas.JPG">

Simulación 

Postura estática

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

### Fuerzas externas

a)Fuerza externa Fz=200N

<img src="https://media.giphy.com/media/knEwCh5TIdIgGHEcgs/giphy.gif" width="560" height="420">

<img src="Images/AcelArt_Fz.jpg" width="560" height="420">

El movimiento es el esperado, el eslabon 3 se mueve en dirección Z rápidamente a causa de la gran fuerza que actúa y en la gráfica de aceleraciones se puede ver la aceleración inicial para despues llegar a una velocidad constante.

b)Fuerza externa Fx=200N

<img src="Images/FuerzaX200.JPG" width="740" height="600">

<img src="Images/FX200_robot.jpg" width="560" height="420">

<img src="Images/AcelArt_Fx.jpg" width="560" height="420">

El movimiento esperado era un movimiento en X, sin embargo, no se mueve ni un poco y esto se puede deber a las restricciones que tiene el modelo, pues si tuviera movimiento en X el robot estaría "libre", en la gráfica de aceleraciones como se puede ver no existe aceleración en ningun motor.

c)Fuerza externa Fx=20000000N

<img src="Images/FuerzaX200000.JPG" width="740" height="600">

<img src="Images/FX200_robot.jpg" width="560" height="420">

<img src="Images/AcelArt_Fx.jpg" width="560" height="420">

A pesar de que se aumenta demasiado el valor de la fuerza, no hay movimiento, por lo tanto se optó por aplicar una fuerza en Y.

d)Fuerza externa Fy=200N

<img src="https://media.giphy.com/media/wqpo6YDg5xOMYlRjZB/giphy.gif" width="560" height="420">

<img src="Images/AcelArt_Fy.jpg" width="560" height="420">

El movimiento es el esperado, la fuerza en Y provoca que el robot pierda su estabilidad, tambien se nota que en todas las juntas tienen aceleración excepto q3. 



## Conclusiones
### Juan Manuel Zuleta Ceja

#### La aplicación de la suma de conocimientos adquiridos durante el curso de Robótica, plasmados en este proyecto, concretó el entendimiento de los mismos. Además, al haber sido elaborado este proyecto de forma colaborativa, supuso un reto de comunicación que si bien se logró superar, se resalta la importancia de varios aspectos que dependían de este factor: el conocimiento del robot (para así plantear una representación DH fiel al robot modealdo),comprender el efecto de la arbitrariedad de los valores de entrada en la cinemática y dinámica (inversa y directa), discutir los resultados y su interpretación física en cuanto a que éstas fueran apegadas a la realidad, entre otros.
#### Otro factor relevante es la capacidad de cómputo con la que se cuenta pues dictó un cambió importante en cuanto a rehacer todo el modelado pero para un robot de menor GDL, pues fue más viable eso a invertir tiempo y trabajo a ecuaciones poco manipulables. 
#### Por último, queda concluir que el proyecto cumplió su objetivo al ser una síntesis de todo el análisis matemático e ingenieril para el ámbito de la robótica y su irremediable relación con la automatización. 
