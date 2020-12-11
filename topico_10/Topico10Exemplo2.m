% Topico10Exemplo2.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
%
%   Analise tempo-frequencia
%   
% Based on:
%       COURSE: Signal processing and image processing in MATLAB and Python
%       SECTION: Aliasing, stationarity, and violations
%       VIDEO: Solutions for non-stationary time series
%       Instructor: mikexcohen.com
%
% Dicas: Evite acentuacoes em scripts
clear
clc
close all


%% create signal (chirp) used in the following examples

% simulation details and create chirp
fs     = 1000; % sampling rate
time   = 0:1/fs:5;
npnts  = length(time);
f      = [10 30]; % frequencies in Hz
ff     = linspace(f(1),mean(f),npnts);
signal = sin(2*pi.*ff.*time);



figure, clf

% plot signal
subplot(211)
plot(time,signal,'k','linew',2)
xlabel('Time (s)'), ylabel('Amplitude')
title('Time domain signal')

% compute power spectrum
sigpow = 2*abs(fft(signal)/npnts).^2;
hz     = linspace(0,fs/2,floor(npnts/2)+1);

% and plot
subplot(212)
plot(hz,sigpow(1:length(hz)),'k','linew',2)
xlabel('Frequency (Hz)'), ylabel('Power')
set(gca,'xlim',[0 80])

%% short-time/term FFT

winlen   = 500; % window length (+/- 10% do tamanho do sinal, escolha empirica)
stepsize = 25;  % step size for STFFT 
numsteps = floor( (npnts-winlen)/stepsize );

hz = linspace(0,fs/2,floor(winlen/2)+1);


% initialize time-frequency matrix
tf = zeros(length(hz),numsteps);

% Hann taper
hwin = .5*(1-cos(2*pi*(1:winlen) / (winlen-1)));

% loop over time windows
for ti=1:numsteps
    
    % extract part of the signal
    tidx    = (ti-1)*stepsize+1:(ti-1)*stepsize+winlen;
    tapdata = signal(tidx);
    
    % FFT of these data
    x = fft(hwin.*tapdata)/winlen;
    
    % and put in matrix
    tf(:,ti) = 2*abs(x(1:length(hz)));
end

figure, clf
contourf(time( (0:numsteps-1)*stepsize+1 ),hz,tf,40,'linecolor','none')
set(gca,'ylim',[0 50],'xlim',[0 5],'clim',[0 .5])
xlabel('Time (s)'), ylabel('Frequency (Hz)')
title('Time-frequency power via short-time FFT')
colorbar