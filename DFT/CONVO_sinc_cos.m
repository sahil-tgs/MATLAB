clc
clear all;
close all;
n=1:200;
r=2;

for ii=1:length(n)
    if(n(ii)==100)
        g(ii)=1/4;
    else
        g(ii)=.25*sin(pi*.25*(n(ii)-100))/(pi*.25*(n(ii)-100));
    end
end

for i=1:length(n)
h(i)=2*cos(2*pi*r*n(i)/144);
end
n1=length(g);
n2=length(h);
m=n1+n2-1;

h1=[h zeros(1,n2)];
g1=[g zeros(1,n1)];
y=zeros(1,m);

for i=1:m
    y(i)=0;
    for j=1:n1
        if(i-j+1>0)
            y(i)=y(i)+h1(j)*g1(i-j+1);
        end
    end
end
subplot(3,1,1),stem(g)
xlabel('\it{n}')
ylabel('{\itx}({\itn})')
subplot(3,1,2),stem(h)
xlabel('\it{n}')
ylabel('{\ity}({\itn})')
subplot(3,1,3),stem(y)
xlabel('\it{n}')
ylabel('{\itx}({\itn})*{\ity}({\itn})')





