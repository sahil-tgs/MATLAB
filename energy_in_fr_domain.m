function [enery_in_fr] = energy_in_fr_domain...
    (X_omega,step_size)
%here we go
temp1=X_omega.^2;
enery_in_fr=(1/(2*pi))*(step_size/2)*(temp1(1,1)+temp1(1,2)+...
    2*sum(temp1(1,2:end-1)));


end
