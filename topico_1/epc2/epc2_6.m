clc;
clear;
Fs = 500;
Ts =1/Fs;
N=50;
n = 0:N-1;

x = 3*cos(2*pi*300*n*Ts + pi/3) + 8*cos(2*pi*800*n*Ts - pi/5);


y = 3*cos(2*pi*200*n*Ts - (2*pi*n + pi/3)) + 8*cos(2*pi*300*n*Ts + 2*n*pi  - pi/5);
%observa-se que na primeira componente do sinal, nao conseguimos distinguir de uma
%cossenoide de 200hz e na segunda de 300hz. Tem-se sobreposição espectral em
%cada componente do sinal

subplot (2, 1, 1)
plot (x);
xlabel ("n");
ylabel ("x");
subplot (2, 1, 2)
plot (y);
xlabel ("n");
ylabel ("y");
