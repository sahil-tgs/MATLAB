clc
clear all
a=0.08;
n=-20:1:20;
m=10;
omega_x=-1*pi:0.01*pi:1*pi;

for ii=1:length(omega_x)
    if(omega_x(ii)<0)
        x(ii)=a^(-omega_x(ii));
    else
        x(ii)=a^(omega_x(ii));
    end
end

subplot(3,1,1),stem(omega_x/pi, x)
xlabel('\it{\omega\times\pi}')
ylabel('{\itx}({\it\omega})')

for jj=1:length(n)
    for ii=1:length(omega_x)
        expo_x(jj,ii)=exp(1j*n(jj)...
            *omega_x(ii));
    end
    F_n(1,jj)=(1/(2*pi))*sum(x.*expo_x(jj,:));
end

angle_F=atan(imag(F_n)./real(F_n));


subplot(3,1,2),plot(n, abs(F_n));
xlabel('\it{n}')
ylabel('{\itx}({\itn})')

subplot(3,1,3),plot(n, angle_F)
xlabel('\it{n}')
ylabel('\angle(x(n))')
        





