function index=finddex(i,N)
if i==1
    index=[N,2];
elseif i==N
    index=[1,N-1];
else
    index=[i-1,i+1];
end
% temp=1000*rand();
% temp=round(temp*10000);
% index=[index,mod(temp,N)+1];