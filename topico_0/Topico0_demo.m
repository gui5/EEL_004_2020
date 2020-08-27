% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo FFT e Filtros Digitais
%
% Dicas: Evite acentuacoes em scripts

clear
clc
figure(1), clf

%% Ler o arquivo de audio
load vivaldi_primavera.mat;

%% plotar sinais no dominio do tempo
size_t = length(data_music);
t = linspace(0,(size_t-1)/fs,size_t)';

subplot(5,1,1)
plot(t,data_music(:,1),'m')
ylabel('Canal 1');
subplot(5,1,2)
plot(t,data_music(:,2),'b')
ylabel('Canal 2');
xlabel('Tempo (s)')

%% tocar musica
soundsc(data_music,fs);

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

%% Filtro passa faixa
%filter_freqs = [20 1100]; % frequencias baixas
%filter_freqs = [1100 2600]; % frequencias intermediárias
filter_freqs = [2600 20000];


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
spectrogram(data_music(:,1),...
            hann(round(fs/10)),...
            [],[],fs,'yaxis');
hold on
plot(t([1 1; end end]),...
    filter_freqs([1 2; 1 2])/1000,'k:','linew',2)

set(gca,'ylim',[0 f2/1000])

%% Musica apos o filtro
soundsc(data_music_filt,fs)