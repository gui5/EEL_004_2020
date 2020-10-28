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

N = 1000;
Fs = 100;

%% Passa baixa
figure(1);

fc = 10; % frequencia de corte do filtro
wc = fc/(0.5*Fs); % wc deve estar entre 0 e 1, sendo 1 equivalente a frequencia de nyquist (0.5*fs)

b = fir1(100,wc,'low');

x = zeros(1,N);
x(50) = 1;
%y = fft(conv(b,x)); 
y = fft(conv(x,b)); 

half = 1:ceil(length(y)/2);
plot(half*Fs/N, abs(y(half)),'b')
title('Resposta de magnitude em frequencia');

%% Passa alta
figure(2);

fc = 10; % frequencia de corte do filtro
wc = fc/(0.5*Fs); % wc deve estar entre 0 e 1, sendo 1 equivalente a frequencia de nyquist (0.5*fs)

b = fir1(100,wc,'high');
x = zeros(1,N);
x(50) = 1;
%y = fft(conv(b,x)); 
y = fft(conv(x,b)); 

half = 1:ceil(length(y)/2);
plot(half*Fs/N, abs(y(half)),'b')
title('Resposta de magnitude em frequencia');

%% Passa faixa
figure(3);

fc1 = 5;  % frequencia de corte do filtro
fc2 = 15; % frequencia de corte do filtro
wc1 = fc1/(0.5*Fs); % wc deve estar entre 0 e 1, sendo 1 equivalente a frequencia de nyquist (0.5*fs)
wc2 = fc2/(0.5*Fs); % wc deve estar entre 0 e 1, sendo 1 equivalente a frequencia de nyquist (0.5*fs)

b = fir1(100,[wc1 wc2],'bandpass');
x = zeros(1,1000);
x(50) = 1;
%y = fft(conv(b,x)); 
y = fft(conv(x,b)); 

half = 1:ceil(length(y)/2);
plot(half*Fs/N, abs(y(half)),'b')
title('Resposta de magnitude em frequencia');

%% Rejeita faixa
figure(4);

fc1 = 5;  % frequencia de corte do filtro
fc2 = 15; % frequencia de corte do filtro
wc1 = fc1/(0.5*Fs); % wc deve estar entre 0 e 1, sendo 1 equivalente a frequencia de nyquist (0.5*fs)
wc2 = fc2/(0.5*Fs); % wc deve estar entre 0 e 1, sendo 1 equivalente a frequencia de nyquist (0.5*fs)

b = fir1(100,[wc1 wc2],'stop');
x = zeros(1,1000);
x(50) = 1;
%y = fft(conv(b,x)); 
y = fft(conv(x,b)); 

half = 1:ceil(length(y)/2);
plot(half*Fs/N, abs(y(half)),'b')
title('Resposta de magnitude em frequencia');