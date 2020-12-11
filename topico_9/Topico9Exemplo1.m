% Topico9Exemplo1.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Filtro IIR
%
% Baseado em: 
% %%%     COURSE: Signal processing problems, solved in MATLAB and Python
% %%%    SECTION: Filtering
% %%%      VIDEO: IIR Butterworth filters
% %%%      sincxpress.com
%   
% Dicas: Evite acentuacoes em scripts
%   
% Dicas: Evite acentuacoes em scripts

clear
clc
close all

%% Parte 1 - Projeto Filtro IIR Passa-Faixa com Butter
Fs   = 1024; % hz
nyquist = Fs/2;
fc_range  = [20 50];

order = 4; % Empirico
order_fir = 50; % Empirico

% create filter coefficients (kernel)
[fkernB,fkernA] = butter(order,fc_range/nyquist);

% to compare FIR:  filter kernel
filtkern_fir = fir1(order_fir,fc_range/nyquist,'bandpass');

%%% plotting
figure(1), clf
subplot(221), hold on
plot(fkernB*1e5,'ks-','linew',2,'markersize',10,'markerfacecolor','w')
plot(fkernA,'rs-','linew',2,'markersize',10,'markerfacecolor','w')
xlabel('Pontos no tempo'), ylabel('Coeficientes')
title('Coeficientes do filtro no dominio do tempo')
legend({'B';'A'})


%% how to evaluate an IIR filter: filter an impulse

% generate the impulse
impres = [ zeros(1,500) 1 zeros(1,500) ];

% apply the filter
fimp = filter(fkernB,fkernA,impres);

fimp_fir = filter(filtkern_fir,1,impres);

% compute power spectrum
fimpX = abs(fft(fimp)).^2;
fimpX_fir = abs(fft(fimp_fir)).^2;
hz = linspace(0,nyquist,floor(length(impres)/2)+1);


%%% plot
subplot(222), cla, hold on
plot(impres,'k','linew',2)
plot(fimp,'r','linew',2)
plot(fimp_fir,'b','linew',1)
set(gca,'xlim',[1 length(impres)],'ylim',[-1 1]*.06)
legend({'Impulso';'Filtrado - IRR';'Filtrado - FIR'})
xlabel('Resposta no tempo')
title('Filtrando o Impulso')


subplot(223), hold on
plot(hz,fimpX(1:length(hz)),'ks-','linew',2,'markerfacecolor','w','markersize',10)
plot(hz,fimpX_fir(1:length(hz)),'bs-','linew',2,'markerfacecolor','w','markersize',10)
plot([0 fc_range(1) fc_range fc_range(2) nyquist],[0 0 1 1 0 0],'r','linew',4)
set(gca,'xlim',[0 100])
xlabel('Frequencia (Hz)'), ylabel('Atenuação')
title('Resposta em frequencia do filtro IIR (Butterworth)')

subplot(224)
plot(hz,10*log10(fimpX(1:length(hz))),'ks-','linew',2,'markerfacecolor','w','markersize',10)
set(gca,'xlim',[0 100])
xlabel('Frequencia (Hz)'), ylabel('Atenuação (log)')
title('Resposta em frequencia do filtro IIR (Butterworth)')

%% Parte 2 - effects of order parameter

%%%%%%%%%%%  test signal
Ts = 1/Fs;
n = 1:2000;
test_signal1 = sin(2*pi*10*n*Ts); % sinal fora da faixa de interesse, deve ser filtrado
test_signal2 = sin(2*pi*25*n*Ts); % sinal dentro da faixa de interesse, deve ter ganho proximo de 1 ou 0 dB
tempo = linspace(0,length(test_signal1)/Fs-1/Fs,length(test_signal1));
%%%%%%%%%%%%%%%%%%%%%%%%%

orders = 2:8;

fkernX = zeros(length(orders),1001);
hz = linspace(0,Fs,1001);

figure(2), clf

% add plot labels
subplot(221)
xlabel('Time points')
title('Filter coefficients (B)')

subplot(222)
xlabel('Time points')
title('Filter coefficients (A)')

% plot the spectra
subplot(223), hold on
%plot(hz,fkernX,'linew',2)
plot([0 fc_range(1) fc_range fc_range(2) nyquist],[0 0 1 1 0 0],'r','linew',4)
set(gca,'xlim',[0 100])
xlabel('Frequency (Hz)'), ylabel('Attenuation')
title('Frequency response of filter (Butterworth)')

% in log space
subplot(224); hold on;
%plot(hz,10*log10(fkernX),'linew',2)
set(gca,'xlim',[0 100],'ylim',[-80 2])
xlabel('Frequency (Hz)'), ylabel('Attenuation (log)')
title('Frequency response of filter (Butterworth)')

for oi=1:length(orders)
    
    figure(2);
    
    aux_order = sprintf('%d',orders(oi));
    order_txt{oi} = aux_order;    
    
    % create filter kernel
    [fkernB,fkernA] = butter(orders(oi),fc_range/nyquist);
    n(oi) = length(fkernB);
    
    % filter the impulse response and take its power
    fimp         = filter(fkernB,fkernA,impres);
    fkernX(oi,:) = abs(fft(fimp)).^2;
    
    % show in plot - time
    subplot(221), hold on
    plot((1:n(oi))-n(oi)/2,zscore(fkernB)+oi,'linew',2)
    legend(order_txt);
    
    subplot(222), hold on
    plot((1:n(oi))-n(oi)/2,zscore(fkernA)+oi,'linew',2)
    legend(order_txt);
    
    % show in plot - frequency
    subplot(223), hold on;
    plot(hz,fkernX(oi,:),'linew',2);

    % show in plot - frequency (dB) 
    subplot(224); hold on;
    plot(hz,10*log10(fkernX(oi,:)),'linew',2)
     
    % show test filter signal
    figure(3);
    test_signal1_f = filter(fkernB,fkernA,test_signal1);

    test_signal2_f = filter(fkernB,fkernA,test_signal2);

    
    plot(tempo,test_signal1_f,'b');hold on;
    plot(tempo,test_signal2_f,'r');hold off;
    legend('F1_f (10Hz)','F2_f (25Hz)');     
end

