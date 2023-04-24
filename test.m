clc
clear all;
close all;
n = 0:99; % Define the discrete-time signal
x = cos(2*pi*0.05*n); % Define the signal values
N = length(x); % Find the length of the signal
f = linspace(-0.5, 0.5, N); % Define the frequency axis
X = zeros(1, N); % Preallocate the DTFT vector
for k = 1:N
    for n = 1:N
        X(k) = X(k) + x(n) * exp(-1i * 2 * pi * (k-1) * (n-1) / N);
    end
end
X = X / N; % Normalize the DTFT
plot(f, abs(fftshift(X))) % Plot the magnitude of the DTFT
xlabel('Frequency (Normalized)')
ylabel('Magnitude')
title('DTFT of a discrete-time signal')