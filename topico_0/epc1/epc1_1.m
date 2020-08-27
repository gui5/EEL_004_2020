% Escreva uma func que mantenha uma lista de numeros
% em ordem decrescente (do maior para o menor) 
function resp = epc1_1 (n)
  if nargin != 1,
    error("no arguments passed!")
  end;
  
  if isvector(n),
    resp = flip(sort(n));
  else
    error("epc1_1(vector)")
  end;
  
endfunction
