% Topico8Exemplo1.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo análise do espectro
%   
% Dicas: Evite acentuacoes em scripts

%% Parte 1 - Projeto Filtro - Passa-Faixa (bandpass)

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
y2 = fft(b);
N2 = length(y2)-1;

half = 1:ceil(length(y)/2);
half2 = 1:ceil(length(y2)/2);
plot(half*Fs/N, abs(y(half)),'b'); hold on;
plot(half2*Fs/N2, abs(y2(half2)),'r');
legend('fft(conv(x,b))','fft(b)');
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
y2 = fft(b);
N2 = length(y2)-1;

half = 1:ceil(length(y)/2);
half2 = 1:ceil(length(y2)/2);
plot(half*Fs/N, abs(y(half)),'b'); hold on;
plot(half2*Fs/N2, abs(y2(half2)),'r');
legend('fft(conv(x,b))','fft(b)');
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
y2 = fft(b);
N2 = length(y2)-1;

half = 1:ceil(length(y)/2);
half2 = 1:ceil(length(y2)/2);
plot(half*Fs/N, abs(y(half)),'b'); hold on;
plot(half2*Fs/N2, abs(y2(half2)),'r');
legend('fft(conv(x,b))','fft(b)');

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
y2 = fft(b);
N2 = length(y2)-1;


half = 1:ceil(length(y)/2);
half2 = 1:ceil(length(y2)/2);
plot(half*Fs/N, abs(y(half)),'b'); hold on;
plot(half2*Fs/N2, abs(y2(half2)),'r');
legend('fft(conv(x,b))','fft(b)');
title('Resposta de magnitude em frequencia');