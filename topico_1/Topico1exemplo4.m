% Topico1Exemplo4.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Amostragem
%
% Dicas: Evite acentuacoes em scripts

% Baseado em exemplo 5.4.1 (Michael Weeks 2ed, pag 153 e 154) Aliasing 
%   senoides:
%       a cos (2pi(-400)t + \theta)
%       a cos (2pi(-400+k*F_s)t + \theta)

clear
clc
close all

num_win_f0 = 3; % numero de janelas de f0
freq = 400;     % frequencia de exemplo
phase = 0;      % pi/4;   % fase de exemplo, COMO ERA COSSENO ADIANTOU 45º
mag = 2;        % magnitude de exemplo
fs = 1000;       % frequencia de amostragem
Ts = 1/fs;      % periodo de amostragem
k = 1;          % numero de repeticoes de componentes senoidais

N = 200; % pontos para aparencia suave dp sinal (emulando analogico)
num_samples = round(num_win_f0/(freq*Ts))+1; % numero de amostras para simular a leitura amostrada

step = num_win_f0/(freq*N); % incremento apropriado
t = 0:step:num_win_f0*(1/freq);      % tempo
n = 0:num_samples-1;          % indice da amostra

% funcoes analogicas simuladas
x = mag*cos(2*pi*(-freq)*t + phase);
y = mag*cos(2*pi*(-freq+k*fs)*t + phase); % -400 + 1*1000Hz = 600 Hz

% sinais amostrados das funcoes analogicas simuladas, ou simplismente
% digitais simulados
x_d(n+1) = mag*cos(2*pi*(-freq)*(n*Ts) + phase);
y_d(n+1) = mag*cos(2*pi*(-freq+k*fs)*(n*Ts) + phase); 

%% plotar graficos

% sinais analogicos simulados
subplot(2,1,1);
plot(t,x,'r.-',t,y,'b-');
title('Sinais analogicos simulados, x=pontos e y=solido');
xlabel('tempo(s)');
ylabel('amplitude');
legend('x : comp. de -400Hz',sprintf('y : comp. de %d Hz',(-freq+k*fs)));

% sinais amostrados, digitais simulados
subplot(2,1,2);
plot(n,x_d,'rx',n,y_d,'bo');
title('Sinais digitais simulados, x=x e y=o');
xlabel('amostras');
ylabel('amplitude');
legend('x=x : comp. de -400Hz',sprintf('y=o : comp. de %d Hz', (-freq+k*fs)));