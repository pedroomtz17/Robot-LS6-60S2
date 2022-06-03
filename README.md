# Robot-LS6-60S2

## Parámetros Denavit-Hartenberg

<img src="/imagenes/ParámetrosDH.png" width="761" height="585">

## Cinemática Directa

```sh
CD=S01*S12*S23*S34*S45*S56*S67

CD =

[ sin(q5)*(sin(q1)*sin(q4) - cos(q4)*(cos(q1)*sin(q3)*sin(q2 + pi/2) - cos(q1)*cos(q3)*cos(q2 + pi/2))) + cos(q5)*(cos(q1)*cos(q3)*sin(q2 + pi/2) + cos(q1)*cos(q2 + pi/2)*sin(q3)), sin(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q4)*(cos(q1)*sin(q3)*sin(q2 + pi/2) - cos(q1)*cos(q3)*cos(q2 + pi/2))) - sin(q5)*(cos(q1)*cos(q3)*sin(q2 + pi/2) + cos(q1)*cos(q2 + pi/2)*sin(q3))) - cos(q6)*(cos(q4)*sin(q1) + sin(q4)*(cos(q1)*sin(q3)*sin(q2 + pi/2) - cos(q1)*cos(q3)*cos(q2 + pi/2))),   sin(q6)*(cos(q4)*sin(q1) + sin(q4)*(cos(q1)*sin(q3)*sin(q2 + pi/2) - cos(q1)*cos(q3)*cos(q2 + pi/2))) + cos(q6)*(cos(q5)*(sin(q1)*sin(q4) - cos(q4)*(cos(q1)*sin(q3)*sin(q2 + pi/2) - cos(q1)*cos(q3)*cos(q2 + pi/2))) - sin(q5)*(cos(q1)*cos(q3)*sin(q2 + pi/2) + cos(q1)*cos(q2 + pi/2)*sin(q3))), l6*(sin(q5)*(sin(q1)*sin(q4) - cos(q4)*(cos(q1)*sin(q3)*sin(q2 + pi/2) - cos(q1)*cos(q3)*cos(q2 + pi/2))) + cos(q5)*(cos(q1)*cos(q3)*sin(q2 + pi/2) + cos(q1)*cos(q2 + pi/2)*sin(q3))) - l4*(cos(q1)*sin(q3)*sin(q2 + pi/2) - cos(q1)*cos(q3)*cos(q2 + pi/2)) + l5*(cos(q1)*cos(q3)*sin(q2 + pi/2) + cos(q1)*cos(q2 + pi/2)*sin(q3)) + l2*cos(q1) + l3*cos(q1)*cos(q2 + pi/2)]
[ cos(q5)*(cos(q3)*sin(q1)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q1)*sin(q3)) - sin(q5)*(cos(q1)*sin(q4) + cos(q4)*(sin(q1)*sin(q3)*sin(q2 + pi/2) - cos(q3)*cos(q2 + pi/2)*sin(q1))), cos(q6)*(cos(q1)*cos(q4) - sin(q4)*(sin(q1)*sin(q3)*sin(q2 + pi/2) - cos(q3)*cos(q2 + pi/2)*sin(q1))) - sin(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q4)*(sin(q1)*sin(q3)*sin(q2 + pi/2) - cos(q3)*cos(q2 + pi/2)*sin(q1))) + sin(q5)*(cos(q3)*sin(q1)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q1)*sin(q3))), - sin(q6)*(cos(q1)*cos(q4) - sin(q4)*(sin(q1)*sin(q3)*sin(q2 + pi/2) - cos(q3)*cos(q2 + pi/2)*sin(q1))) - cos(q6)*(cos(q5)*(cos(q1)*sin(q4) + cos(q4)*(sin(q1)*sin(q3)*sin(q2 + pi/2) - cos(q3)*cos(q2 + pi/2)*sin(q1))) + sin(q5)*(cos(q3)*sin(q1)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q1)*sin(q3))), l5*(cos(q3)*sin(q1)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q1)*sin(q3)) - l4*(sin(q1)*sin(q3)*sin(q2 + pi/2) - cos(q3)*cos(q2 + pi/2)*sin(q1)) - l6*(sin(q5)*(cos(q1)*sin(q4) + cos(q4)*(sin(q1)*sin(q3)*sin(q2 + pi/2) - cos(q3)*cos(q2 + pi/2)*sin(q1))) - cos(q5)*(cos(q3)*sin(q1)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q1)*sin(q3))) + l2*sin(q1) + l3*cos(q2 + pi/2)*sin(q1)]
[                                                     cos(q4)*sin(q5)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)) - cos(q5)*(cos(q3)*cos(q2 + pi/2) - sin(q3)*sin(q2 + pi/2)),                                                                                         sin(q6)*(sin(q5)*(cos(q3)*cos(q2 + pi/2) - sin(q3)*sin(q2 + pi/2)) + cos(q4)*cos(q5)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3))) + cos(q6)*sin(q4)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)),                                                                                           cos(q6)*(sin(q5)*(cos(q3)*cos(q2 + pi/2) - sin(q3)*sin(q2 + pi/2)) + cos(q4)*cos(q5)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3))) - sin(q4)*sin(q6)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)),                                                                                                     l1 + l4*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)) - l5*(cos(q3)*cos(q2 + pi/2) - sin(q3)*sin(q2 + pi/2)) + l3*sin(q2 + pi/2) - l6*(cos(q5)*(cos(q3)*cos(q2 + pi/2) - sin(q3)*sin(q2 + pi/2)) - cos(q4)*sin(q5)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)))]
[                                                                                                                                                                                 0,                                                                                                                                                                                                                                                                                                   0,                                                                                                                                                                                                                                                                                                     0,                                                                                                                                                                                                                                                                                                                                                                             1]
```

