clc
clear all
K=16;
N=16;
for ii=1:N
 if(ii==1)
 x(ii)=1;
 else
 x(ii)=0;
 end
end
subplot(2,1,1),stem(x);
for ii=1:K
 for iii=1:N
 expo_x(ii,iii)=exp(-1j*((2*pi)/N)*(ii-1)*(iii-1));
 end
end
X=expo_x*x';
subplot(2,1,2),stem(X);
