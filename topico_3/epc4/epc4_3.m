clc;
clear;

% a maior frequencia utilizada no sinal � a nota B aprox. 500hz portanto uma
% amostragem de 1000hz � suficiente

Fs = 1000;
n = 0:((Fs*1.5))-1;

M = getMusic(Fs,n);

plot_fft(M,Fs,length(M))
