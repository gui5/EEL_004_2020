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

%linha 1

figure(1)
plot(L1);
xlabel('samples');
ylabel('Amplitude');
title('Linha 1');

figure(2);
plot(L1_);
xlabel('samples');
ylabel('Amplitude');
title('Linha 1 Desc');

figure(3);
plot_fft(L1,fs,length(L1));
xlabel('Hz');
ylabel('Magnitude');
title('Linha 1 FFT');

figure(4);
plot_fft(L1_,fs,length(L1_));
xlabel('Hz');
ylabel('Magnitude');
title('Linha 1 decomprimida FFT');

%linha 2

figure(5)
plot(L2);
xlabel('samples');
ylabel('Amplitude');
title('Linha 2');

figure(6);
plot(L2_);
xlabel('samples');
ylabel('Amplitude');
title('Linha 2 Desc');

figure(7);
plot_fft(L2,fs,length(L2));
xlabel('Hz');
ylabel('Magnitude');
title('Linha 2 FFT');

figure(8);
plot_fft(L2_,fs,length(L2_));
xlabel('Hz');
ylabel('Magnitude');
title('Linha 2 decomprimida FFT');

%linha 3

figure(9)
plot(L3);
xlabel('samples');
ylabel('Amplitude');
title('Linha 3');

figure(10);
plot(L3_);
xlabel('samples');
ylabel('Amplitude');
title('Linha 3 Desc');

figure(11);
plot_fft(L3,fs,length(L3));
xlabel('Hz');
ylabel('Magnitude');
title('Linha 3 FFT');

figure(12);
plot_fft(L3_,fs,length(L3_));
xlabel('Hz');
ylabel('Magnitude');
title('Linha 3 decomprimida FFT');
