clear;
clc;

%Criando a musica e comprimindo
fs = 44100;
[L1,L2,L3,M] = getMusic(fs);
[L1_N,L1_FS,L1_Compressed] = compressSignal(L1,fs);
[L2_N,L2_FS,L2_Compressed] = compressSignal(L2,fs);
[L3_N,L3_FS,L3_Compressed] = compressSignal(L3,fs);


L1_ = decompressSignal(L1_N,fs,L1_Compressed);
L2_ = decompressSignal(L2_N,fs,L2_Compressed);
L3_ = decompressSignal(L3_N,fs,L3_Compressed);

%reconstruindo a FFT dos sinais
%L1_FFT = rebuildFFT(L1_N,L1_FS,L1_Compressed);
%L2_FFT = rebuildFFT(L2_N,L2_FS,L2_Compressed);
%L3_FFT = rebuildFFT(L3_N,L3_FS,L3_Compressed);

%reconstruindo o sinal aplicando a ifft
%L1_S = %abs(ifft(L1_FFT));
%L2_S = %abs(ifft(L2_FFT));
%L3_S = %abs(ifft(L3_FFT));

