clc
clear all
step_size=0.01;
t=-5:step_size:5;
step_size_for_omega=0.01*pi;
omega_x=-2*pi*50:step_size_for_omega:50*2*pi;
for ii=1:1:length(t)
    if(t(ii)<-1.5)
        x_t(ii)=0;
    elseif(t(ii)>=-1.5 && t(ii)<=1.5)
        x_t(ii)=3;
    else
        x_t(ii)=0;
    end
end
for ii=1:(length(omega_x))
    complex_expo(ii,:)=exp(-1j*omega_x(ii).*t);
end
for kk=1:length(omega_x)
    temp=x_t.*complex_expo(kk,:);
    F_x_t(kk)=integration_x(temp, step_size );
end
for kk=1:length(omega_x)   
    if(omega_x(kk)==0)
        theorticiacl(kk)=(9);
    else
        theorticiacl(kk)=(9*sin(omega_x(kk))/omega_x(kk));
    end
end
subplot(2,1,1), plot(t, (x_t))
subplot(2,1,2), plot(omega_x, (F_x_t),omega_x, theorticiacl, '--r');
% subplot(2,1,2), plot(omega_x, (F_x_t));
energy_of_pulse=integration_x(abs(x_t).^2,step_size); 
energy_of_fourier_transform=(1/(2*pi))*(integration_x(abs(F_x_t).^2,step_size_for_omega));
[energy_of_pulse, energy_of_fourier_transform]