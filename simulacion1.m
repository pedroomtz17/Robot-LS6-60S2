%Simulación 1

%clc; clear all; close all;
for i=0:10:360
    clf
    robot(deg2rad(i),0,0,0)
    pause(0.001)
end

for i=0:10:360
    clf
    robot(0,deg2rad(i),0,0)
    pause(0.001)
end

for i=0:10:360
    clf
    robot(0,0,cos(deg2rad(i))*0.1,0)
    pause(0.001)
end

for i=0:10:360
    clf
    robot(0,0,0,deg2rad(i))
    pause(0.001)
end