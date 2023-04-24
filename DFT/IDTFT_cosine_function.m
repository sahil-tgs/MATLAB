clc
clear all
a=0.9;
n=-20:1:20;
m=10;
l=35;
k=12;
omega_x=-1*pi:0.01*pi:1*pi;

for ii=1:length(omega_x)
    x(ii)=cos((l/k)*pi*omega_x(ii));
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

for ii=1:length(n)
    if(n(ii)<=-(l/k)*pi)
        index1=ii;
    elseif(n(ii)<=(l/k)*pi)
        index2=ii;
    end
end
% F_theo_mag=zeros(1,length(omega_x));
% F_theo_mag(1,index1)=1/(0.02*pi);
% F_theo_mag(1,index2)=1/(0.01*pi);

subplot(3,1,2),plot(n, abs(F_n));
xlabel('\it{n}')
ylabel('{\itx}({\itn})')
%    n, abs(F_theo_mag), '--r' )

subplot(3,1,3),plot(n, angle_F)
xlabel('\it{n}')
ylabel('\angle(x(n))')
        





