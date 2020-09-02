
clear
clc
Fs = 9000;
Ts = 1/Fs;
N = 200;
n = 0:N-1;

% a) 
  x = 3 * cos(2*pi*7000*n*Ts -  pi/4) + 2*cos(2*pi*4000*n*Ts) + cos(2*pi*3000*n*Ts - pi/7);
 %b)
figure(1);
plot(x);
 
 
%c)
% Sobreposicoes espectrais: 4000Hz, 3000Hz
% No sinal amostrado veriamos as frequencias de 2000hz  3000h e 4000hz, a frequencia de 12khz eh perdida

%d)
figure(2);
plot_fft(x,Fs,N)

% e) Para resolver o problema, deve-se amostrar no minimo a 2x a maior frequencia componente do sinal,
% no caso como a componente mais alta eh 12kh a amostragem deve ser feita a 24KHz no minimo.

Fs2 = 24000;
Ts2 = 1/Fs2;

y= 3*cos(2*pi*2000*n*Ts2 + pi/4) + 2*cos(2*pi*5000*n*Ts2) + cos(2*pi*12000*n*Ts2 - pi/7);

figure(3);
plot(y)

figure(4);
plot_fft(y,Fs2,N)

 