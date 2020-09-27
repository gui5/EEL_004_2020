% Topico3Exemplo2.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Componente DC
%
% Dicas: Evite acentuacoes em scripts

clear
clc
close all

idx_fig = 0;

%% PARTE 1
N = 100;
n = 0:N-1;
fs = 200;
Ts = 1/fs;

% sinal de exemplo
x = sin(2*pi*20*n*Ts);
x_dc = 1.5 + sin(2*pi*20*n*Ts);

X = dft(x)/N; % fft(x); 
X_dc = dft(x_dc)/N; % fft(x); 
m = 0:length(X)-1;

fprintf('A resolucao de frequencia eh: %5.2f Hz',fs/length(X));

fan = m*fs/N;

idx_fig = idx_fig + 1;
figure(idx_fig);

%%%%% Sinal SEM componente DC
subplot(2,2,1);
stem(fan,2*abs(X),'b');
xlabel('f(Hz)');
ylabel('magnitude');
title('Resposta de magnitude em frequencia');

subplot(2,2,3);
stem(fan,angle(X),'b');
xlabel('f(Hz)');
ylabel('angulo de fase (rad)');
title('Tracado de angulo de fase');

%%%%% Sinal COM componente DC
subplot(2,2,2);
stem(fan,2*abs(X_dc),'b');
ylabel('angulo de fase (rad)');
xlabel('f(Hz)');
title('Resposta de magnitude em frequencia');

subplot(2,2,4);
stem(fan,angle(X_dc),'b');
ylabel('angulo de fase (rad)');
xlabel('f(Hz)');
title('Tracado de angulo de fase');

%% PARTE 2 : Correção para amplitude da componente DC
subplot(2,2,2);
Amplitude_corrigida_dc = abs(X_dc);
Amplitude_corrigida_dc(2:end) = 2*Amplitude_corrigida_dc(2:end);

stem(fan,Amplitude_corrigida_dc,'b');
ylabel('angulo de fase (rad)');
xlabel('f(Hz)');
title('Resposta de magnitude em frequencia');
