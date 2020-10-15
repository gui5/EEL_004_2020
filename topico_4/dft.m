% Funcao DFT - esta funcao nao eh computacionalmente eficiente, e so deve
% ser utilizada para fins didaticos


function [X] = dft(x)

Xsize = length(x);

for m = 0:Xsize-1
    mysumm = 0;
    
    for n = 0:Xsize-1
        mysumm = mysumm + x(n+1) * (cos(2*pi*n*m/Xsize)  ...
            - 1i*sin(2*pi*n*m/Xsize));             
    end   
    X(m+1) = mysumm; 
end

