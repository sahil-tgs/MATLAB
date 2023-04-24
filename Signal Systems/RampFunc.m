close all;
clear all;
clc;


t=-100:1:100;
for ii=1:1:length(t)
    if(t(ii)<0)
        r(ii)=0;
    else
        r(ii)=t(ii);
    end
end
plot(t, r)