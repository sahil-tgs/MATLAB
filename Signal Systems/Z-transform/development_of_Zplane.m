clear all;
clc
x_axis=-5:1:5;
y_axis=-5:1:5;
th=0:pi/50:2*pi;
x=0;
y=0;
radi_unit_cir=1;
xunit=radi_unit_cir*cos(th)+x;
yunit=radi_unit_cir*sin(th)+y;

plot(x_axis,y_axis, 'linestyle','none');
xlabel('real axis')
ylabel('imag axis')
hold on
h=plot(xunit,yunit,'r');
plot([-5 5],[0 0],'b');
plot([0 0],[-5 5],'k');