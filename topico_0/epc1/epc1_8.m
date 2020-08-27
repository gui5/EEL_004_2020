function [mag,phi]= epc1_8(y)
  yr=real(y);
  yi=imag(y);
  
  for i=1:length(y)
    phi(i) = atan(yi(i)/yr(i));
    mag(i) = sqrt(yr(i)*yr(i)+yi(i)*yi(i));
  end
endfunction


% a) 
% i e j sao usados para representar tambem a parte imaginaria de numeros complexos,
% entao caso eteja trabalhando com numeros complexos, eh melhor evitar o uso de i e
% j para variaveis

% b)
% um dos elementos contem parte real nula, isso faz com que o no calculo
% de phi ocorra uma divisao por zero.