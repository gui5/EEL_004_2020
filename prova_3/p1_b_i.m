
clear
clc
close all

pkg load communications;
pkg load signal;

MAXLEN = 100;
fs = 50;
Ts = 1/fs;
f = 5; % hz

t = 0:1/fs:2-1/fs; 
N = length(t);
n = 0:N-1;

% sinal discretizado com f de 10Hz
x_d = sin(2*pi*f*n*Ts);

% incluindo ruido no sinal com S/R = 5
x_noise = awgn(x_d,15);


idx_fig = 1;
figure(idx_fig);
plot(n,x_d,'b',n,x_noise,'r');
legend('Sinal', 'Sinal com ruido');

taps = 28+7; % qtd de coeficientes do filtro idade =28 mes nascimento = 7 
imp = unit_impulse(MAXLEN);

fc = 12.5; % empiricamente. Ja tive contado com sistemas de aquisicao embarcados
           % que a frequencia de corte do filtro consistia em 1/4 da frequencia de amostragem do sinal
   
wc = fc/(0.5*fs);

idx_fig = idx_fig + 1;

%projeto do filtro FIR utilizando a funcao fir
b_fir1 = fir1(taps,wc,'low');
x_fir1 = conv(b_fir1,x_noise);
b_fft_fir1 = fft(conv(b_fir1,imp)); %Resposta em frequencia do filtro

% Graficos
figure(idx_fig);
plot(n,x_noise,'b');hold on
plot(n,x_fir1(1:length(n)),'r');
legend('Sinal c/ ruido','Sinal Filtrado');

%Espectro
idx_fig = idx_fig + 1;
figure(idx_fig);
subplot(2,1,1)
plot(n*fs/N,abs(fft(x_d)),'b');
legend('Espectro - Sinal');
subplot(2,1,2);
plot(n*fs/N,abs(fft(x_noise)),'b');hold on
plot(n*fs/N,abs(fft(x_fir1(1:length(n)))),'r');
legend('Espectro - sinal c/ ruido','Espectro - sinal filtrado');

%Resposta na frequencia
idx_fig = idx_fig + 1;
figure(idx_fig);
subplot(2,1,1);
plot(1:length(b_fir1), b_fir1, 'b');title('Coeficientes do filtro');
legend('FIR1');

subplot(2,1,2);
half = 1:ceil(length(b_fft_fir1)/2);
plot((half/max(half))*(0.5*fs), abs(b_fft_fir1(half)),'b')
title('Resposta de magnitude em frequencia');
legend('FIR');



