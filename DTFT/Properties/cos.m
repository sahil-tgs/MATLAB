clc
clear all
close all

a=0.9;
Mo=12;
No=48;
n=-100:1:100;
omega_x=-1*pi:0.0005*pi:1*pi;

for ii=1:length(n)
    x_n(ii)=2*cos((25/150)*pi*n(ii))-...
        0.25*cos((15/150)*pi*n(ii))...
        +0.8*cos((56/128)*pi*n(ii));
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
    if(omega_x(ii)<=-(25/150)*pi)
        index1=ii;
    elseif(omega_x(ii)<=-(15/150)*pi)
        index2=ii;
    elseif(omega_x(ii)<=-(56/128)*pi)
        index3=ii;
    elseif(omega_x(ii)<=(25/150)*pi)
        index4=ii;
    elseif(omega_x(ii)<=(15/150)*pi)
        index5=ii;
    elseif(omega_x(ii)<=(56/128)*pi)
        index6=ii;
    end
end
% F_omega_theo_mag=zeros(1, length(omega_x));
% F_omega_theo_mag(1, index1)=2*pi/(0.01*pi);
% F_omega_theo_mag(1, index4)=2*pi/(0.01*pi);
% 
% F_omega_theo_mag(1, index2)=0.25*pi/(0.01*pi);
% F_omega_theo_mag(1, index5)=0.25*pi/(0.01*pi);
% 
% F_omega_theo_mag(1, index3)=0.8*pi/(0.01*pi);
% F_omega_theo_mag(1, index4)=0.8*pi/(0.01*pi);


subplot(3,1,2),plot(omega_x/pi, abs(F_omega))
%    omega_x/pi, abs(F_omega_theo_mag), '--r' )

subplot(3,1,3),plot(omega_x/pi, angle_F_omega)
        