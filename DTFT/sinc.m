clc
clear all
close all 

a= 1/8;
n=-100:1:100;
omega_x=-4*pi:0.001*pi:4*pi;

for ii=1:length(n)
    if(n(ii)==0)
        x_n(ii)=a;
    else
        x_n(ii)=a*(sin(n(ii)*pi*a)...
            /((pi*n(ii))*a));
    end
end
subplot(3,1,1),stem(n, x_n)

xlabel('\it{n}')
ylabel('{\itx}({\itn})')


for jj=1:length(omega_x)
    for ii=1:length(n)
        expo_x(jj,ii)=exp(-1j*omega_x(jj)...
            *n(ii));
    end
    F_omega(1,jj)=sum(x_n.*expo_x(jj,:));
end

angle_F_omega=atan(imag(F_omega)./real(F_omega));

for ii=1:length(omega_x)


   if(omega_x(ii)<-pi*a)
         F_omega_theo_mag(ii)=0;
     elseif((omega_x(ii)>=-pi*a)&&(omega_x(ii)<=pi*a))
         F_omega_theo_mag(ii)=1;
     else
         F_omega_theo_mag(ii)=0;
     end
        

end

subplot(3,1,2),plot(omega_x/pi, abs(F_omega),omega_x/pi, abs(F_omega_theo_mag), '--r' )
% %    omega_x/pi, abs(F_omega_theo_mag), '--r' )
xlabel('{\it\omega} (\times {\it\pi})')
ylabel('|{\itX}({\it\omega})|')

subplot(3,1,3),plot(omega_x/pi, angle_F_omega)
xlabel('{\it\omega} (\times {\it\pi})')
ylabel('{\angle\itX}({\it\omega})')