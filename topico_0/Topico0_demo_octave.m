% Prof. Samuel L Nogueira
% Exemplo FFT e Filtros Digitais
%
%
% Evite acentuacoes em scripts

clear
clc

pkg load signal

%% Ler o arquivo de audio
load vivaldi_primavera.mat;

%% tocar musica
soundsc(data_music,fs);

%% plotar sinais no dominio do tempo
size_t = length(data_music);
t = linspace(0,(size_t-1)/fs,size_t)';

figure(1), clf
subplot(5,1,1)
plot(t,data_music(:,1),'m')
ylabel('Canal 1');
subplot(5,1,2)
plot(t,data_music(:,2),'b')
ylabel('Canal 1');
xlabel('Tempo (s)')

%% Transformada rápida de fourier (FFT)

% faixa de interesse da Fourier
f1 = 20; f2 = 4000; % f2 deve ser menor que fs/2



% Espectro de potencia
axis_hz = linspace(0,fs/2,floor(length(data_music)/2)+1);
axis_powr = abs(fft(data_music(:,1))/size_t);

subplot(5,1,3), cla
plot(axis_hz,axis_powr(1:length(axis_hz)))



band_norm = [max(find(axis_hz < f1)) ...
             max(find(axis_hz < f2))];
max_powr = max(axis_powr(band_norm(1):band_norm(2))); 
set(gca,'xlim',[f1 f2],'ylim',[0 max_powr])
xlabel('Frequencia (Hz)'), ylabel('Amplitude')

%%%%% Filtro passa faixa
filter_freqs = [20 2100]; % frequencias baixas
filter_freqs = [2100 4000]; % frequencias altas
filter_freqs = [500 1100];


% Projeto de filtro FIR1
band_filter = fir1(f2+1,filter_freqs/(fs/2),'bandpass');

% Aplicando o filtro ao sinal
data_music_filt(:,1) = ...
    filtfilt(band_filter,1,data_music(:,1));
data_music_filt(:,2) = ...
    filtfilt(band_filter,1,data_music(:,2));

% Plota o espectro do sinal filtrado
hold on
subplot(5,1,3)
axis_powr_filt = abs(fft(data_music_filt(:,1))/size_t);
plot(axis_hz,axis_powr_filt(1:length(axis_hz)),'r')

%% Espectrograma
% Plota a resposta em tempo-frequencia do sinal
subplot(5,1,4:5)
step = fix(5*fs/1000);     # one spectral slice every 5 ms
window = fix(40*fs/1000);  # 40 ms data window
fftn = 2^nextpow2(window); # next highest power of 2
[S, f, t] = specgram(data_music(:,1), fftn, fs, window, window-step);
S = abs(S(2:fftn*f2/fs,:)); # magnitude in range 0<f<=4000 Hz.
S = S/max(S(:));           # normalize magnitude so that max is 0 dB.
S = max(S, 10^(-40/10));   # clip below -40 dB.
S = min(S, 10^(-3/10));    # clip above -3 dB.
imagesc (t, f, log(S));    # display in log scale
set (gca, "ydir", "normal"); # put the 'y' direction in the correct direction

hold on
plot(t([1 1; end end]),...
    filter_freqs([1 2; 1 2]),'k:','linew',2)
    
set(gca,'ylim',[0 f2])    

%% Musica apos o filtro
soundsc(data_music_filt,fs)