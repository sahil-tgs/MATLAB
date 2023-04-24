function X = dtft_sum(x, k, N)
% DTFT_SUM computes the DTFT of a discrete-time signal x at frequency k.
%
% Inputs:
%   x - the discrete-time signal
%   k - the frequency index
%   N - the number of samples
%
% Outputs:
%   X - the DTFT at frequency k
%
    X = 0;
    for n = 1:N
        X = X + x(n) * dtft_exp(n, k, N);
    end
end

function X = dtft_exp(n, k, N)
% DTFT_EXP computes the exponential term in the DTFT formula.
%
% Inputs:
%   n - the time index
%   k - the frequency index
%   N - the number of samples
%
% Outputs:
%   X - the exponential term
%
    X = exp(-1i * 2 * pi * (k-1) * (n-1) / N);
end

function X = dtft_formula(x, f, N)
% DTFT_FORMULA computes the DTFT of a discrete-time signal x.
%
% Inputs:
%   x - the discrete-time signal
%   f - the frequency axis
%   N - the number of samples
%
% Outputs:
%   X - the DTFT
%
    X = zeros(1, length(f));
    for k = 1:length(f)
        X(k) = dtft_sum(x, k, N) / N;
    end
end

% Main program

N = 100; % Number of samples
n = 0:N-1; % Time index
x = [1, zeros(1, N-1)]; % Unit impulse signal
f = linspace(-0.5, 0.5, N); % Frequency axis
X = dtft_formula(x, f, N); % DTFT

plot(f, abs(fftshift(X))) % Plot the magnitude of the DTFT
xlabel('Frequency (Normalized)')
ylabel('Magnitude')
title('DTFT of a unit impulse signal')
