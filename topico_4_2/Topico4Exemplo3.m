% Topico4Exemplo3.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Deslocamento para DFT
%
% Dicas: Evite acentuacoes em scripts

close all;
clear;
clc

%% Parte1

% parametros que podem ser mudados para teste
number_of_samples = 16;     % numero de amostras
shift = 3 + 1;                  % tamanho do desclocamento, deve ser menor q o numero de amostras
fs = 2000;                  % frequencia de amostragem

% sinal de exemplo
Ts = 1/fs;
range = 1:number_of_samples;
x(range) = 2*cos(2*pi*400*(range-1)*Ts) + cos(2*pi*700*(range-1)*Ts);

% versao deslocada do sinal de exemplo
y = [x(shift:number_of_samples),x(1:shift-1)];

% FFT
X = fft(x);
Y = fft(y);

% Encontrar magnitudes
Xmag = abs(X);
Ymag = abs(Y);

% Encontrar fases
Xphase = angle(X);
Yphase = angle(Y);

m = 0:length(X)-1;
fan = m*fs/number_of_samples;

% plotar graficos
subplot(3,1,1);
plot(range,x,'bd',range,y,'g*');
title('Sinal exemplo(losango azul) e sinal deslocado (* verde)');

subplot(3,1,2);
plot(fan,Xmag,'bd',fan,Ymag,'g*');
title('Mag do Sinal exemplo(losango azul) e Mag do sinal deslocado (* verde)');

subplot(3,1,3);
plot(fan,Xphase,'bd',fan,Yphase,'g*');
title('Phase do Sinal exemplo(losango azul) e Phase do sinal deslocado (* verde)');