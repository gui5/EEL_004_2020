% simulacoes usando o filtro

clear
clc
close all

pkg load communications;
pkg load signal;

fig_id =1;
simulate_filter_fir(50,1,fig_id);
title('Fs = 50Hz F = 1Hz');

fig_id =2;
simulate_filter_fir(50,15,fig_id);
title('Fs = 50Hz F = 15Hz');

fig_id =3;
simulate_filter_fir(50,10,fig_id);
title('Fs = 50Hz F = 10Hz');

fig_id =4;
simulate_filter_fir(200,70,fig_id);
title('Fs = 200Hz F = 70Hz');


fig_id =6;
simulate_filter_fir(50,1000,fig_id);
title('Fs = 50Hz F = 300Hz');

