close all;
clear all;
x=[1 0 1 2 -1 3 2]
N1=length(x)
n=0:1:N1-1
h=[1 1 2 2 1]
N2=length(h)
n1=0:1:N2-1
subplot(2,2,1)
stem(n,x)
xlabel('---n')
ylabel('x(n)')
title('Input sequence')
subplot(2,2,2)
stem(n1,h)
xlabel('---n1')
ylabel('h(n)')
title('impulse sequence')
y=conv(x,h)
n2=0:1:N1+N2-2
subplot(2,1,2)
stem(n2,y)
xlabel('---n2')
ylabel('y(n)')
title('Convolution output')
