function [N,Fs,D] = compressSignal(signal,sampleRate)
  N = length(signal);
  X = fft(signal);
  Fs = sampleRate;
  
  tol = 0.001; % tolerancia
  
  %X[0] termo DC
  D=[2* abs(X(0+1)/N);1 *(Fs/N);angle(X(0+1)/N)];
  
  for m = 2:ceil(N/2)
    tt = ceil(2 * abs(X(m)/N) - tol); %aplica a tolerancia
    if (tt > 0)
      mag = 2*abs(X(m)/N);  % calculo da magnitute
      f = m*(Fs/N);        % calculo da frequencia
      ang = angle(X(m)/N);  % calculo da fase
      D = [D, [mag;f;ang]]; % adiciona no vetor X
    end
  end
  
endfunction
