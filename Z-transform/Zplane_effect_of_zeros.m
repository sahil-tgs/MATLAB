clear all
clc

x_axis=-2:1:2;
y_axis=-2:1:2;

z_x=1.5;
z_y=0;

p_x=0;
p_y=0;

th = 0:pi/100:2*pi;
H=zeros(1,length(th));
omega=th;
x=0;
y=0;
radi_unit_cir=1;

xunit = radi_unit_cir* cos(th) + x;
yunit = radi_unit_cir* sin(th) + y;

subplot(2,2,1), plot(x_axis, y_axis, 'LineStyle','none');
xlabel('Real axis') 
ylabel('Imaginary axis')
hold on
plot( p_x, p_y, '-x', 'MarkerSize', 15, 'MarkerEdgeColor', 'k');
plot( z_x, z_y, 'o', 'MarkerSize', 15);
plot(xunit, yunit, 'r', 'linewidth', 2);
plot([-2 2],[0 0], 'b', 'linewidth', 2);
plot([0 0],[-2 2], 'k', 'linewidth', 2);
hold off
pause


for ii=1:length(th)
    x(ii)=cos(th(ii));
    y(ii)=sin(th(ii));
   
    subplot(2,2,2), plot(x_axis, y_axis, 'LineStyle','none');
     
    xlabel('Real axis') 
    ylabel('Imaginary axis')
    hold on
    h = plot(xunit, yunit, 'r', 'linewidth', 2);
    plot([-2 2],[0 0], 'b', 'linewidth', 2);
    plot([0 0],[-2 2], 'k', 'linewidth', 2);
    plot( p_x, p_y, '-x', 'MarkerSize', 6);
    plot( z_x, z_y, '-o', 'MarkerSize', 6);
    plot( x(ii), y(ii), 's', 'MarkerSize', 6);
    
    
    hold off
     H(ii)=(1-(z_x+1j*z_y)*exp(-1j*th(ii)));
     
    subplot(2,2,3), stem(omega/pi, abs(H));
    ylabel('|\it{H}(\it{e^{j\omega}})|') 
    xlabel('{\it\omega}')
    
        
    subplot(2,2,4), plot(x_axis, y_axis, 'LineStyle','none');
     
    xlabel('Real axis') 
    ylabel('Imaginary axis')
    hold on
    h = plot(xunit, yunit, 'r', 'linewidth', 2);
    plot([-2 2],[0 0], 'b', 'linewidth', 2);
    plot([0 0],[-2 2], 'k', 'linewidth', 2);
    
    plot( p_x, p_y, '-x', 'MarkerSize', 6);
    plot( z_x, z_y, '-o', 'MarkerSize', 6);
    plot( x(ii), y(ii), 's', 'MarkerSize', 6);
    plot( [z_x, x(ii)], [z_y, y(ii)],  'k','linewidth', 2);
   
         
    
    
    hold off
    pause(0.0000000000000000001)
    
    
    
end



% 
% [b,a] = ellip(4,.5,20,.6);
% Hq = dfilt.df2(b, a);
% Hq.arithmetic = 'fixed';
% zplane(Hq);