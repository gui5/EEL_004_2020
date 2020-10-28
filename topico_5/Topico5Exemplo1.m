% Topico5Exemplo1.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Harmonicos / Funcionamento DFT
%
% Dicas: Evite acentuacoes em scripts

clear
close all
clc

N = 100;
n = 0:N-1;

fs=200;
x = 2*cos(2*pi*23*(n/fs));
X = fft(x);
m = 0:30;

stem(m*fs/N,abs(X(m+1)))