function [a, b]  = epc1_12(x)
  if mod(length(x),2) !=0,
    error("Entrada deve conter um numero par de elementos")
  else
  
  i =1;
  j =1;
  
  while(i<=length(x))
     a{1,j} = x{1,i}+x{1,i+1};
     b{1,j} = x{1,i}-x{1,i+1};
     i = i+2;
     j = j+1;
  end
end

endfunction
 