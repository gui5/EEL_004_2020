% Topico8Exemplo3.m
% -----------------------------------------------------
% Disciplina Processamento de Sinais em Tempo Discreto
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São Carlos - UFSCar
% Prof. Samuel L Nogueira
% -----------------------------------------------------
% Exemplo Testes com ECG
%   
% Dicas: Evite acentuacoes em scripts

clear
clc
close all

%% Parte 1 - Carregar 
load ECGData.mat
FS = 128;
N = length(ECGData);

time_v = linspace(0,length(ECGData)*1/FS - 1/FS,length(ECGData));

nyquist = FS/2;
order = nyquist/2; % chute


%% Parte 2 - Passa-faixa de 0.5 a 2 Hz (perde informacao)
fc_range  = [0.5 2];
wc_range = fc_range/(nyquist); % wc deve estar entre 0 e 1, 
                               % sendo 1 equivalente a 
                               % frequencia de nyquist (0.5*fs)
% filter kernel
filtkern = fir1(order,wc_range,'bandpass');

% filter, jah faz o resize ignorando o final nao confiavel
% y = filter(filtkern,1,ECGData);

% somente para definicao
% usando o conv e resize_signal_filt, para ter alinhamento
y = conv(ECGData,filtkern); % ou filter(filtkern,1,ECGData)
y = resize_signal_filt(y,order,'c');

fig1=figure;
axes1 = axes('Parent',fig1);hold on;

plot(time_v,ECGData,'LineWidth',2); hold on;
plot(time_v,y,'LineWidth',3);


xlabel('Tempo(s)','FontSize',16);
ylabel('Amplitude','FontSize',16);

xlim([0 10]);


set(axes1,'FontSize',16);


%% Parte 3 - Passa-faixa de 5 a 20 Hz (perde informacao)
fc_range  = [5 20];
wc_range = fc_range/(nyquist); % wc deve estar entre 0 e 1, 
                               % sendo 1 equivalente a 
                               % frequencia de nyquist (0.5*fs)
% filter kernel
filtkern = fir1(order,wc_range,'bandpass');

% filter, jah faz o resize ignorando o final nao confiavel
% y = filter(filtkern,1,ECGData);

% somente para definicao
% usando o conv e resize_signal_filt, para ter alinhamento
y = conv(ECGData,filtkern);
y = resize_signal_filt(y,order,'c');

fig1=figure;
axes1 = axes('Parent',fig1);hold on;

plot(time_v,ECGData,'LineWidth',2); hold on;
plot(time_v,y,'LineWidth',3);


xlabel('Tempo(s)','FontSize',16);
ylabel('Amplitude','FontSize',16);

xlim([0 10]);
set(axes1,'FontSize',16);

%% Parte 3 - Identificar o evento QRS

y = ECGData;

% Teager-Kaiser energy operator
for i = 2:length(y)-1
    y(i) = ECGData(i)^2 - ECGData(i-1)*ECGData(i+1);
end

fig1=figure;
axes1 = axes('Parent',fig1);hold on;

plot(time_v,ECGData,'LineWidth',2); hold on;
plot(time_v,y,'LineWidth',3);


xlabel('Tempo(s)','FontSize',16);
ylabel('Amplitude','FontSize',16);

xlim([0 10]);
set(axes1,'FontSize',16);