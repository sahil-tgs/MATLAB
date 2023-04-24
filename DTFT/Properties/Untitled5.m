% Define the two input sequences
n = 0:99; % time index
x1 = sin(0.1*pi*n); % input sequence 1
x2 = cos(0.2*pi*n); % input sequence 2

% Compute the convolution of the two input sequences
y = conv(x1, x2); % convolution of x1 and x2

% Compute the DTFTs of the input sequences and the output sequence
N = 512; % number of frequency points
X1 = fft(x1, N); % DTFT of x1
X2 = fft(x2, N); % DTFT of x2
Y1 = fft(y, N); % DTFT of y

% Compute the product of the DTFTs of x1 and x2
Y2 = X1 .* X2; % product of DTFTs of x1 and x2

% Plot the magnitude and phase of the DTFTs of y and X1X2
figure;
plot(linspace(0,1,N), abs(Y1), 'b', linspace(0,1,N), abs(Y2), 'r');
xlabel('Normalized frequency');
ylabel('Magnitude');
title('Magnitude of DTFT of Convolution (blue) and Product of DTFTs (red)');
legend('Y_1(e^{j\omega})', 'Y_2(e^{j\omega})');
