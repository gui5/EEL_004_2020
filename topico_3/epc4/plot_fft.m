% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de P?s-Gradua??o em Engenharia El?trica
% Universidade Federal de S?o Carlos - UFSCar
% Prof. Samuel L Nogueira

% plot_fft(x_d,fs,num_samples)
%   x_d : vetor com dados amostrados
%   fs : frequencia de amostragem
%   num_samples : numero de amostras

function plot_fft(x_d,fs,num_samples)

axis_hz = linspace(0,fs/2,floor(num_samples/2)+1);
axis_powr = abs(fft(x_d)/num_samples);

plot(axis_hz,axis_powr(1:length(axis_hz)));