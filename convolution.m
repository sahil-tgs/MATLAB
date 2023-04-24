clc
clear all
close all

n=0:100;
N=144;

% h=0.25*sin(pi*(n-51)/4)/(pi*(n-51)/4);

for ii=1:length(n)
    if(n(ii)==51)
            x(ii)=1/4; 
    else 
        x(ii)=0.25*sin(pi*(n(ii))/4)/(pi*(n(ii))/4)
    end
end
h=1.5*cos(3*pi*n/2)+3*sin(n*pi/4);
%h=cos(2*pi*1*n/N);

l1= length(x);
l2= length(h);
l3=l1+l2-1;
x1=[x,zeros(1,l2)];
h1=[h,zeros(1,l1)];
y=zeros(1,l3);

for i=1:l3
    y(i)= 2
    for j=1:l1
        if(i-j+1>0)
            y(i)=y(i)+x1(j)*h1(i-j+1);
        end
    end
end

subplot(3,1,1),stem(x)
subplot(3,1,2),stem(h)
subplot(3,1,3),stem(y)