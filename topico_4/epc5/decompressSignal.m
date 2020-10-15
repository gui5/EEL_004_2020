
function S = decompressSignal(N,FS,X)
 %reconstruindo a FFT dos sinais
%sfft = rebuildFFT(N,FS,X);

n = 1:N;
Ts = 1/FS;

 comp = X(:,2);
 freq = comp(2);
 mag = comp(1);
 phase = comp(3);
 S = mag * cos(2*pi *freq * n * Ts + phase);
 
for k = 3:length(X)
  comp = X(:,k);
  freq = comp(2);
  mag = comp(1);
  phase = comp(3);
  
  S = S + (mag * cos(2*pi *freq * n * Ts + phase));
end

%reconstruindo o sinal aplicando a ifft
%S = ifft(sfft);
endfunction
