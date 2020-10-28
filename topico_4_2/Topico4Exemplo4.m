% Topico4Exemplo4.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Vazamento Espectral
%
% Dicas: Evite acentuacoes em scripts

clear
clc
close all

%% Parte 1 : Vazamento espectral

N1 = 100;
N2 = 99;

fs1 = 1000;  
fs2 = 1000;
Ts1 = 1/fs1;        
Ts2 = 1/fs2;

n1 = 0:N1-1;          
n2 = 0:N2-1;

x1 = 3*cos(2*pi*200*n1*Ts1 - 7*pi/8) + 2*cos(2*pi*300*n1*Ts1) + cos(2*pi*400*n1*Ts1 + pi/4);
x2 = 3*cos(2*pi*200*n2*Ts2 - 7*pi/8) + 2*cos(2*pi*300*n2*Ts2) + cos(2*pi*400*n2*Ts2 + pi/4);

mag1 = 2*abs(fft(x1))/N1;
mag2 = 2*abs(fft(x2))/N2;

fa1 = n1*fs1/length(n1);
fa2 = n2*fs2/length(n2);

% graficos
subplot(2,1,1);
plot(fa1,mag1,'*');
xlim([fa1(1),fa1(end)]);

subplot(2,1,2);
plot(fa2,mag2,'*');
xlim([fa2(1),fa2(end)]);hold on;

%% Parte 2 : Vazamento espectral - melhorar visualização com ZeroPadding ou precisão com N

N2 = 99;
fs2 = 1000;
Ts2 = 1/fs2;
n2 = 0:N2-1;

x2 = 3*cos(2*pi*200*n2*Ts2 - 7*pi/8) + 2*cos(2*pi*300*n2*Ts2) + cos(2*pi*400*n2*Ts2 + pi/4);

nZpad = length(x2)+11;
mag2_zp = 2*abs(fft(x2,nZpad))/N2;
fa2_zp = 0:fs2/nZpad:fs2-fs2/nZpad;

subplot(2,1,2);
plot(fa2_zp,mag2_zp,'or');
xlim([fa2(1),fa2(end)]);
