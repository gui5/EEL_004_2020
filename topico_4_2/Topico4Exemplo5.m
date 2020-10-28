% Topico4Exemplo5.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Harmonicos / Representando Onda Triangular
%
% Dicas: Evite acentuacoes em scripts

%
%   Mostrar como a funcao DFT pode representar uma onde triangular
%
restoredefaultpath
clear
clc
close all

N = 80;
%%%%%%% criar onda triangular (discreta)
for i = 0:20
    x(i+1) = i;
end
k = 20;
for i = 21:40
    k = k-1;
    x(i+1) = k;
end
for i = 41:60
    x(i+1) = i-40; 
end
k = 20;
for i=61:N-1 % 80
    k = k-1;
    x(i+1) = k;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% encontrar fft
y = fft(x);

% escalone o resultado
y = y / length(x);

% converter para coordenadas polares
mag = abs(y);
phi = angle(y);

% reconstrua o sinal utilizando utilizando a frequencia fundamente de 1 Hz
%   realizando a soma das requencias harmonicas
fs = 80;
m = 0:N-1;
t_d = m*1/fs;
fanalize = m*fs/N;

subplot(2,2,1);
plot(fanalize,mag);title('DFT');
subplot(2,2,3);
plot(fanalize,phi);

f = 2; % frequencia fundamental (ou considerar como no Livro do Weeks)
a = 0;

% Mostre-a, acrescentando outra senoide a cada vez
% "simulando" a IDFT 
for k = 0:length(mag)-1
    a = a + mag(k+1)*(cos(2*pi*(f*k/2)*t_d+phi(k+1)) + ...
                    1j*sin(2*pi*(f*k/2)*t_d+phi(k+1)));
    subplot(2,2,[2 4]);fig = plot(t_d,x ,'r', t_d, real(a), 'b-');
    xlabel('t(s)');
    title('sum of harmonic sinusoids (IDFT)');
    legend('Sinal','Sinal Reconstruido');
    pause(0.1);
end

