clear all;
close all;
clc;

step_size=0.01;
t=-100:step_size:100;
%size(t)

for ii=1:1:length(t)
    if(t(ii)<0)
        u(ii)=0;
    else
        u(ii)=1;
    end
end



a=input("Amplitude=");
step=input("Step size=");
t=-100:step:100;
for x=1:1:length(t)
    if(t(ii)<0)
        u(ii)=-1;
    else
        u(ii)=a;
    end
end
plot(t, u)


%plot(t, u)