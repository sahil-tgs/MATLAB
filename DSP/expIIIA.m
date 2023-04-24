close all;
clear all;
clc
syms n real
x1=0.5.^n
disp('(a) z transform of "0.5^n is')
x1=ztrans(x1)
x2=1+(n)*(0.4.^(n-1))
disp('(b) z transform of "1+n.(0.4).^(n-1) is')
x2=ztrans(x2)
x3=3*(4^n)- 5*(3^n)
disp('(b) z transform of "result = "')
x3= ztrans(x3)
