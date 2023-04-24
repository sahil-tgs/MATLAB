clear all;
close all;
clc
prompt="enter the value of n";
N=input(prompt)
j=sqrt(-1)
xn=zeros(1,N)
jag="enterthe first value of sequence";
xn(1)=input(jag)
jag1="enter rthe second value of sequence"; 
xn(2)=input(jag1)
jag2="enter the third value of sequence";
xn(3)=input(jag2)
xk=zeros(1,N)
for k=0:1:N-1 %compute DFT
 for n=0:1:N-1
 xk(k+1)=xk(k+1)+xn(n+1)*exp(-j*2*pi*k*n/N)
 end
end
disp('The DFT sequence is');xk
disp('The magnitude sequence is');Magxk=abs(xk)
disp('The phase sequence is ');phasxk=angle(xk)
wk=0:1:N-1
subplot(2,1,1)
stem(wk,Magxk)
title('Magnitude Spectrum')
xlabel('k')
ylabel('Magxk')
subplot(2,1,2)
stem(wk,phasxk)
title('Phase spectrum')
xlabel('k')
ylabel('phasxk')