clc
clear all
a=0.9;
n=-100:1:100;
omega_x=-1*pi:0.01*pi:1*pi;

for ii=1:length(n)
    if(n(ii)<0)
        x_n(ii)=a^(-n(ii));
    else
        x_n(ii)=a^n(ii);
    end
end

subplot(3,1,1),stem(n, x_n)
xlabel('\it{n}')
ylabel('{\itx}({\itn})')

for jj=1:length(omega_x)
    for ii=1:length(n)
        expo_x(jj,ii)=exp(-1j*omega_x(jj)*n(ii));
    end
    F_omega(1,jj)=sum(x_n.*expo_x(jj,:));
end

angle_F_omega=atan(imag(F_omega)./real(F_omega));

for ii=1:length(omega_x)
    F_omega_theo_mag(ii)=(1-a^-2)/(1-2*(a^(-1))*cos(omega_x(ii))+(a^(-2)));
end
subplot(3,1,2),plot(omega_x/pi, abs(F_omega),omega_x/pi, abs(F_omega_theo_mag), '--r' )
xlabel('\omega')
ylabel('|F(\omega)|')
subplot(3,1,3),plot(omega_x/pi,angle_F_omega)
xlabel('\omega')
ylabel('\angle|F(\omega)|')


function [F_omega] = dtft(x_n)
% Calculate DTFT of input signal x_n using nested loop and manual summation formula

% Define frequency range
omega_x = linspace(-pi, pi, 1024);

% Initialize output array
F_omega = zeros(1, length(omega_x));

% Calculate DTFT using nested loop and manual summation formula
for jj=1:length(omega_x)
    F_omega(jj) = 0;
    for ii=1:length(x_n)
        F_omega(jj) = F_omega(jj) + x_n(ii) * exp(-1j*omega_x(jj)*(ii-1));
    end
end

end




        


