function E = computeError(X,Y)
  N = length(X);
  E = 0;
  for k = 1:N
    E = E + (X(k)-Y(k))^2
  endfor
endfunction
