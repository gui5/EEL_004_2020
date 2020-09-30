function [N,Fs,X] = epc4_4(signal,sampleRate)
  N = length(signal);
  x = fft(signal);
  Fs = sampleRate;
  
  X=[];
  for m = 1:N
    mag = 2* abs(x(m)/N);
    if mag > 0.95
      f = m *(Fs/N);
      ang = angle(x(m)/N);
      X = [X, [mag;f;ang]];
    end
  end
  
endfunction
