% Topico3Exemplo3.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Magnitude de Amplitude vs Magnitude de Potência
%
% Dicas: Evite acentuacoes em scripts

clear
close all
clc

k = 45*pi/180;
A = 1.3;
euler = A*exp( 1i*k );

%% Parte 1 : amplitude vs potencia

% amplitude
amp = sqrt(real(euler)^2+imag(euler)^2); % ou: abs(euler);

axis1 = subplot(1,2,1);
h1 = plot(amp*cos(k),amp*sin(k) ,'ko','markerfacecolor','r','markersize',15);
grid on, hold on, axis square
set(axis1,'xlim',[-1.5 1.5],'ylim',[-1.5 1.5])
plot(get(axis1,'xlim'),[0 0],'k','linew',2)
plot([0 0],get(axis1,'ylim'),'k','linew',2)
xlabel('Cosseno')
ylabel('Seno')
% also draw a unit circle
x = linspace(-pi,pi,100);
h = plot(cos(x),sin(x));
set(h,'color',[1 1 1]*.7) % light gray
uistack(h1,'top'); % put red circle on top 
% draw a line using polar notation
h = polar([0 angle(euler)],[0 amp],'r');
set(h,'linewidth',2)


% potencia
pot = amp^2;
axis2 = subplot(1,2,2);
h2 = plot(pot*cos(k),pot*sin(k) ,'ko','markerfacecolor','r','markersize',15);
grid on, hold on, axis square
set(axis2,'xlim',[-1.5 1.5],'ylim',[-1.5 1.5])
plot(get(axis2,'xlim'),[0 0],'k','linew',2)
plot([0 0],get(axis2,'ylim'),'k','linew',2)
xlabel('Cosseno')
ylabel('Seno')
% also draw a unit circle
x = linspace(-pi,pi,100);
h = plot(cos(x),sin(x));
set(h,'color',[1 1 1]*.7) % light gray
uistack(h1,'top'); % put red circle on top 
% draw a line using polar notation
h = polar([0 angle(euler)],[0 pot],'r');
set(h,'linewidth',2)


%% Parte 2 : potencia 
N = 500;
n = 0:N-1;
fs = 400;
Ts = 1/fs;

% sinal de exemplo
x = 2*sin(2*pi*35*n*Ts);

X = dft(x)/N; % fft(x); 
m = 0:length(X)-1;

fprintf('A resolucao de frequencia eh: %5.2f Hz',fs/length(X));

fan = m*fs/N;

figure(2);

%%%%% Sinal Amplitude
stem(fan,2*abs(X),'b');
xlabel('f(Hz)');
title('Resposta de magnitude em frequencia');

%%%%% Sinal Potencia
hold on;
stem(fan,(2*abs(X)).^2,'r');
xlabel('f(Hz)');
ylabel('Magnitude');

legend('Espectro de Amplitude (rad)','Espectro de Potência (rad^2)');
