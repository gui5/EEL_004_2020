% Topico2Exemplo0.m
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
close all

num_win_f = 20; % numero de janelas de f0
f0 = (7*24);  % do, f0 nao eh componente de maior frequencia.
f1 = (24);  % re
fmax = max([f0,f1]);
fs = 10*fmax;         % frequencia de amostragem
Ts = 1/fs;      % periodo de amostragem
% FIXO como k = -1;         % numero de repeticoes de componentes senoidais

num_points = 10*fs; % pontos para aparencia suave do sinal (emulando analogico)
num_samples = round(num_win_f/(fmax*Ts)); % numero de amostras para simular a leitura amostrada

step = num_win_f/(fmax*num_points); % incremento apropriado
t = 0:step:num_win_f*(1/fmax);      % tempo
n = 0:num_samples-1;          % indice da amostra

% funcoes analogicas simuladas
x_0 = cos(2*pi*(f0)*t); 
x_1 = cos(2*pi*(f1)*t); 
x_comp = (x_0 + x_1)/(1+1); % (1+1+1) amplitude de cada cosseno;

% sinais amostrados das funcoes analogicas simuladas, ou simplismente
% digitais simulados
x0_d(n+1) = cos(2*pi*(f0)*(n*Ts)); 
x1_d(n+1) = cos(2*pi*(f1)*(n*Ts)); 

xcomp_d = (x0_d + x1_d)/(1+1); % (1+1+1) amplitude de cada cosseno;


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
xlabel('tempo(s)');
ylabel('amplitude');
legend('Dias',...
       'Semana');
xlim([0 t(end)]);

% sinais amostrados, digitais simulados
subplot(2,2,3);
plot(t,x_comp,'k*');hold on
xlim([0 t(end)]);
xlabel('amostras');
ylabel('amplitude');

subplot(2,2,[2 4]);
bar(Y0,p0);title('FFT');
xlabel('Hz');

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
