% tic;
clc
clear all
r=-1;b=0.001;
q1=0.95; 
% q2=0.8;
a1=3;
a2=3; 
k=0.9;

 x1(1)=-1.1;
 y1(1)=-3;
 x2(1)=-1;
 y2(1)=-3;
 q(1)=0.8;
dot=3;

g1=zeros(1,dot);
g1(1)=gamma(q1);

for i=1:dot
    g1(i+1)=g1(i)*((i-1+q1)/i);
end

for t=2:dot
   
    for j=2:t
        X1(j)=g1(t-j+1)*(a1/(1+x1(j-1)^2)+y1(j-1)-k*(x1(j-1)-x2(j-1))*tanh(q(j-1))-x1(j-1))
        Y1(j)=g1(t-j+1)*(-b*(x1(j-1)-r));
        X2(j)=g1(t-j+1)*(a2/(1+x2(j-1)^2)+y2(j-1)+k*(x1(j-1)-x2(j-1))*tanh(q(j-1))-x2(j-1));
        Y2(j)=g1(t-j+1)*(-b*(x2(j-1)-r));
        Q(j)=g1(t-j+1)*(-0.1*q(j-1)^3-0.1*(x1(j-1)-x2(j-1))+0.1*q(j-1));
       
    end
    
    x1(t)=x1(1)+(1/gamma(q1))*sum(X1);
    y1(t)=y1(1)+(1/gamma(q1))*sum(Y1);
    x2(t)=x2(1)+(1/gamma(q1))*sum(X2);
    y2(t)=y2(1)+(1/gamma(q1))*sum(Y2);
    q(t)=q(1)+(1/gamma(q1))*sum(Q);
    
end

figure
plot(x1,'g','linewidth',2)
xlabel('\itn')
ylabel('{\itx}_1(\itn)');
set(gca,'linewidth',1,'fontsize',16,'fontname','Times New Roman','fontWeight','bold');
%xlim([3000 8000])
hold on
% ylim([-3 -1])
% legend('{\itx}_2','{\itx}_1')
% toc;
