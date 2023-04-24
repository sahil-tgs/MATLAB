
clear all
clc

n=-100:1:100;
omega=-6*pi:0.01*pi:6*pi;

%=====impulse function=====
for ii=1:length(n)
    if(n(ii)==0)
        x_n(ii)=1;
    else
        x_n(ii)=0;
    end
end

%==========================

%plot 
subplot(2,1,1)

stem(n,x_n)

%==========================

for jj=1:length(omega)
    for ii=1:length(n)
        expo_n(jj,ii)=exp(-j*omega(jj)*n(ii));
    end
    F_omega(1,jj)=sum(x_n.*expo_n(jj,:));
end

subplot(2,1,2),plot(omega, abs(F_omega))