% Define the two input sequences
n = 0:20; % time index
x1 = sin(0.1*pi*n); % input sequence 1
x2 = cos(0.2*pi*n); % input sequence 2

% Compute the convolution of the two input sequences
y = conv(x1, x2); % convolution of x1 and x2

% Compute the DTFTs of the input sequences and the output sequence
N = 512; % number of frequency points
X1 = fft(x1, N); % DTFT of x1
X2 = fft(x2, N); % DTFT of x2
Y1 = fft(y, N); % DTFT of y
Y2 = X1 .* X2; % product of X1 and X2

% Plot the magnitude of the DTFTs of x1 and X1
figure(1);
subplot(2,2,1);
plot(linspace(0,1,N), abs(X1));
title('Magnitude of DTFT of x1');
subplot(2,2,2);
plot(linspace(0,1,N), abs(X2));
title('Magnitude of DTFT of x2');

% Plot the time-domain sequences x1 and x2
subplot(2,2,3);
stem(n, x1);
title('Sequence x1');
subplot(2,2,4);
stem(n, x2);
title('Sequence x2');

% Plot the time-domain sequence y
figure(2);
stem(0:length(y)-1, y);
title('Time-domain sequence y');

% Plot the magnitude of the DTFTs of y and X1X2
figure(3);
plot(linspace(0,1,N), abs(Y1), 'b', linspace(0,1,N), abs(Y2), 'r');
title('Magnitude of DTFT of Convolution (blue) and Product of DTFTs (red)');
legend('DTFT of y', 'Product of DTFTs');

% Show the plots
figure(1);
figure(2);
figure(3);
