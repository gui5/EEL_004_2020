% idft.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pos-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo didatico da Transformada Discreta Inversa de Fourier
%
% Dicas: Evite acentuacoes em scripts

% Funcao IDFT - esta funcao nao eh computacionalmente eficiente, e so deve
% ser utilizada para fins didaticos
function [x] = idft(X)

N = length(X);
 
for n = 0:N-1
    soma = 0;
    
    for m = 0:N-1
		 soma = soma + X(m+1) * ...
			(cos(2*pi*n*m/N) + 1i*sin(2*pi*n*m/N));
    end   
    x(n+1) = soma/N; 
end
