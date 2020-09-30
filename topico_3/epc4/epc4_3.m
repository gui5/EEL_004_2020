clc;
clear;

% a maior frequencia utilizada no sinal é a nota B aprox. 500hz portanto uma
% amostragem de 1000hz é suficiente e como o sinal se repete 1,5s eh 
% suficiente para amostrar todas as frequencias.

Fs = 1000;
n = 0:((Fs*1.5))-1;

M = getMusic(Fs,n);

plot_fft(M,Fs,length(M))

