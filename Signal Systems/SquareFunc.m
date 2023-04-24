clear all;
close all;
clc;

t=-100:1:100;

for ii=1:1:length(t)
    if(t(ii)<-10)
        g(ii)=0;
    elseif(t(ii)>10)
        g(ii)=0
    else
        g(ii)=1
    end
end
plot(t, g)