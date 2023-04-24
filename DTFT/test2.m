
clc
clear all
a=0.9;
No=25;
n=-100:1:100;
omega_x=-4*pi:0.001*pi:4*pi;

for ii=1:length(n)
    if(n(ii)==0)
        x_n(ii)=1/8;
    else
        x_n(ii)=(1/8)*(sin(n(ii)*pi/8)...
            /((pi*n(ii))/8));
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

%for ii=1:length(omega_x)
    % F_omega_theo_mag(ii)=(1)/...
     %    sqrt((1-a*cos(omega_x(ii)))^2+(a*sin(omega_x(ii))^2));

 %    F_omega_theo_mag(ii)=(1-a^(-2))/(1-(2*a^(-1)*cos(omega_x(ii)))...
  %      +a^(-2));
 %    if(omega_x(ii)<-pi/2)
 %       F_omega_theo_mag(ii)=0;
 %    elseif((omega_x(ii)>=-pi/2)&&(omega_x(ii)<=pi/2))
 %        F_omega_theo_mag(ii)=1;
  %   else
  %       F_omega_theo_mag(ii)=0;
   %  end
        

%end

F_omega_theo_mag(ii) = (sin((w-k2pi/M))/((w-k2pi/M)));

subplot(3,1,2),plot(omega_x/pi, abs(F_omega), omega_x/pi, abs(F_omega_theo_mag), '--r' )
xlabel('{\it\omega} (\times {\it\pi})')
ylabel('|{\itX}({\it\omega})|')

subplot(3,1,3),plot(omega_x/pi, angle_F_omega)
xlabel('{\it\omega} (\times {\it\pi})')
ylabel('{\angle\itX}({\it\omega})')
        