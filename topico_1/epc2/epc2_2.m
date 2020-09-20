clear;
clc;

F = 10000;
Ts = 1/F;
N = ((4*(1/600))/Ts)-1;

n = 0:N-1;

x = 10*sin(2*pi*600*n*Ts + pi/3);
y = 2*cos(2*pi*1200*n*Ts +pi/4);


xy = x+y;

plot(xy);