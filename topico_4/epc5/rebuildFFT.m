function S = rebuildFFT(N,FS,X)
S = 0:N-1;                        %cria um array do tamanho do numero de amostras

for h = 1:N
  S(h) = 0;
end

for k = 1:length(X)
  comp = X(:,k);                  %pego a componente
  m = ceil(comp(2)*N/FS);         %encontro a posicao da frequencia
  cplx = comp(1)*exp(j*comp(3));  % converte de polar para retangular
  if m <= N && m>= 1
    S(m) = cplx;                  % coloca a componente de frequencia na posicao original na fft
  end
end

endfunction
    