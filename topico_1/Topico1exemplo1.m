
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Ondas Senoidais
%
% Dicas: Evite acentuacoes em scripts

clear
close all
clc

Freq = 100;  % frequencia de 100 Hz
Ts = 0.0002; % tempo de amostagem, Ts, eh de 0.2 ms
n = 0:99;   % vetor contendo o indice de 100 amostras
t = n*Ts;    % vetor contendo os valores de tempo amostrado
fase = 0;

%% Parte 1
% objetivo de verificiar o que a AMPLITUDE faz em uma senoide
figure(1);
sinal = 2 * sin(2*pi*Freq*t + fase);
plot(t,sinal,'r'); 
hold on;
sinal = 1 * sin(2*pi*Freq*t + fase);
plot(t,sinal,'b');
title('Mudanca de amplitude');
xlabel('Tempo(s)')
ylabel('Ampliture(Admensional)');
legend('Amplitude = 2', 'Amplitude = 1');

%% Parte 2
% objetivo de verificiar o que a FREQUENCIA faz em uma senoide
figure(2);
Freq_1 = 2*Freq;
sinal = 2 * sin(2*pi*Freq_1*t + fase);
plot(t,sinal,'r'); 
hold on;
Freq_2 = Freq_1/2;
sinal = 2 * sin(2*pi*Freq_2*t + fase);
plot(t,sinal,'b');
title('Mudanca de Frequencia');
xlabel('Tempo(s)')
ylabel('Ampliture(Admensional)');
legend(sprintf('Frequencia = %d',Freq_1), ...
       sprintf('Frequencia = %d',Freq_2));

%% Parte 3
% objetivo de verificiar o que a FASE faz em uma senoide
figure(3);
Freq = 100;
sinal = 1 * sin(2*pi*Freq*t + fase);
plot(t,sinal,'r'); 
hold on;
fase = (pi/180)*35; 
sinal = 1 * sin(2*pi*Freq*t + fase);
plot(t,sinal,'b-.');
title('Mudanca de Fase');
xlabel('Tempo(s)')
ylabel('Ampliture(Admensional)');
legend('Fase = 0^o', 'Fase = 45^o');

%% Parte 4
% objetivo de verificiar o que a QUANTIDADE DE AMOSTRAS faz em uma senoide
figure(4);
Freq = 100;
fase = 0;

sinal = 2 * sin(2*pi*Freq*t + fase);
plot(t,sinal,'r'); 
hold on;

n = 1:200;   % vetor contendo o Indice de 200 amostras
t = n*Ts;    % vetor contendo os valores de tempo amostrado
sinal = 2.2 * sin(2*pi*Freq*t + fase);
plot(t,sinal,'b-.');
title('Aumentando quantidade de amostras');
xlabel('Tempo(s)')
ylabel('Ampliture(Admensional)');
legend('100 amostras', '200 amostras');