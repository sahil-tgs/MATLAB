clear all;
close all;
clc;

v = [1 2 5 6 77];

x=v;
x=v(:);

x=v(2:4);

%A=[1 2 3; 4 5 6; 7 8 9]
A=floor(3*rand(3,3));
x=A(:,2);
y=A(:,2:3) %all rows of 2nd and 3rd colm
x=A(3,:);

b=A(2:3,2:3)

z=zeros(4,5)
%z(3:4,:)=1   or
z(3:4,:)=ones(2,5)

q=zeros(100)
q(40:60,40:60)=1

surf(q)
