clear;
clc;

fs = 44100;
n = 0:(fs *3)-1;
M = getMusic(fs,n);
[N,Fs,X] = epc4_4(M,fs);

% taxa de compressao
tc = 100.0 - 100 * ((length(X)*3 + 2)/length(M));

printf("Taxa de compressao atingida: %.5f\n",tc);