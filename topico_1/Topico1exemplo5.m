% Topico1Exemplo5.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Amostragem
%
% Dicas: Evite acentuacoes em scripts

clear
clc
%close all

num_repeticoes = 5;

freq = 100;     % frequencia de exemplo
phase = pi/2; % pi/4;   % fase de exemplo, COMO ERA COSSENO ADIANTOU 45º
mag = 2;        % magnitude de exemplo
fs = 10*200;       % frequencia de amostragem
Ts = 1/fs;      % periodo de amostragem

N = 200; % pontos para aparencia suave dp sinal (emulando analogico)
num_samples = round(num_repeticoes/(freq*Ts))+1; % numero de amostras para simular a leitura amostrada

step = 2/(freq*N); % incremento apropriado
t = 0:step:num_repeticoes*(1/freq);      % tempo
n = 0:num_samples-1;          % indice da amostra

% funcoes analogicas simuladas
x = mag*cos(2*pi*freq*t + phase);

% sinais amostrados das funcoes analogicas simuladas, ou simplismente
% digitais simulados
x_d(n+1) = mag*cos(2*pi*freq*(n*Ts) + phase);

%% Transformada rápida de fourier (FFT)

% Espectro de potencia - sinal discretizado
axis_hz = linspace(0,fs/2,floor(num_samples/2)+1);
axis_powr = abs(fft(x_d)/num_samples);

%% plotar graficos

% sinais analogicos simulados
subplot(2,2,1);
plot(t,x,'r-');
title('Sinal analogico');
xlabel('tempo(s)');
ylabel('amplitude');
legend(sprintf('x : %d Hz',freq));

% sinais amostrados, digitais simulados
subplot(2,2,3);
plot(n,x_d,'r-');
title('Sinal digital');
xlabel('amostras');
ylabel('amplitude');
%legend(sprintf('x_d : %d Hz',freq));

% fft
subplot(2,2,[2 4]), cla
plot(axis_hz,axis_powr(1:length(axis_hz)))

title('Sinal Digital')
xlabel('Frequencia (Hz)'), ylabel('Amplitude')