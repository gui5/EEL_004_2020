% Topico10Exemplo3.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
%
%   Fourier 2D - Imagens
%
% Dicas: Evite acentuacoes em scripts

clear 
close all 
clc

%% Parte 1 - Gerar imagem

size_m = 7;

width  = 1.5;   % width of gaussian (normalized Z units)
[x,y]  = ndgrid(zscore(1:size_m),zscore(1:size_m));

% add 1- at beginning of the next line to invert the filter
imgtest = exp(-(x.^2 + y.^2) ./ (2*width^2)); % low pass filter

figure;
%subplot(1,3,1)
imagesc(imgtest);


%% FFT nas colunas
figure;
fft_imgtest = zeros(7,7);
for j = 1:size_m
    fft_imgtest(:,j) = fft(imgtest(:,j));
end

%subplot(1,2,1)
imagesc(abs(fft_imgtest));


%% FFT nas linhas
for i = 1:size_m
    fft_imgtest(i,:) = fft(fft_imgtest(i,:));
end

figure
%subplot(1,2,2)
imagesc(abs(fft_imgtest));

%% FFT2

fft_imgtest2 =  fft2(imgtest);

figure;
subplot(1,2,1)
imagesc(abs(fft_imgtest));
subplot(1,2,2)
imagesc(abs(fft_imgtest2));