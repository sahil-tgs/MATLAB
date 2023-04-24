clc
clear all
close all

step_size=0.05;
t=-10:step_size:10;

sigma_x=-5:0.01:5;

step_size_for_omega=0.1*pi;
omega_x=-pi*(1/step_size):step_size_for_omega:...
    (1/step_size)*pi;


for ii=1:1:length(t)
    if(t(ii)<1)
        x_t(ii)=1;
    else
        x_t(ii)=0;
    end
end
subplot(2,1,1), plot(t, (x_t))
pause

for ii=1:(length(omega_x))
    complex_expo(ii,:)=exp(-1j*omega_x(ii).*t);  
    
end


for ii=1:length(sigma_x)
    for kk=1:length(omega_x)
        temp=(x_t.*exp(-sigma_x(ii).*t)).*complex_expo(kk,:);
        F_x_t(ii, kk)=integration_x(temp, step_size );
    end
end
 
     



[X,Y] = meshgrid(omega_x/pi, sigma_x);
subplot(2,1,2),surf(X, Y, 20*log10(abs(F_x_t)), 'edgecolor', 'none')
xlabel('Frequency in Hz'), ylabel('Sigma'), zlabel('20*log_{10}{\it x}({\it t})');