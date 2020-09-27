% Funcao DFT - esta funcao nao eh computacionalmente eficiente, e so deve
% ser utilizada para fins didaticos
function [X] = dft_debug(x)

Xsize = length(x);

for m = 0:Xsize-1
    for n = 0:Xsize-1
        matSumm(m+1,n+1) =  x(n+1) * (cos(2*pi*n*m/Xsize)  ...
            - i*sin(2*pi*n*m/Xsize));             
    end   
end

matSumm
for m = 0:Xsize-1
    mysumm = 0;
    
    for n = 0:Xsize-1
        mysumm = mysumm + matSumm(m+1,n+1);           
    end 
    X(m+1) = mysumm; 
end
