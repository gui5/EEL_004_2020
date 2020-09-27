
function [M] = getMusic(Fs,n)

%Fs =44100;
Ts = 1/Fs;
%n = 0:((Fs*3))-1;

%Notas
fC  = 264.0;
fE  = 332.6;
fG  = 395.5;
fD  = 296.2;
fB  = 498.4;
fF  = 352.4;
fA  = 444.0;

%Equacoes
C  = 2*cos(2*pi*fC*n*Ts) + 2*cos(2*pi*fE*n*Ts) + cos(2*pi*fG*n*Ts);
G  = 3*cos(2*pi*fG*n*Ts) + 2*cos(2*pi*fD*n*Ts) + cos(2*pi*fB*n*Ts);
Dm = 2*cos(2*pi*fD*n*Ts) + cos(2*pi*fF*n*Ts)   + cos(2*pi*fA*n*Ts);
F  = 3*cos(2*pi*fF*n*Ts) + 2*cos(2*pi*fC*n*Ts) + cos(2*pi*fA*n*Ts);

%musica
TimeDm = length(n)*0.93;
TimeF = length(n)*0.07;
F2 = [F(1,1:length(n)*0.3),F(1,1:TimeF)];
L1 = C;
L2 = G;
L3 = [Dm(1,1:TimeDm),F2];

%sound
M = [L1,L2,L3,L1,L2,L3];
%plot_fft(M,Fs,length(M))
%soundsc(M,Fs,24);
endfunction
