clc;
clear all;
close all;

% Generate input sequence
N = 10000; % Length of input sequence
x = zeros(N,1); % Initialize input sequence
for n = 1:N
    x(n) = randn(); % Generate N samples of white Gaussian noise
end

% Compute frequency response using DFT
tic;
X_dft = zeros(N, 1);
for k = 1:N
    for n = 1:N
        s = cos(2*pi*(k-1)*(n-1)/N) - 1j*sin(2*pi*(k-1)*(n-1)/N);
        X_dft(k) = X_dft(k) + x(n)*s;
    end
end
t_dft = toc;

% Compute frequency response using FFT
tic;
X_fft = fft(x);
t_fft = toc;

% Display results
fprintf('DFT took %f seconds\n', t_dft);
fprintf('FFT took %f seconds\n', t_fft);

% Plot frequency response magnitude using stem plot
f = (0:100:N-1)/N; % Sparse frequency axis
figure;
subplot(2,1,1);
stem(f, abs(X_dft(1:100:N)));
title('Frequency response using DFT');
xlabel('Normalized frequency');
ylabel('Magnitude (log)');
set(gca, 'YScale', 'log')
text(0.6, 0.9, sprintf('DFT time: %0.4f s', t_dft), 'Units', 'normalized');
subplot(2,1,2);
stem(f, abs(X_fft(1:100:N)));
title('Frequency response using FFT');
xlabel('Normalized frequency');
ylabel('Magnitude (log)');
set(gca, 'YScale', 'log')
text(0.6, 0.9, sprintf('FFT time: %0.4f s', t_fft), 'Units', 'normalized');
