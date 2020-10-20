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

subplot(3,1,1);
plot(L1_);
xlabel('samples');
ylabel('Amplitude');
title('Linha 1 descomprimida');
subplot(3,1,2);
plot(L2_);
xlabel('samples');
ylabel('Amplitude');
title('Linha 2 descomprimida');
subplot(3,1,3);
plot(L3_);
xlabel('samples');
ylabel('Amplitude');
title('Linha 3 descomprimida');


