clc
clear all

a=0.9;
n=-5:0.15:5;
omega_x=-6*pi:0.01*pi:6*pi;

for ii=1:length(n)
    if n(ii) == 0
        x_n(ii)=1;
    else
        x_n(ii)=sin(pi*n(ii))/(pi*n(ii));
    end
end

subplot(3,1,1)
stem(n, x_n)
xlabel('\it{n}')
ylabel('{\itx}({\itn})')

for jj=1:length(omega_x)
    for ii=1:length(n)
        expo_x(jj,ii)=exp(-1j*omega_x(jj)*n(ii));
    end
    F_omega(jj)=sum(x_n.*expo_x(jj,:));

end

for ii=1:length(omega_x)


   if(omega_x(ii)<-pi/8)
         F_omega_theo_mag(ii)=0;
     elseif((omega_x(ii)>=-pi/8)&&(omega_x(ii)<=pi/8))
         F_omega_theo_mag(ii)=6;
     else
         F_omega_theo_mag(ii)=0;
     end
        

end

subplot(3,1,2)
plot(omega_x/pi, abs(F_omega), omega_x/pi, abs(F_omega_theo_mag))
xlabel('\omega/\pi')
ylabel('|F(\omega)|')

angle_F_omega=angle(F_omega);

subplot(3,1,3)
plot(omega_x/pi,angle_F_omega)
xlabel('\omega/\pi')
ylabel('\angle F(\omega)')
