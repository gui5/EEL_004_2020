function simulate_filter(Fs,F,figure_id)
Ts = 1/Fs;
t = 0:1/Fs:2-1/Fs; 
N = length(t);
n = 0:N-1;

% sinal discretizado com f de 10Hz
x_d = sin(2*pi*F*n*Ts);
x_noise = awgn(x_d,15);

x_s = filter_signal(x_noise);

figure(figure_id);
plot(n,x_noise,'b');hold on
plot(n,x_s(1:length(n)),'r');
legend('Sinal c/ ruido','Sinal Filtrado');
endfunction
