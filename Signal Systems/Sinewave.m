clear all;
close all;
clc;

t=10:0.0001:10;
for ii=1:1:length(t)
    f(ii)=1*sin(100*2*pi*t(ii));
end
plot(t(1000:10050), f(1000:10050))