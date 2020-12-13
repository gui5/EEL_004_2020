% simulacoes usando o filtro

clear
clc
close all

pkg load communications;
pkg load signal;

fig_id =1;
simulate_filter(50,1,fig_id);
title('Fs = 50Hz F = 1Hz');

fig_id =2;
simulate_filter(50,15,fig_id);
title('Fs = 50Hz F = 15Hz');

fig_id =3;
simulate_filter(50,10,fig_id);
title('Fs = 50Hz F = 10Hz');

fig_id =4;
simulate_filter(200,70,fig_id);
title('Fs = 200Hz F = 70Hz');

fig_id =4;
simulate_filter(200,70,fig_id);
title('Fs = 200Hz F = 70Hz');

fig_id =5;
simulate_filter(1000,300,fig_id);
title('Fs = 1000Hz F = 300Hz');