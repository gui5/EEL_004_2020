% Topico7Exemplo1.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Projeto de Filtros FIR com Janelamento - Parte 2 (exemplo completo)
%
% Dicas: Evite acentuacoes em scripts

%% Parte A - Inicio
clear
clc
close all

MAXLEN = 100;
idx_fig = 1;

fs = 100;
Ts = 1/fs;
f = 5; % hz

t = 0:1/fs:2-1/fs; 
N = length(t);
n = 0:N-1;

% sinal discretizado com f de 5Hz
x_d = sin(2*pi*f*n*Ts);

% incluindo ruido no sinal com S/R = 5
x_noise = awgn(x_d,5); % utilizar ">> doc awgn" para mais informações

figure(idx_fig);
plot(n,x_d,'b',n,x_noise,'r');
legend('Sinal', 'Sinal com ruído');

taps = 51; % qtd de coeficientes do filtro
imp = zeros(1,MAXLEN);
imp(10) = 1;

fc = 10; % f era 5, colocamos a fc como sendo o dobro, empiricamente
wc = fc/(0.5*fs); % wc deve estar entre 0 e 1, sendo 1 equivalente a frequencia de nyquist (0.5*fs)

idx_fig = idx_fig + 1;

%% Parte B - FIR1 Matlab - Lowpass
%%%%%%%%%%%%%%%%%%%% FIR1 - matlab
b_fir1 = fir1(taps-1,wc,'low');
x_fir1 = conv(b_fir1,x_noise);%filter(b_fir1,1,x_noise);

b_fft_fir1 = fft(conv(b_fir1,imp)); %Resposta em frequencia do filtro


%% Parte C - Projeto Filtro FIR Lowpass
%%%%%%%%%%%%%%%%%%%% FIR - manual
low_pass_end = floor(wc*MAXLEN/2);
fx = zeros(1,MAXLEN);% defina a resposta ideal do filtro (binária)
fx(1:low_pass_end) = 1; % passa baixa
fx((MAXLEN-low_pass_end):MAXLEN) = 1; % imagem espelhada do espectro para o passa baixa

x_ = ifft(fx); % Convertendo a resposta ideal para dominio do tempo
mid_point = floor(MAXLEN/2);% desloque os dados de frequencia
x2_ = [x_(mid_point+1:MAXLEN), x_(1:mid_point)]; % teoria do deslocamento da DFT

idx_fig = idx_fig + 1;
figure(idx_fig)
subplot(2,1,1)
plot(fx); title('Sinal desejado do filtro')
subplot(2,1,2)
plot(abs(x_),'b'); hold on
plot(abs(x2_),'r');title('Responsta do filtro no tempo')
legend('sinal','sinal deslocado - teoria deslocamento DFT');

% extrai os valores de coeficienes de x2_ deslocado pela teoria de
% deslocamento da DFT
half_taps = floor((taps-1)/2);
b_fir_m_aux = x2_(mid_point - half_taps : mid_point + half_taps);

b_fir_m = zeros(size(b_fir_m_aux)); % Calcular a norma dos coeficientes (pois são complexo) e manter o sinal
for k = 1:length(b_fir_m_aux)
    if (sign(b_fir_m_aux(k)) < 0)
        b_fir_m(k) = -abs(b_fir_m_aux(k));
    else
        b_fir_m(k) = abs(b_fir_m_aux(k));
    end 
end


x_fir_m = conv(x_noise, b_fir_m);
x_fir_m = x_fir_m(1:N); % crop equal to FIR1
b_fft_fir_m = fft(conv(b_fir_m,imp)); %Resposta em frequencia do filtro

%%%%%%%%%%%%%%%%%%%% FIR Manual com janelamento de hamming
w = window(@hamming, taps); 
b_fir_m_improve = w'.* b_fir_m;

x_fir_m_imrpove = conv(x_noise, b_fir_m_improve);
x_fir_m_imrpove = x_fir_m_imrpove(1:N); % crop equal to FIR1
b_fft_fir_m_improve = fft(conv(b_fir_m_improve,imp)); %Resposta em frequencia do filtro


%% Plotagem de gráficos

idx_fig = idx_fig + 1;
%%%%%% sinal
figure(idx_fig);
subplot(2,2,1);
plot(n,x_d);

subplot(2,2,3); 
plot(n,x_noise,'b');hold on
plot(n,x_fir1(1:length(n)),'r');
plot(n,x_fir_m,'k');
plot(n,x_fir_m_imrpove,'g');

legend('noise','fir1','manual','manual improved');

%%%%%% Espectro

subplot(2,2,2)
plot(n*fs/N,abs(fft(x_d)),'b');

subplot(2,2,4);
plot(n*fs/N,abs(fft(x_noise)),'b');
hold on;
plot(n*fs/N,abs(fft(x_fir1(1:length(n)))),'r');
plot(n*fs/N,abs(fft(x_fir_m)),'k');
plot(n*fs/N,abs(fft(x_fir_m_imrpove)),'g');

%%%%%% Resposta na frequencia

idx_fig = idx_fig + 1;
figure(idx_fig);
subplot(2,1,1);
plot(1:length(b_fir1), b_fir1, 'b');title('Coeficientes do filtro - FIR1 Matlab vs Manual');
hold on;
plot(1:length(b_fir_m), b_fir_m, 'r')
plot(1:length(b_fir_m_improve), b_fir_m_improve, 'g')
legend('FIR1','Manual','Manual Improve');

subplot(2,1,2);
half = 1:ceil(length(b_fft_fir1)/2);
plot((half/max(half))*(0.5*fs), abs(b_fft_fir1(half)),'b')
hold on;
half_m = 1:ceil(length(b_fft_fir_m)/2);
plot((half_m/max(half_m))*(0.5*fs), abs(b_fft_fir_m(half_m)),'r')
plot((half_m/max(half_m))*(0.5*fs), abs(b_fft_fir_m_improve(half_m)),'g')
title('Resposta de magnitude em frequencia');
legend('FIR1','Manual','Improve');



