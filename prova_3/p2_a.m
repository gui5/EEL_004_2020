clc
clear
close all
pkg load signal


Fs   = 50; % hz
nyquist = Fs/2;
fc_range  = [0 12.5];

order = 2; % Empirico

% create filter coefficients (kernel)
[fkernB,fkernA] = butter(order,fc_range/nyquist);

figure(1)
hold on
plot(fkernB*10)
plot(fkernA)
xlabel('Pontos no tempo'), ylabel('Coeficientes')
title('Coeficientes do filtro no dominio do tempo')
legend({'B x10 ';'A'})

impres = unit_impulse(100);

% apply the filter
fimp = filter(fkernB,fkernA,impres);

% compute power spectrum
fimpX = abs(fft(fimp)).^2;

hz = linspace(0,nyquist,floor(length(impres)/2)+1);

figure(2);
hold on
plot(hz,fimpX(1:length(hz)),'ks-','linew',2,'markerfacecolor','w','markersize',3)
plot([0 fc_range(1) fc_range fc_range(2) nyquist],[0 0 1 1 0 0],'r','linew',1)
set(gca,'xlim',[0 25])
xlabel('Frequencia (Hz)'), ylabel('Atenuação')
title('Resposta em frequencia do filtro IIR (Butterworth)')


fig_id =3;
simulate_filter_iir(50,1,fig_id);
title('Fs = 50Hz F = 1Hz');

fig_id =4;
simulate_filter_iir(50,15,fig_id);
title('Fs = 50Hz F = 15Hz');

fig_id =5;
simulate_filter_iir(50,10,fig_id);
title('Fs = 50Hz F = 10Hz');

fig_id =6;
simulate_filter_iir(200,70,fig_id);
title('Fs = 200Hz F = 70Hz');


fig_id =7;
simulate_filter_iir(50,1000,fig_id);
title('Fs = 50Hz F = 300Hz');
