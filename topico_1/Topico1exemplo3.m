% Topico1Exemplo3.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Amostragem
%
% Dicas: Evite acentuacoes em scripts

% Exemplo 5.4.1 (Michael Weeks 2ed, pag 153 e 154) Aliasing 
%   senoides:
%       2 cos (2pi100t + pi/3)
%       2 cos (2pi600t + pi/3)
%   se for amostrado com 600 amostras/segundo, então 
%   as versões amostradas são identicas

clear
clc
close all

freq = 100;     % frequencia de exemplo
phase = 0; % pi/4;   % fase de exemplo, COMO ERA COSSENO ADIANTOU 45º
mag = 2;        % magnitude de exemplo
fs = 600;       % frequencia de amostragem
Ts = 1/fs;      % periodo de amostragem
k = 1;          % numero de repeticoes de componentes senoidais

N = 200; % pontos para aparencia suave dp sinal (emulando analogico)
num_samples = round(2/(freq*Ts))+1; % numero de amostras para simular a leitura amostrada

step = 2/(freq*N); % incremento apropriado
t = 0:step:2*(1/freq);      % tempo
n = 0:num_samples-1;          % indice da amostra

% funcoes analogicas simuladas
x = mag*cos(2*pi*freq*t + phase);
y = mag*cos(2*pi*(freq+k*fs)*t + phase); % 100Hz + 1*500Hz = 600 Hz

% sinais amostrados das funcoes analogicas simuladas, ou simplismente
% digitais simulados
x_d(n+1) = mag*cos(2*pi*freq*(n*Ts) + phase);
y_d(n+1) = mag*cos(2*pi*(freq+k*fs)*(n*Ts) + phase); % 100Hz + 1*500Hz = 600 Hz

%% plotar graficos

% sinais analogicos simulados
subplot(2,1,1);
plot(t,x,'r.-',t,y,'b-');
title('Sinais analogicos simulados, x=pontos e y=solido');
xlabel('tempo(s)');
ylabel('amplitude');
legend('x : sinal de 100Hz','y : componente senoidal 600Hz');

% sinais amostrados, digitais simulados
subplot(2,1,2);
plot(n,x_d,'rx',n,y_d,'bo');
title('Sinais digitais simulados, x=x e y=o');
xlabel('amostras');
ylabel('amplitude');
legend('x=x : sinal de 100Hz','y=o : componente senoidal 600Hz');