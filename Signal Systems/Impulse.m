clear all;
close all;
clc;

t=-100:1:100;
for ii=1:1:length(t)
    if(t(ii)==0)
        delta(ii)=100;
    else
        delta(ii)=0;
    end
end
plot(t, delta)
