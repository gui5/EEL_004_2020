% Topico4Exemplo1.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Resolução de Frequencia
%
% Dicas: Evite acentuacoes em scripts

clear
clc
close all

idx_fig = 0;
%% PARTE 1
N = 2000;
n = 0:N-1;
fs = 1000;
Ts = 1/fs;

% sinal de exemplo
x =  2.5*cos(2*pi*4*n*Ts) + ...
     1.5*cos(2*pi*6.3*n*Ts);

X =fft(x); 
m = 0:length(X)-1;

fprintf('A resolucao de frequencia eh (Fs/N): %5.2f Hz',...
    fs/length(X));

fan = m*fs/N;

% Objetivo: usar somente a primeira metade da transformada e
% ignorar as fases de valores com magnitude pequena

half_m = 0:ceil(length(X)/2);
fan_half = half_m*fs/length(X);

idx_fig = idx_fig + 1;
figure(idx_fig);
subplot(2,1,1);
stem(fan,abs(X),'b');
stem(fan_half,abs(X(half_m+1)),'b');
xlim([2 9]);
xlabel('f(Hz)');
ylabel('magnitude');
title('Resposta de magnitude em frequencia');




tolerancia = 0.00001;

% lembre-se que os valores de magnitude sao obrigatoriamente positivos,
% veja nas notas de aula.
X_aux1 = ceil(abs(X(half_m+1)) - tolerancia); % converte pra inteiro imediatamente superior
                                   % Ex: 
                                   %    100 - 0.00001 = 99.99999 ==> 100
                                   %    0.6 - 0.00001 =  0.59999 ==> 1 
                                   %    0.000001 - 0.00001 =  -0.000009 ==> 0
                                   
X_aux2 = round(X_aux1 ./ (X_aux1 + 1)); % normaliza os valores, somando um no 
                                     % denominador faz com que os valores 
                                     % fiquem entre 0 e 1     
                  
subplot(2,1,2);
stem(fan_half,angle(X(half_m+1)),'b');
stem(fan_half,angle(X(half_m+1)).*X_aux2, 'b');  
xlim([2 9]);
xlabel('f(Hz)');
ylabel('angulo de fase');
title('Tracado de angulo de fase');
                                   