Comprobación

<img src="https://media.giphy.com/media/kjOsFAgR3XuJQJAsR5/giphy.gif" width="560" height="420">

## Cinemática Inversa

- Posición Inicial

```sh
        xe=0.55;ye=0;ze=0.805;
        alfa=0;betha=0;gamma=0;
```

<img src="/Images/Coordenada_PosicionInicial.jpg" width="540" height="400">

- Posición Intermedia

```sh
        xe=0.824199;ye=0.02975;ze=0.340979;
        alfa=0;betha=0;gamma=0;
```

<img src="/Images/Coordenada_PosicionIntermedia.jpg" width="540" height="400">

- Posición Final

```sh
        xe=0.158752;ye=0.790429;ze=0.492442;
        alfa=0;betha=0;gamma=0;
```

<img src="/Images/Coordenada_PosiciFinal.jpg" width="540" height="400">

## Jacobiano por el método de propagación de velocidades

```sh
J77r_simp =

[                                                                                                                                                                                                                                                                                                                                                                                     sin(q4)*sin(q5)*(l2 + l4*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + l5*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)) + l3*cos(q2 + pi/2)),                                                                                                cos(q5)*(l4 + l3*cos(q3)) + cos(q4)*sin(q5)*(l5 + l3*sin(q3)),                                                                                 l4*cos(q5) + l5*cos(q4)*sin(q5),                  0,          0, 0]
[ l6*(cos(q6)*(sin(q5)*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + cos(q4)*cos(q5)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3))) + sin(q4)*sin(q6)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3))) + cos(q4)*cos(q6)*(l2 + l4*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + l5*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)) + l3*cos(q2 + pi/2)) + cos(q5)*sin(q4)*sin(q6)*(l2 + l4*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + l5*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)) + l3*cos(q2 + pi/2)), l6*(cos(q4)*sin(q6) + cos(q5)*cos(q6)*sin(q4)) + sin(q6)*(sin(q5)*(l4 + l3*cos(q3)) + cos(q4)*cos(q5)*(l5 + l3*sin(q3))) + cos(q6)*sin(q4)*(l5 + l3*sin(q3)), l6*(cos(q4)*sin(q6) + cos(q5)*cos(q6)*sin(q4)) + sin(q6)*(l4*sin(q5) + l5*cos(q4)*cos(q5)) + l5*cos(q6)*sin(q4), l6*cos(q6)*sin(q5), l6*sin(q6), 0]
[ l6*(sin(q6)*(sin(q5)*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + cos(q4)*cos(q5)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3))) + cos(q6)*sin(q4)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3))) + cos(q4)*sin(q6)*(l2 + l4*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + l5*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)) + l3*cos(q2 + pi/2)) + cos(q5)*cos(q6)*sin(q4)*(l2 + l4*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + l5*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)) + l3*cos(q2 + pi/2)), l6*(cos(q4)*cos(q6) + cos(q5)*sin(q4)*sin(q6)) + cos(q6)*(sin(q5)*(l4 + l3*cos(q3)) + cos(q4)*cos(q5)*(l5 + l3*sin(q3))) + sin(q4)*sin(q6)*(l5 + l3*sin(q3)), l6*(cos(q4)*cos(q6) + cos(q5)*sin(q4)*sin(q6)) + cos(q6)*(l4*sin(q5) + l5*cos(q4)*cos(q5)) + l5*sin(q4)*sin(q6), l6*sin(q5)*sin(q6), l6*cos(q6), 0]
[                                                                                                                                                                                                                                                                                                                                                                                                              cos(q5)*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + cos(q4)*sin(q5)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)),                                                                                                                                              sin(q4)*sin(q5),                                                                                                 sin(q4)*sin(q5),            cos(q5),          0, 1]
[                                                                                                                                                                                                                                                                                                                                sin(q6)*(sin(q5)*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + cos(q4)*cos(q5)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3))) + cos(q6)*sin(q4)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)),                                                                                                                    cos(q4)*cos(q6) + cos(q5)*sin(q4)*sin(q6),                                                                       cos(q4)*cos(q6) + cos(q5)*sin(q4)*sin(q6),    sin(q5)*sin(q6),    cos(q6), 0]
[                                                                                                                                                                                                                                                                                                                                cos(q6)*(sin(q5)*(cos(q3)*cos(q2 + pi/2) + sin(q3)*sin(q2 + pi/2)) + cos(q4)*cos(q5)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3))) + sin(q4)*sin(q6)*(cos(q3)*sin(q2 + pi/2) + cos(q2 + pi/2)*sin(q3)),                                                                                                                    cos(q4)*sin(q6) + cos(q5)*cos(q6)*sin(q4),                                                                       cos(q4)*sin(q6) + cos(q5)*cos(q6)*sin(q4),    cos(q6)*sin(q5),    sin(q6), 0]

```

