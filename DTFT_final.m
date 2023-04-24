clc
close all
clear all
a=0.9;
n=-100:1:100;
omega_x=-1*pi:0.01*pi:1*pi;

for ii=1:length(n)
    if(n(ii)<0)
        x_n(ii)=0;
    else
        x_n(ii)=a^n(ii);
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
    F_omega_theo_mag(ii)=1/sqrt(1+a^2-...
        2*a*cos(omega_x(ii)));
end

subplot(3,1,2),plot(omega_x/pi, abs(F_omega),...
   omega_x/pi, abs(F_omega_theo_mag), '--r' )

subplot(3,1,3),plot(omega_x/pi, angle_F_omega)




        