clc
clear all
a=0.9;
No=25;
n=-100:1:100;
omega_x=-1*pi:0.01*pi:1*pi;

for ii=1:length(n)
    if(n(ii)<-No)
        x_n(ii)=0;
    elseif(n(ii)>=-No && n(ii)<=No)
        x_n(ii)=1;
    else
        x_n(ii)=0;
    end
end
subplot(3,1,1),stem(n, x_n)


