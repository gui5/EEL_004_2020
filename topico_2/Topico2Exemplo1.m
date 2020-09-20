% Topico2Exemplo1.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Introducao a Transformada de Fourier
%
% Dicas: Evite acentuacoes em scripts

clear
clc
%close all
cla

%% Funcoes utilizadas
function [f,Y] = computeFFT(X,fs)

L = length(X);

x_fft = fft(X); % Fast Fourier Transform 

P2 = abs(x_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

Y = fs*(0:(L/2))/L;
f = P1;

end


num_win_f = 20; % numero de janelas de f0
f0 = 264;  % do, f0 nao eh componente de maior frequencia.
f1 = 297;  % re
f2 = 330;  % mi
fmax = max([f0,f1,f2]);
fs = 10*fmax;         % frequencia de amostragem
Ts = 1/fs;      % periodo de amostragem
% FIXO como k = -1;         % numero de repeticoes de componentes senoidais

num_points = 10*fs; % pontos para aparencia suave do sinal (simulacao analogico)
num_samples = (round(num_win_f/(fmax*Ts))); % numero de amostras para simular a leitura amostrada

step = num_win_f/(fmax*num_points); % incremento apropriado
t = 0:step:num_win_f*(1/fmax);      % tempo
n = 0:num_samples-1;          % indice da amostra

% funcoes analogicas simuladas
x_0 = cos(2*pi*(f0)*t); 
x_1 = cos(2*pi*(f1)*t); 
x_2 = cos(2*pi*(f2)*t); 
x_comp = (x_0 + x_1 + x_2)/(1+1+1); % (1+1+1) amplitude de cada cosseno;

% sinais amostrados das funcoes analogicas simuladas, ou simplismente
% digitais simulados
x0_d(n+1) = cos(2*pi*(f0)*(n*Ts)); 
x1_d(n+1) = cos(2*pi*(f1)*(n*Ts)); 
x2_d(n+1) = cos(2*pi*(f2)*(n*Ts)); 

xcomp_d = (x0_d + x1_d + x2_d)/(1+1+1); % (1+1+1) amplitude de cada cosseno;


%% Fast Fourier Transform

[p0,Y0] = computeFFT(xcomp_d,fs);

% % figure;
% subplot(2,2,3);
% plot(f,P1);title('FFT RAW');
%% plotar graficos

% sinais analogicos simulados
subplot(2,2,1); hold on;
plot(t,x_0,'r-');
plot(t,x_1,'b-');
plot(t,x_2,'g-');
plot(t,x_comp,'k*');
title('Sinais analogicos simulados');
xlabel('tempo(s)');
ylabel('amplitude');
legend(sprintf('dó: %.1fHz',f0),...
       sprintf('ré: %.1fHz',f1),...
       sprintf('mi: %.1fHz',f2),...
       'Soma de sinais');
xlim([0 t(end)]);

% sinais amostrados, digitais simulados
subplot(2,2,3);
plot(n,xcomp_d,'ko');hold on
title('Sinal digital simulado');
xlabel('amostras');
ylabel('amplitude');
% legend('x : sinal amostrado',...
%        'y : sinal amostrado',...
%        'z : f0 e -f0',...
%        'composto : (x + f0)');
xlim([0 t(end)*fs]);

subplot(2,2,[2 4]);
bar(Y0,p0);title('FFT'); % stem
xlabel('Hz');



