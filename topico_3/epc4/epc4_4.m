function [N,Fs,X] = epc4_4(signal,sampleRate)
  N = length(signal);
  x = fft(signal);
  Fs = sampleRate;
  
  %X[0] termo DC
  X=[2* abs(x(1)/N);1 *(Fs/N);angle(x(1)/N)];
  
  for m = 2:floor(N/2)
    mag = 2* abs(x(m)/N);   % calculo da magnitute
    if mag > 0.3
      f = m *(Fs/N);        % calculo da frequencia
      ang = angle(x(m)/N);  % calculo da fase
      X = [X, [mag;f;ang]]; % adiciona no vetor X
    end
  end
  
endfunction
