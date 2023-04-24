close all;
clear all
clc
syms z
num_coeff=[1 0.8 0.8]
disp('Roots of numerator polynomial are zeros')
zeros=roots(num_coeff)
den_coeff=[1 0 0.49]
disp('roots of denominator polynomial are poles')
poles=roots(den_coeff)
H=tf('z')
Ts=0.1
H=tf([num_coeff],[den_coeff],Ts)
zgrid on
pzmap (H)