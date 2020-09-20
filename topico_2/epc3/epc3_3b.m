clc;
clear;

  
Fs =44100;
Ts = 1/Fs;
n = 0:((Fs * 3)/2)-1; % 1,5s 

%Notas
fC  = 264.0;
fE  = 332.6;
fGs = 419.0;
fG  = 395.5;
fD  = 296.2;
fB  = 498.4;
fF  = 352.4;
fA  = 444.0;

%Equacoes
C  = 2*cos(2*pi*fC*n*Ts) + 2*cos(2*pi*fE*n*Ts) + cos(2*pi*fGs*n*Ts);
G  = 3*cos(2*pi*fG*n*Ts) + 2*cos(2*pi*fD*n*Ts) + cos(2*pi*fB*n*Ts);
Dm = 2*cos(2*pi*fD*n*Ts) + cos(2*pi*fF*n*Ts)   + cos(2*pi*fA*n*Ts);
F  = 3*cos(2*pi*fF*n*Ts) + 2*cos(2*pi*fC*n*Ts) + cos(2*pi*fA*n*Ts);

%musica
L1 = [C; C];
L2 = [G; G];
L3 = [Dm; F];
L4 = L1;
L5 = L2;
L6 = L3;

%sound
soundsc(L1,Fs);
soundsc(L2,Fs);
soundsc(L3,Fs);
soundsc(L4,Fs);
soundsc(L5,Fs);
soundsc(L6,Fs);
