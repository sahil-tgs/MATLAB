close all;
clear all;
clc
x=[1 2 3 1] %Input Signal
nx=[0:3]
h=[1 2 1 -1] %Impulse Sequence
nh=[-1:2]
nyb=nx(1)+nh(1)
nye=nx(length(x))+nh(length(h))
ny=[nyb:nye]
y=xcorr(x,h) %Correlation output
subplot(3,1,1)
stem(x)
title('Input Sequence')
subplot(3,1,2)
stem(h)
title('Impulse Sequence')
subplot(3,1,3)
stem(y)
title('Correlation of two sequences')