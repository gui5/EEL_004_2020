% Aula1EulerFomula.m
% Euler formula

clear
clc
%close all
cla

%% Parte 1
% [cos(k) sin(k)] estao no cirulo unitario

% qualquer angulo k
k = 90*pi/180;

fig1 = figure(1);clf;

% Create axes
axes1 = axes('Parent',fig1);
hold(axes1,'on');

h1 = plot( cos(k),sin(k) ,'ko','markerfacecolor','r','markersize',15);

set(gca,'xlim',[-1.5 1.5],'ylim',[-1.5 1.5])
grid on, hold on, axis square
plot(get(gca,'xlim'),[0 0],'k','linew',2)
plot([0 0],get(gca,'ylim'),'k','linew',2)
set(axes1,'FontSize',16);

% desenhar circulo unitario
x = linspace(-pi,pi,100);
h = plot(cos(x),sin(x),'LineWidth',2);
set(h,'color',[1 1 1]*.7) % light gray

% somente em matlab
uistack(h1,'top'); % coloca o cirulo vermelho na frente

% Formula de euler
% desenhar linha da origem até o circulo unitario

euler = exp( 1i*k );
h = polar([0 angle(euler)],[0 1],'r');
set(h,'linewidth',2)

%% Parte 2
% [r*cos(k) r*sin(k)] estao no cirulo de raio r

% qualquer angulo k
k = 60*pi/180;
% raio
r = 1.2;

h2 = plot( r*cos(k),r*sin(k) ,'ko','markerfacecolor','b','markersize',15);

set(gca,'xlim',[-1.5 1.5],'ylim',[-1.5 1.5])
grid on, hold on, axis square
plot(get(gca,'xlim'),[0 0],'k','linew',2)
plot([0 0],get(gca,'ylim'),'k','linew',2)
set(axes1,'FontSize',16);

% desenhar circulo de raio r
x = linspace(-pi,pi,100);
h = plot(r*cos(x),r*sin(x),'LineWidth',2);
set(h,'color',[1 1 1]*.7) % light gray

% somente em matlab
uistack(h2,'top'); % coloca o cirulo vermelho na frente

% Formula de euler
% desenhar linha da origem até o circulo unitario

euler = r*exp( 1i*k );
h = polar([0 angle(euler)],[0 r],'b');
set(h,'linewidth',2)

