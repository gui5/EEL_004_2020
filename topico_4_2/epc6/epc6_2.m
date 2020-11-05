clc;
clear;

freq = 27.5;
Fs = 8192;
Ts = 1/Fs;

N = 15000;

n = 1:N;

x = cos(2*pi*freq*n*Ts);
figure(1);
plot(x);

X = fft(x)/N;

axis_hz = linspace(0,Fs/2,floor(N/2));
axis_powr = abs(X);

figure(2);
plot(axis_hz,axis_powr(1:length(axis_hz)));

% zeropad

nZpad = N+1384;
Xz = fft(x,nZpad)/nZpad;
z_axis_hz = linspace(0,Fs/2,floor(N/2));
z_axis_powr = abs(Xz);

figure(3);
plot(z_axis_hz,z_axis_powr(1:length(z_axis_hz)));