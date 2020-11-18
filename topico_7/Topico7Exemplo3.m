% Topico6Exemplo2.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Resposta em Frequência de Filtros Digitais
%
% Dicas: Evite acentuacoes em scripts

clear
clc
close all

idx = 1;

%% Load data
load data_test.mat

N = length(ACC_DATA_WALKING);
Fs = 50;

t = linspace(0,N/Fs-1/Fs,N)';

figure(idx);
plot(t,ACC_DATA_WALKING(:,1)); hold on

%% Passa baixa

fc = 10; % frequencia de corte do filtro
wc = fc/(0.5*Fs); % wc deve estar entre 0 e 1, sendo 1 equivalente a frequencia de nyquist (0.5*fs)

b = fir1(51,wc,'low');

data_f = conv(ACC_DATA_WALKING(:,1),b); 
%data_f = filter(b,1,ACC_DATA_WALKING(:,1)); % considerar -1 na dimensão de
%   saida

% ajuste de alinhamento (SOMENTE OFFLINE)
diff_size = floor((length(data_f) - length(ACC_DATA_WALKING))/2);
data_f = data_f(diff_size+1:end-diff_size-1);

plot(t,data_f);

idx = idx + 1;
figure(idx);

y = fft(data_f); 
half = 1:ceil(length(y)/2);
plot(half*Fs/N, abs(y(half)),'b')
title('Resposta de magnitude em frequencia');



%% Passa alta
idx = idx + 1;
figure(idx);

fc = 5; % frequencia de corte do filtro
wc = fc/(0.5*Fs); % wc deve estar entre 0 e 1, sendo 1 equivalente a frequencia de nyquist (0.5*fs)

b = fir1(51,wc,'high');

data_f = conv(ACC_DATA_WALKING(:,1),b); 
%data_f = filter(b,1,ACC_DATA_WALKING(:,1)); % considerar -1 na dimensão de
%   saida

% ajuste de alinhamento (SOMENTE OFFLINE)
diff_size = floor((length(data_f) - length(ACC_DATA_WALKING))/2);
data_f = data_f(diff_size+1:end-diff_size);

plot(t,data_f);

idx = idx + 1;
figure(idx);

y = fft(data_f); 
half = 1:ceil(length(y)/2);
plot(half*Fs/N, abs(y(half)),'b')
title('Resposta de magnitude em frequencia');

%% Passa faixa
