clear all;
close all;
clc;

t=-1;
if(t<=0)
    u=0;
else
    u=1;
end

fprintf("the value of u=%d for t=%d", u, t);


omega=2*pi;
t=0;
f=sin(omega*t)/t;
%if(f==NaN)
%isNaN(f)
    f=cos(omega*t)*omega;
%else
%    f;
%end
display(f);