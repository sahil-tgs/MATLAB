clear all;
close all;
clc;

theta_x=(0.3*pi):(0.01*pi):(0.75*pi);
x_theta= cos(theta_x);

integration_x_theta=(step_size/2)*((x_theta(1,1))+(x_theta(1,end)))+2*sum(x_theta(1,2:end-1));