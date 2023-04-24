clear all;
close all;
clc;

p=1000;
r=10;
t=5;
si=(p*r*t)/100;
amt=p+si;

n=2;

ci = p*((1+(r/n))^(t*n));
fprintf("%d\n", ci);