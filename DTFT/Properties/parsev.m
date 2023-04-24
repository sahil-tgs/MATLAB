
clear all
clc
close all

n=-100:1:100;
step_size=0.001*pi;
omega_x=-pi:step_size:pi;

for ii=1:length(n)
    if(n(ii)==0)
        x_n(ii)=1;
    else
        x_n(ii)=0;
    end
end
subplot(2,1,1), stem(n, abs(x_n))
[energy_sqn] = code_4_energy_comp...
(x_n);


for jj=1:length(omega_x)
    for ii=1:length(n)
        expo_x(jj,ii)=exp(-1j*omega_x(jj)...
            *n(ii));
    end
    F_omega(1,jj)=sum(x_n.*expo_x(jj,:));
end

subplot(2,1,2), plot(omega_x/pi, abs(F_omega))
[enery_in_fr] = energy_in_fr_domain...
    (F_omega,step_size);

[enery_in_fr, energy_sqn]