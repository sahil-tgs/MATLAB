function [X_omega] = DTFT_of_sqn(x_n,expo_x,length_omega)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
for ii=1:length(length_omega)
   X_omega(1,jj)=sum(x_n.*expo_x(jj,:));
   endx
end
