
clc;
clear;

Ts = 0.008;

N = 50;

n = 0:N-1;

x = sin(2*pi*120*n*Ts);

plot(x)

% tem-se um sinal defasado em 90º