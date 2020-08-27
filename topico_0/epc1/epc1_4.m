clear
clc
x = [121 145 167 192 206]
y = 3*x - 4

samples = 1:length(x);

ax = plotyy(samples,x,samples,y);
xlabel("samples");
ylabel(ax(1),"x");
ylabel(ax(2),"y");
