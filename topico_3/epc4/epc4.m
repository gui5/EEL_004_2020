clc;
clear;

Fs =44100;
n = 0:((Fs*3))-1;

M = getMusic(Fs,n);

%---------1-------------

a = fft(M);


