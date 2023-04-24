clc
close all
clear all
n=-100:1:100;
omega_x=-6*pi:0.01*pi:6*pi;

for ii=1:length(n)
    if(n(ii)==0)
        x_n(ii)=1;
    else
        x_n(ii)=0;
    end
end

subplot(2,1,1),stem(n, x_n)

for jj=1:length(omega_x)
    for ii=1:length(n)
        expo_x(jj,ii)=exp(-1j*omega_x(jj)...
            *n(ii));
    end
    F_omega(1,jj)=sum(x_n.*expo_x(jj,:));
end
subplot(2,1,2),plot(omega_x/pi, abs(F_omega))

angle_F_omega = atan(img(F_omega)./real(F_omega))

for ii