## Determinante

```sh
DET=

l3*cos(2*q4)*cos(2*q5)*cos(2*q6)^2*sin(q5)*(l2*l5*cos(q3) - l4^2*cos(q2) - l2*l4*sin(q3) + l4*l5*sin(q2) + l4^2*cos(q2)*cos(q3)^2 + l5^2*cos(q2)*cos(q3)^2 + l3*l4*sin(q2)*sin(q3) - 2*l4*l5*cos(q3)^2*sin(q2) + l4^2*cos(q3)*sin(q2)*sin(q3) - l5^2*cos(q3)*sin(q2)*sin(q3) - l3*l5*cos(q3)*sin(q2))
```

## Trayectoria

#### Para abordar el problema de la trayectoria, se plantearon 3 perfiles quínticos empleando líneas rectas cuyos puntos de inicio y fin se tomaron de una simulación elaborada con ayuda del software RoboDK.

 <img src="/Images/simu_roboDK.png">
 
 #### A continuación se muestran el trazo del robot su determinante y las respectivas gráficas en los espacios articulares y cartesianos.
 
 ### *Tramo 1*
 
 <img src="https://media.giphy.com/media/iOgEQ1rbIF74oCvsq5/giphy.gif" width="560" height="420">

#### Determinante

  <img src="/Images/Det_tramo1.jpg">

#### Espacio articular

  <img src="/Images/espacio_articular_t1.png">
  
  #### Espacio cartesiano
  <img src="/Images/espacio_cartesiano_t1.png">
 
### *Tramo 2*
 <img src="https://media.giphy.com/media/Qm0WXDODcJbrVZdVhL/giphy.gif" width="560" height="420">
 
 #### Determinante
  <img src="/Images/Det_tramo2.jpg">

#### Espacio articular

  <img src="/Images/espacio_articular_t2.png">
  
  #### Espacio cartesiano
  <img src="/Images/espacio_cartesiano_t2.png">
  
### *Tramo 3*
 <img src="https://media.giphy.com/media/A5lkOuOuDN4bQ3Mz7a/giphy.gif" width="560" height="420">
 
 #### Determinante
  <img src="/Images/Det_tramo3.jpg">

#### Espacio articular

  <img src="/Images/espacio_articular_t3.png">
  
  #### Espacio cartesiano
  <img src="/Images/espacio_cartesiano_t3.png">

## Rango de movimiento para las articulaciones

#### El rango de movimiento de articulaciones indicado por el fabricante (FANUC), se observa que el rango de movimimiento de las articulaciones es en términos generales amplio. Para el caso de la trayectoria propuesta para cumplir con la tarea de clasifcar tapas de plástico, se observa que ninguno de los tramos viola este rango que se muestra en la imagen inferior.

  <img src="/Images/rango_articulaciones.png">
