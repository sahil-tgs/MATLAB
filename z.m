clear all
clc
x_axis=-5:1:5;
y_axis=-5:1:5;

th = 0:pi/50:2*pi;
x=0;
y=0;
radi_unit_cir=1;

xunit = radi_unit_cir* cos(th) + x;
yunit = radi_unit_cir* sin(th) + y;

plot(x_axis, y_axis, 'LineStyle','none')
xlabel('Real axis') 
ylabel('Imaginary axis')
hold on
h = plot(xunit, yunit, 'r');
plot([-5 5],[0 0], 'b');
plot([0 0],[-5 5], 'k');
hold off

coff_TF=[1 5 6];
roots_TF=roots(coff_TF);

for ii=1:length(roots_TF)
    re_x(ii)=real(roots_TF(ii));
 
    im_y(ii)=imag(roots_TF(ii));
  
end

for i=1:length(re_x)
        x_position(i)=re_x(i);
    
end

for i=1:length(im_y)
        y_position(i)=im_y(i);
    
end


hold on
plot(x_position, y_position, 'o')
hold off
% 
% [b,a] = ellip(4,.5,20,.6);
% Hq = dfilt.df2(b, a);
% Hq.arithmetic = 'fixed';
% zplane(Hq);