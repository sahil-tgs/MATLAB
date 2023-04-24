clc
clear all;
close all;
n=1:95;
r=2;
omega_x=1:2*pi;

for ii=1:length(n)
   g(ii)=2*cos(pi*.333*(n(ii)))+1.8*cos(pi*.666*(n(ii)))+.8*cos(pi*.11111*(n(ii)));
end

h=[1 -1 1];

n1=length(g);
n2=length(h);
m=n1+n2-1;

h1=[h zeros(1,n2)];
g1=[g zeros(1,n1)];
y=zeros(1,m);

for i=1:m
    y(i)=0;
    for j=1:n2
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


