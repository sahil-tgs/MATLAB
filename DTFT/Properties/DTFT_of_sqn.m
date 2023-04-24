function [X_omega] = ...
   DTFT_of_sqn(exp, x_n, length_omega)
%%here we ggo

for ii=1:(length_omega)
    X_omega(1,ii)=sum(x_n.*exp(ii,:));
end