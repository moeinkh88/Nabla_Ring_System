clc;clear all

clc
global D
global N

D=.5;N=3;
%[T,Y]=ode45(@NetSystem,0:0.01:400,rand(1,N*3));
%figure;plot(T,Y(:,1:3:end))
%z(1:2:end)=0.001%00
%z(1:2:end)=.0001*rand
%z(1:3:end)=0%00rand(N*3,1)
%rand(N*3,1)
%z=zeros(3*N,1);
%numel(z);
z=-9*rand(N*5,1);

%z =[ -2.4842,-6.1173,-5.8959,-1.4635,-1.0710,...
   % -4.4853,-8.6377,-3.0635,-5.2674,-2.0143,...
   % -6.7614,-2.2959,-4.5536,-6.2917,-8.0181]';
 %z =[ -5.1104,-0.6827,-0.4856,-4.7772,-7.0125,-8.4061,-1.1692,-5.1194, -4.2245,-0.1071,-3.0341,-1.4596,-7.1486,-2.8009,-4.7568,-1.4908,-5.4178,-2.3667,-5.8867,-6.2029,-6.7334,-4.0549,-0.7544,-2.0608]'
%[T, Z]=NetSystem(1500,z)
 


[T, Z] = fde12(1,@NetSystem,0,150,z,0.1);
Z
Y=Z';

%Pos = [300 339 590 357]; set(0, 'DefaultFigurePosition', Pos);
% display(z)

%% plot 2D

Y;

plot(T,Y(:,1:3:end),'LineWidth', 2);
xlabel('Time'); 
yl = ylabel('$X_1$');
leg = legend('$x_{11}$','$x_{12}$','$x_{13}$','$x_{14}$','$x_{15}$', ...
    'Location','southeast', 'NumColumns',2);
set([leg, yl],'Interpreter','latex');
% axis([0 40 -9 1])
set(gca,'FontSize',15)
grid on










