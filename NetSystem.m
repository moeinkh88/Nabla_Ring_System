function f=NetSystem(t,Y)
p=1;
global D
global N
b=.15;
a1=3;
a2=3;
k=0.15;
f=zeros(5*N,1);
r=0.001;

x1=Y(1:5:end);
y1=Y(2:5:end);
x2=Y(3:5:end);
y2=Y(4:5:end);
q=Y(5:5:end);

for i=1:N
    index=finddex(i,N);
    ii=(i-1)*5+1
    f(ii)= (a1/(1+x1(i)^2)+y1(i)-k*(x1(i)-x2(i))*tanh(q(i))-x1(i))+(D/2)*sum(x1(index)-x1(i));
    f(ii+1)=(-b*(x1(i)-r));
    f(ii+2)=(a2/(1+x2(i)^2)+y2(i)+k*(x1(i)-x2(i))*tanh(q(i))-x2(i));
    f(ii+3)=(-b*(x2(i)-r));
    f(ii+4)=(-0.1*q(i)^3-0.1*(x1(i)-x2(i))+0.1*q(i));
    %f(ii)= x(i)-0.1*tanh(x(i))+2.8*tanh(y(i))+(x(i)-y(i))*z(i)*b+(D/2)*sum(x(index)-x(i));
    %f(ii+1)= -y(i)-3*tanh(x(i))+4*tanh(y(i))-(x(i)-y(i))*z(i)*b;    
    %f(ii+2)=x(i)-y(i);;
    %+(D/2)*sum(y(index)-y(i));
    
    
end

    