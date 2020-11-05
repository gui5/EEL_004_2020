clc;
clear;

filename = 'ECGData.mat';

Fs = 128;
[data] = load (filename);


ecg = data.("ECGData");
N = length(ecg);
n = 1:N;
t = n * 1/Fs;
figure(1);
plot(t,ecg)

X = fft(ecg)/N;

axis_hz = linspace(0,Fs/2,floor(N/2));
axis_powr = abs(X).^2

figure(2);
plot(axis_hz,axis_powr(1:length(axis_hz)));