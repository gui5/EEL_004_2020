%3)
%a)
%	Fs = 10000
%	Ts = 1/Fs
%	Amostras em 16ms = FS * 16.10^-3 = 160 amostras
%b)
%	x[n] =  3cos(2*pi*500*n*Ts -pi/5) + 6cos(2*pi*700*n*Ts + pi/5) + 4cos(2*pi*600*n*Ts + 2pi/7)
%c)
%	x[0] = primeira amostra do sinal onde Ts =0;
%	x[1] = segunda amostra do sinal onde Ts = 1/Fs no caso 0.1ms
	
%d)
%	x[0]=9.7751   x[1]=6.9113
%	No matlab/octave o inicio de um array =1;

clear;
clc;

Fs=10000;
Ts = 1/Fs;

N =2;
n = 0:N-1;

x = 3*cos(2*pi*500*n*Ts -pi/5) + \
        6*cos(2*pi*700*n*Ts + pi/5) + \
        4*cos(2*pi*600*n*Ts + 2*pi/7)
        
