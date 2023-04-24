clc                     % Clear the command window
clear all;              % Clear all existing variables
close all;              % Close all open figures

n=-100:0;               % Define the range of discrete-time indices for left-sided signal
step_size=0.01*pi;      % Set the step size used in the trapezoidal rule
omega_x=-pi:0.01*pi:pi; % Define the range of frequencies to compute x[omega] over
omega_x(1)=[];          % Remove the first value of omega_x to avoid divide-by-zero error

for ii=1:length(omega_x)
    x_omega(ii)=(1)/(1-0.5*exp(-1j*omega_x(ii))); % Compute x[omega] at each frequency in omega_x
end

subplot(2,1,1)          % Create a subplot with two rows and one column, and select the first plot
plot(-fliplr(omega_x)/pi, abs(fliplr(x_omega))) % Plot the magnitude of x[omega] as a function of omega/pi

for ii=1:length(n)
    temp_x=x_omega.*exp(1j*omega_x*n(ii)); % Compute the inverse Fourier transform of x[omega] at each n
    x_n(ii)=(step_size/2)*(temp_x(1)+2*sum(temp_x(2:end-1))+temp_x(end)); % Approximate x[n] using the trapezoidal rule
end

subplot(2,1,2)          % Select the second plot in the subplot
stem(fliplr(n), abs(fliplr(x_n))) % Plot the magnitude of x[n] as a function of n using discrete stems
