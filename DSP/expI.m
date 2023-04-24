n=-20:1:20

x1=1
x2=0
x=x1.*(n==0)+x2.*(n~=0) 
subplot(2,2,1)
stem(n,x)
xlabel('n')
ylabel('x(n)')
title('Unit Impulse signal')

x1=1
x2=0
x=x1.*(n>=0)+x2.*(n<0) 
subplot(2,2,2)
stem(n,x)
xlabel('n')
ylabel('x(n)')
title('Unit step signal')

x1=n
x2=0
x=x1.*(n>=0)+x2.*(n<0)
subplot(2,2,3)
stem(n,x)
xlabel('n')
ylabel('x(n)')
title('Unit ramp signal')

A=0.95
x=A.^n
subplot(2,2,4)
stem(n,x)
xlabel('n')
ylabel('x(n)')
title('Exponential signal')
