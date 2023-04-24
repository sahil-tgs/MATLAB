clc
clear all
close all

stepsize_x=0.01;
t=0:stepsize_x:1;
T_o=t(1,end)-t(1,1);
k=-100:1:100;

for ii=1:length(t)
    x_t(ii)=sin(t(ii));
end

subplot(4,1,1), plot(t, x_t);

for ii=1:length(k)
    temp=x_t.*exp((-1j*2*pi*k(ii)/T_o).*t);
    a_k(ii)=(1/T_o)*integration_x(temp, stepsize_x);
end
subplot(4,1,2), stem(k, abs(a_k));

%reconstruction of the signal
composit_signal=zeros(1, length(t));
for ii=1:length(k)
    sin_harmonics(ii,:)=a_k(ii)*exp((1j*2*pi*k(ii)/T_o).*t);
    hold on
  
    
    composit_signal(ii+1,:)=composit_signal(ii, :) + sin_harmonics(ii,:);
    
    
end
subplot(4,1,3),plot(t, (sin_harmonics));

subplot(4,1,4),plot(t, (composit_signal(end,:)), t, x_t, '--r'  )
