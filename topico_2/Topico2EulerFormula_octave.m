% Aula1EulerFomula.m
%% Euler formula

%% [cos(k) sin(k)] estao no cirulo unitario

% qualquer angulo k
k = 60*pi/180;

fig1 = figure(1);clf;

% Create axes
axes1 = axes('Parent',fig1);
hold(axes1,'on');

h1 = plot( cos(k),sin(k) ,'ko','markerfacecolor','r','markersize',15);

% make plot look nicer
set(gca,'xlim',[-1.5 1.5],'ylim',[-1.5 1.5])
grid on, hold on, axis square
plot(get(gca,'xlim'),[0 0],'k','linew',2)
plot([0 0],get(gca,'ylim'),'k','linew',2)
set(axes1,'FontSize',16);

% also draw a unit circle
x = linspace(-pi,pi,100);
h = plot(cos(x),sin(x),'LineWidth',2);
set(h,'color',[1 1 1]*.7) % light gray

%uistack(h1,'top'); % put red circle on top 