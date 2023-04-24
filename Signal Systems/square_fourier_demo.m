clc
clear all

close all
stepsize_x=0.001;
t=-1:stepsize_x:1;
T_o=t(1,end)-t(1,1);
k=-50:1:50;

for ii=1:length(t)
    if(t(ii)<-0.5)
        x_t(ii)=0;
    elseif(t(ii)>=-0.5 && t(ii)<=0.5)
        x_t(ii)=1;
    else
        x_t(ii)=0;
    end
end
subplot(4,1,1), plot(t, x_t);

for ii=1:length(k)
    temp=x_t.*exp((-1j*2*pi*k(ii)/T_o).*t);
    a_k(ii)=(1/T_o)*integration_x(temp, stepsize_x);
end
subplot(4,1,2), stem(k, abs(a_k));

%reconstruction of the signal
composit_signal=zeros(1, length(t));
half_point=floor(length(k)/2);
mid_point=half_point+1;
for ii=1:1:length(k)
%     if (ii==1)
%         sin_harmonics(ii,:)=a_k(mid_point)*exp((1j*2*pi*k(mid_point)/T_o).*t);
%         hold on 
%         subplot(4,1,3),plot(t, (sin_harmonics));
%         hold off
%         composit_signal(ii+1,:)=composit_signal(ii, :) + sin_harmonics(ii,:);
%     else
%         sin_harmonics(ii,:)=a_k(mid_point-ii)*exp((1j*2*pi*k(mid_point-ii)/T_o).*t)...
%             +a_k(mid_point+ii)*exp((1j*2*pi*k(mid_point+ii)/T_o).*t);  
%         hold on 
%         subplot(4,1,3),plot(t, (sin_harmonics));
%         hold off
%         composit_signal(ii+1,:)=composit_signal(ii, :) + sin_harmonics(ii,:);  
%     end

        sin_harmonics(ii,:)=a_k(ii)*exp((1j*2*pi*k(ii)/T_o).*t);
        hold on 
        subplot(4,1,3),plot(t, (sin_harmonics));
        hold off
        composit_signal(ii+1,:)=composit_signal(ii, :) + sin_harmonics(ii,:);
%     pause

end
subplot(4,1,4),plot(t, (composit_signal(end,:)), t, x_t, '--r'  )
