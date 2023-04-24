function [integrated_op] = integration_x(integration_data, stepsize_x)
%function to perform integration
%  here we go
integrated_op= (stepsize_x/2)*(integration_data(1,1)+integration_data(1,end)+...
    2*( sum( integration_data(1,2:end-1) ) ) );

end