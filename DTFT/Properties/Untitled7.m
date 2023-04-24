clear all;
close all;
clc

% Define the input signals x1 and x2
n = 0:20; % time index
x1 = sin(0.1*pi*n); % input signal 1
x2 = cos(0.2*pi*n); % input signal 2

% Define the exponential matrix and the number of frequency samples
N = length(x1);
exp_mat = exp(-1j*2*pi/N*(0:N-1)'*(0:N-1)); % exponential matrix
length_omega = 512; % number of frequency samples

% Calculate the DTFTs of x1 and x2 using the function DTFT_of_sqn
X1_omega = DTFT_of_sqn(exp_mat, x1, length_omega);
X2_omega = DTFT_of_sqn(exp_mat, x2, length_omega);

% Calculate the convolution of x1 and x2 using the built-in conv function
y = conv(x1, x2, 'same');

% Calculate the DTFT of y using the function DTFT_of_sqn
Y_omega = DTFT_of_sqn(exp_mat, y, length_omega);

% Calculate the product of X1_omega and X2_omega
X1X2_omega = X1_omega .* X2_omega;

% Plot the magnitude of the DTFTs of x1 and x2, side by side
figure(1);
subplot(2,2,1);
plot(linspace(0,1,length_omega), abs(X1_omega));
title('Magnitude of DTFT of x1');
subplot(2,2,2);
plot(linspace(0,1,length_omega), abs(X2_omega));
title('Magnitude of DTFT of x2');

% Plot the magnitude of the DTFT of y
figure(2);
plot(linspace(0,1,length_omega), abs(Y_omega));
title('Magnitude of DTFT of y');

% Plot the overlap of the magnitude of the DTFT of y and X1X2_omega
figure(3);
plot(linspace(0,1,length_omega), abs(Y_omega));
hold on;
plot(linspace(0,1,length_omega), abs(X1X2_omega));
title('Magnitude of DTFT of y and X1*X2');
legend('DTFT of y', 'X1*X2');

function [X_omega] = DTFT_of_sqn(exp, x_n, length_omega)
% Calculate DTFT of input signal x_n using the exponential matrix exp

% Initialize output array
X_omega = zeros(length_omega, 2);

% Calculate DTFT using manual summation formula
for ii=1:length_omega
    X_omega(ii, :) = sum(x_n.*exp(:, ii).');
end

end 

