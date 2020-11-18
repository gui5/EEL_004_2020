% Topico7Exemplo1.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Projeto de Filtros FIR com Janelamento - Parte 1 (fundamentos)
%
% Dicas: Evite acentuacoes em scripts

clear
clc
close all

MAXLEN = 1000;

imp = zeros(1,MAXLEN);
imp(MAXLEN/10) = 1;

%% coeficientes [1, 1, 1, 1, 1] - janela unitaria
figure(1);
myfilt = [1, 1, 1, 1, 1];
y = conv(imp, myfilt); % filtrar o impulso com os coeficientes myfilt
Y = fft(y);
maxY = max(Y);
half = 1:ceil(length(y)/2);
subplot(3,1,1);
plot(half,abs(Y(half))/maxY,'b');
title('FMR para coeficientes de filtro [1, 1, 1, 1, 1]');
axis tight;

%% Coeficiente [1/3, 2/3, 1, 2/3, 1/3]
myfilt = [1/3, 2/3, 1, 2/3, 1/3]; % ou myfilt = window(@triang,5)
y = conv(imp, myfilt); % filtrar o impulso com os coeficientes myfilt
Y = fft(y);
maxY = max(Y);
half = 1:ceil(length(y)/2);
subplot(3,1,2);
plot(half,abs(Y(half))/maxY,'b');
title('FMR para coeficientes de filtro [1/3, 2/3, 1, 2/3, 1/3]');
axis tight;

%% Coeficiente , janela de hamming
myfilt = [0.08 0.54 1 0.54 0.08];
y = conv(imp, myfilt); % filtrar o impulso com os coeficientes myfilt
Y = fft(y);
maxY = max(Y);
half = 1:ceil(length(y)/2);
subplot(3,1,3);
plot(half,abs(Y(half))/maxY,'b');
title('FMR para coeficientes de filtro com janela de Hamming');
axis tight;