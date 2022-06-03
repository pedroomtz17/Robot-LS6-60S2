# Robot-LS6-60S2

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
<img src="/Images/Coordenada_PosicionInicial.jpg" width="540" height="400">

- Posición 2
```sh
        xe=0; ye=0.5; ze=-0.154; gamma=pi;
 ```
<img src="/Images/Coordenada_PosicionIntermedia.jpg" width="540" height="400">

- Posición 3
```sh
        xe=-0.5547; ye=-0.104; ze=0; gamma=-pi;
 ```
<img src="/Images/Coordenada_PosiciFinal.jpg" width="540" height="400">

- Posición 4
```sh
        xe=-0.5547; ye=-0.104; ze=-0.1464; gamma=-pi;
 ```
<img src="/Images/Coordenada_PosiciFinal.jpg" width="540" height="400">
