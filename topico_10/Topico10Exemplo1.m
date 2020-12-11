% Topico10Exemplo1.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
%
%   Sinais Estacionarios e Nao-estacionarios
%   
% Based on:
%       COURSE: Signal processing and image processing in MATLAB and Python
%       SECTION: Aliasing, stationarity, and violations
%       VIDEO: Effects of non-stationarities on power spectra
%       Instructor: mikexcohen.com
%
% Dicas: Evite acentuacoes em scripts

%% amplitude non-stationarity

srate = 1000;
t = 0:1/srate:10;
n = length(t);
f = 3; % frequency in Hz

% sine wave with time-increasing amplitude
ampl1 = linspace(1,10,n);
% uncomment this line for an AM-radio-like signal
% ampl1 = abs(interp1(linspace(t(1),t(end),10),10*rand(1,10),t,'spline'));
ampl2 = mean(ampl1);

signal1 = ampl1 .* sin(2*pi*f*t);
signal2 = ampl2 .* sin(2*pi*f*t);


% obtain Fourier coefficients and Hz vector
signal1X = fft(signal1)/n;
signal2X = fft(signal2)/n;
hz = linspace(0,srate/2,floor(n/2)+1);

figure(1), clf
subplot(211)
plot(t,signal2,'r','linew',2), hold on
plot(t,signal1,'b','linew',2)
xlabel('Time (sec.)'), ylabel('Amplitude')
title('Time domain signal')

subplot(212)
stem(hz,2*abs(signal2X(1:length(hz))),'ro-','linew',2,'markerface','r')
hold on
stem(hz,2*abs(signal1X(1:length(hz))),'bs-','linew',2,'markerface','k')

title('Frequency domain')
xlabel('Frequency (Hz)'), ylabel('Amplitude')
set(gca,'xlim',[1 7])
legend({'Stationary';'Non-stationary'})

%% frequency non-stationarity

% create signals (sine wave and linear chirp)
f  = [2 10];
ff = linspace(f(1),mean(f),n);
signal1 = sin(2*pi.*ff.*t);
signal2 = sin(2*pi.*mean(ff).*t);

% Fourier spectra
signal1X = fft(signal1)/n;
signal2X = fft(signal2)/n;
hz = linspace(0,srate/2,floor(n/2));

figure(4), clf

% plot the signals in the time domain
subplot(211)
plot(t,signal1,'b'), hold on
plot(t,signal2,'r')
xlabel('Time (sec.)'), ylabel('Amplitude')
set(gca,'ylim',[-1.1 1.1])

% and their amplitude spectra
subplot(212)
stem(hz,2*abs(signal1X(1:length(hz))),'.-','linew',2), hold on
stem(hz,2*abs(signal2X(1:length(hz))),'r.-','linew',2)
xlabel('Frequency (Hz)'), ylabel('Amplitude')
set(gca,'xlim',[0 20])
