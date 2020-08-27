
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Ondas Senoidais combinadas
%
% Dicas: Evite acentuacoes em scripts

clear
close all
clc

Ts = 0.0002;  % o tempo de amostragem, Ts eh de 0.2ms
n = 0:99;    % vetor contendo o indice de 100 amostras
t = n*Ts;     % vetor contendo os valores de tempo amostrado

xa = cos(2*pi*100*t); 
xb = cos(2*pi*200*t);

x = xa + xb;

subplot(3,1,1); plot(t,xa,'b'); legend('xa');
subplot(3,1,2); plot(t,xb,'r'); legend('xb');
ylabel('amplitude');
subplot(3,1,3); plot(t,x,'.k');  legend('x = xa + xb');
xlabel('tempo(s)');



