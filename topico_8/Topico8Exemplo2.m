% Topico8Exemplo2.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Estudo de caso sobre a a mudanca da ordem de um filtro FIR
%   
% Baseado em: 
% %%%     COURSE: Signal processing problems, solved in MATLAB and Python
% %%%    SECTION: Filtering
% %%%      VIDEO: FIR filters with fir1
% %%%      sincxpress.com
%   
% Dicas: Evite acentuacoes em scripts

%% Parte 1 - Projeto Filtro - Passa-Faixa (bandpass)

clear
close all
clc

Fs   = 1000; % hz
nyquist = Fs/2;
fc_range  = [20 50];

order = nyquist/2; % Chute

wc_range = fc_range/(nyquist); % wc deve estar entre 0 e 1, 
                               % sendo 1 equivalente a 
                               % frequencia de nyquist (0.5*fs)

% filter kernel
filtkern = fir1(order,wc_range,'bandpass');

% compute the power spectrum of the filter kernel
filtpow = abs(fft(filtkern)).^2;

% compute the frequencies vector and remove negative frequencies
hz      = linspace(0,Fs/2,floor(length(filtkern)/2)+1);
filtpow = filtpow(1:length(hz));

figure(1), clf
subplot(2,3,1)
plot(filtkern,'linew',2)
xlabel('Pontos no tempo')
title('Filtro FIR (fir1) - Coeficientes')
axis square



% plot amplitude spectrum of the filter kernel
subplot(2,3,2), hold on
plot(hz,filtpow,'ks-','linew',2,'markerfacecolor','w')

plot([0 fc_range(1) fc_range fc_range(2) nyquist],[0 0 1 1 0 0],'ro-','linew',2,'markerfacecolor','w')

% make the plot look nicer
set(gca,'xlim',[0 fc_range(1)*4])%,'ylim',[-.05 1.05])
xlabel('Frequencia (Hz)'), ylabel('Atenuação')
legend({'Atual';'Ideal'})
title('Resposta em frequencia do filtro (fir1)')
axis square


subplot(2,3,3), hold on
plot(hz,10*log10(filtpow),'ks-','linew',2,'markersize',10,'markerfacecolor','w')
set(gca,'xlim',[0 fc_range(1)*4],'ylim',[-80 2])
xlabel('Frequencia (Hz)'), ylabel('Atenuação (dB)')
title('Resposta em frequencia do filtro (fir1)')
axis square

%%%%%%%%%%% test signal
Ts=1/Fs;
n = 1:250;

subplot(2,3,[4 6]), hold on
test_signal1 = sin(2*pi*10*n*Ts); % sinal fora da faixa de interesse, deve ser filtrado
test_signal2 = sin(2*pi*25*n*Ts); % sinal dentro da faixa de interesse, deve ter ganho proximo de 1 ou 0 dB
tempo = linspace(0,length(test_signal1)/Fs-1/Fs,length(test_signal1));
plot(tempo,test_signal1,'b');hold on;
plot(tempo,test_signal2,'r');hold on;

test_signal1_f = conv(test_signal1,filtkern);
test_signal1_f = resize_signal_filt(test_signal1_f, order, 'c');

test_signal2_f = conv(test_signal2,filtkern);
test_signal2_f = resize_signal_filt(test_signal2_f, order, 'c');

plot(tempo,test_signal1_f,'.b');hold on;
plot(tempo,test_signal2_f,'.r');hold on;

%% Parte 2 - effect of order parameter

%%%%%%%%%%%  test signal
n = 1:2000;
test_signal1 = sin(2*pi*10*n*Ts); % sinal fora da faixa de interesse, deve ser filtrado
test_signal2 = sin(2*pi*25*n*Ts); % sinal dentro da faixa de interesse, deve ter ganho proximo de 1 ou 0 dB
tempo = linspace(0,length(test_signal1)/Fs-1/Fs,length(test_signal1));
%%%%%%%%%%%%%%%%%%%%%%%%%

% ate nyquist
orders1 = round (linspace( nyquist/10 , ...
                           nyquist ,...
                           4) );
% de nyquist ate Fs (=2*nyquist)                      
orders2 = round (linspace( nyquist , ...
                           2*nyquist ,...
                           8) );                                  
       
tamanho_max = max(orders2(end),Fs);                       

orders = [orders1, orders2(2:end)];

fkernX = zeros(length(orders),tamanho_max);
hz = linspace(0,Fs,tamanho_max);

figure(2), clf
subplot(211);hold on;
xlabel('Time (ms)')
title('Filter kernels (fir1)')

subplot(223), hold on
plot([0 fc_range(1) fc_range fc_range(2) nyquist],[0 0 1 1 0 0],'ro-','linew',2,'markerfacecolor','w');
set(gca,'xlim',[0 100]);
xlabel('Frequency (Hz)'), ylabel('Attenuation')
title('Frequency response of filter (fir1)')

order_txt = {};
for oi=1:length(orders)
    
    figure(2);
    
    aux_order = sprintf('%d',orders(oi));
    order_txt{oi} = aux_order;    
    
    % create filter kernel
    fkern = fir1(orders(oi),wc_range,'bandpass');
    n(oi) = length(fkern);

    % take its FFT
    % fkernX(oi,:) = abs(fft(fkern,1000)).^2;
    fkernX(oi,:) = abs(fft(fkern,tamanho_max)).^2;
    
    % show in plot - time 
    subplot(211), hold on
    plot((1:n(oi))-n(oi)/2,fkern+.01*oi,'linew',2)
    legend(order_txt);
    
    % show in plot - frequency
    subplot(223), hold on
    plot(hz,fkernX(oi,:),'linew',2);set(gca,'xlim',[0 100])
    
    % show in plot - frequency (dB)    
    subplot(224)
    plot(hz,10*log10(fkernX),'linew',2);set(gca,'xlim',[0 100])
    
    % show test filter signal
    figure(3);
    test_signal1_f = conv(test_signal1,fkern);
    
    % Teste aumentando os zeros (somente para sinais estacionarios)
    %test_signal1_f = conv([test_signal1, zeros(1,floor(orders(oi)))],fkern);
    test_signal2_f = conv(test_signal2,fkern);
    
    % Teste aumentando os zeros (somente para sinais estacionarios)
    %test_signal2_f = conv([test_signal2, zeros(1,floor(orders(oi)))],fkern);
    %tempo = linspace(0,length(test_signal1_f)/Fs-1/Fs,length(test_signal1_f));
    
    test_signal1_f  = resize_signal_filt(test_signal1_f , orders(oi),'default');
    test_signal2_f  = resize_signal_filt(test_signal2_f , orders(oi),'default');

    
    plot(tempo,test_signal1_f,'b');hold on;
    plot(tempo,test_signal2_f,'r');hold off;
    legend('F1_f','F2_f');
end

xlabel('Frequency (Hz)'), ylabel('Attenuation (log)')
title('Frequency response of filter (fir1)')

%% done.
