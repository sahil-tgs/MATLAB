clc                     
clear all;              
close all;              

n=-100:1:100;           
step_size=0.01*pi;     
omega_x=-pi:0.01*pi:pi; 
omega_x(1)=[];          

for ii=1:length(omega_x)
    x_omega(ii)=(1)/(1-0.5*exp(-1j*omega_x(ii))); 
end

subplot(2,1,1)          
plot(omega_x/pi, abs(x_omega)) 
for ii=1:length(n)
    temp_x=x_omega.*exp(1j*omega_x*n(ii)); 
    x_n(ii)=(step_size/2)*(temp_x(1)+2*sum(temp_x(2:end-1))+temp_x(end)); 
end

subplot(2,1,2)          
stem(n, abs(x_n))
