% Topico2Exemplo2_animacao.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Traçado Espectral - Animacao
%
% Dicas: Evite acentuacoes em scripts


clear
clc
close all

idx_fig = 0;
N = 200;
n = 0:N-1;
fs = 2000;
Ts = 1/fs;

% sinal de exemplo
x =   cos(2*pi*20*n*Ts +   pi/4) + ...
     3*cos(2*pi*40*n*Ts - 2*pi/4) + ...
     2*cos(2*pi*60*n*Ts +   pi/8);

idx_fig = idx_fig + 1;
debug.idx_fig = idx_fig;
debug.fan = fs/N;
debug.full_spectrum = 0;
X= dft_animacao(x,debug); % fft(x); 
                                   
