% Topico4Exemplo2.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Zero Padding
%
% Dicas: Evite acentuacoes em scripts


clear
close all
clc

%% Parte 1 : Exemplo 

% Duas funcoes senoidais com frequencias de 100 e 202.5 Hz, amostrados a
% 1000 Hz e com 1000 amostras

N = 1000;

Fs = 1000;
Ts = 1/Fs;
n = 0:N-1;

x = cos(2*pi*100*n*Ts)+sin(2*pi*202.5*n*Ts);

% Como estamos amostrando a 1000 Hz e possuimos 1000 amostras, a frequencia
% de analise (fa = m*Fs/N) tera resolucao de 1 Hz, o que determinara bem a
% freq de 100Hz mas sera imprecisa para para freq de 202.5Hz

xdft = fft(x)/N;
xdft = xdft(1:length(x)/2+1);
%   Considera a escala de amplitude da saida da DFT
%   xdft = xdft/length(x);
%   xdft(2:end-1) = 2*xdft(2:end-1);
freq = 0:Fs/length(x):Fs/2;

subplot(3,1,1);
stem(freq,2*abs(xdft))
xlabel('Hz')
ylabel('Amplitude')
title('Sinais 100 e 202.5Hz amostrados a 1000Hz com 1000 amostras');
hold off

%% Parte 2: Zero Padding (manual)

% Para melhorar a visualizacao amostral, podemos fazer o uso da estrategia
% de zero padding, que consistem em adicionar amostras nulas no sinal.

ZeroPad = 2; % multiplier
zpad = zeros(1,(ZeroPad-1)*N);
x_zpad = [x, zpad];

xdft = fft(x_zpad)/N; % seria o mesmo que fft(x,ZeroPad*length(n))
xdft = xdft(1:floor(length(x_zpad)/2));
%   Considera a escala de amplitude da saida da DFT
%   xdft = xdft/length(x);
%   xdft(2:end-1) = 2*xdft(2:end-1);
freq = 0:Fs/length(x_zpad):Fs/2-Fs/length(x_zpad);

subplot(3,1,2);
plot(freq,2*abs(xdft))
xlabel('Hz')
ylabel('Amplitude')
title('Zero Padding Manual');
hold off

%% Parte 3: Zero Padding (com fft)

ZeroPad = 2; % multiplier

nZpad = ZeroPad*N;
    
% FFT
xdft = fft(x,nZpad)/N; % tamanho de amostras antes do Zero Padding 
xdft = xdft(1:floor(nZpad/2));

freq = 0:Fs/nZpad:Fs/2-Fs/nZpad;
subplot(3,1,3);
plot(freq,2*abs(xdft))
xlabel('Hz')
ylabel('Amplitude')
title('Zero Padding Auto');
hold off

%% Parte 4 : Aumentando a resolucao (Fs e Amostras)

% No entanto, ZeroPadding nao aumenta a resolu??o espectral, o efeito e
% apenas de aparencia visual para analise. 

% Para aumentar a resolucao, somente aumentando a Fs e a quantidade de
% amostras

clear;
N = 2000;
Fs = 1000;
Ts = 1/Fs;
n = 0:N-1;

x = cos(2*pi*100*n*Ts)+sin(2*pi*202.5*n*Ts);

xdft = fft(x)/(N);
xdft = xdft(1:length(x)/2+1);
%   Considera a escala de amplitude da saida da DFT
%   xdft = xdft/length(x);
%   xdft(2:end-1) = 2*xdft(2:end-1);
freq = 0:Fs/length(x):Fs/2;

%subplot(3,1,3);
figure;
plot(freq,2*abs(xdft))
xlabel('Hz')
ylabel('Amplitude')
title('Sinais 100 e 202.5Hz amostrados a 1000Hz com 2000 amostras');
hold off

%% Parte 5: Zero Padding (com ifft)

% Duas funcoes senoidais com frequencias de 100 e 200Hz, amostrados a
% 1000 Hz e com 1000 amostras

N = 100;

Fs = 1000;
Ts = 1/Fs;
n = 0:N-1;

x = cos(2*pi*100*n*Ts)+sin(2*pi*200*n*Ts);
% Como estamos amostrando a 1000 Hz e possuimos 1000 amostras, a frequencia
% de analise (fa = m*Fs/N) tera resolucao de 1 Hz, o que determinara bem a
% freq de 100Hz mas sera imprecisa para para freq de 202.5Hz

xdft_raw = fft(x);
xdft = xdft_raw(1:length(x)/2+1)/N;
%   Considera a escala de amplitude da saida da DFT
%   xdft = xdft/length(x);
%   xdft(2:end-1) = 2*xdft(2:end-1);
freq = 0:Fs/length(x):Fs/2;

x_ = ifft(xdft_raw);
tempo = linspace(0,(N-1)*Ts,N);

%%%%%%%%%%%%%%%%%%%%%
ZeroPad = 2; % multiplier
x_zp = ifft(xdft_raw,N*ZeroPad);
tempo_zp = linspace(0,(N-1)*Ts,N*ZeroPad);

xdft_zp = fft(x_zp);
xdft_zp = xdft_zp(1:length(x)/2+1)/length(x);
freq_zp = 0:Fs/length(x):Fs/2;
%%%%%%%%%%%%%%%%%%%%%%

figure;
subplot(3,1,1);
stem(freq,2*abs(xdft))
xlabel('Hz')
ylabel('Amplitude')
title('Sinais 100 e 200Hz');
hold off

subplot(3,1,2);
plot(tempo,x);hold on;
plot(tempo,x_);
plot(tempo_zp,x_zp,'g');
xlabel('t(s)')
ylabel('Amplitude')
title('Sinal reconstruido vs Original');
hold off

subplot(3,1,3);
stem(freq_zp,2*abs(xdft_zp))
xlabel('Hz')
ylabel('Amplitude')
title('Sinais 100 e 200Hz');
hold off