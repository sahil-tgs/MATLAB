clear all;
close all;
clc;
 
%input(x)
x=input("Input:")
if(x<-2.5)
    y=0;
    elseif(-2.5<=x && x<-1.5)
    y=1;
    
    elseif(-1.5<=x && x>-0.5)
     y=2;
    
    elseif(-0.5<=x && x<0.5)
     y=3;
    
    elseif(0.5<=x && x<1.5)
     y=4;
    
    elseif(1.5<=x && x<2.5)
     y=5;
    
    elseif(2.5<=x && x<3.5)
     y=6;
    
else
    y=7;
end
fprintf("y = %d", y);