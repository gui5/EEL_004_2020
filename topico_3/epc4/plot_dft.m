function plot_dft(x_d,fs,num_samples)

axis_hz = linspace(0,fs,floor(num_samples)+1);
axis_powr = abs(fft(x_d)/num_samples);

plot(axis_hz,axis_powr(1:length(axis_hz)));