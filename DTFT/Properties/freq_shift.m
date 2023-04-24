
clear all;
close all;
clc
% Define signal parameters
n = -20:20;
N = length(n);
x1 = zeros(1,N);
x2 = zeros(1,N);
f0 = 0.1; % frequency of cosine sequence
phi = pi/4; % phase of cosine sequence
m = 5; % frequency shift factor

% Define cosine sequence x1(n)
for i=1:N
    x1(i) = cos(2*pi*f0*n(i) + phi);
end

% Define frequency shifted sequence x2(n)
for i=1:N
    x2(i) = cos(2*pi*f0*(n(i)-m) + phi);
end

% Plot cosine sequences
figure;
subplot(2,1,1);
plot(n,x1);
xlabel('n');
ylabel('x_1(n)');
title('Cosine Sequence x_1(n)');

subplot(2,1,2);
plot(n,x2);
xlabel('n');
ylabel('x_2(n)');
title(['Frequency Shifted Cosine Sequence x_2(n), shifted by ' num2str(m) ' samples']);

% Calculate DTFT of x1 and x2
omega_x = -pi:0.01:pi;
X1 = DTFT_of_sqn(exp(-1j*omega_x'*n), x1, length(omega_x));
X2 = DTFT_of_sqn(exp(-1j*omega_x'*n), x2, length(omega_x));

% Plot magnitude and phase of DTFTs
figure;
subplot(2,1,1);
plot(omega_x, abs(X1));
hold on;
plot(omega_x, abs(X2));
xlabel('\omega');
ylabel('|X(\omega)|');
title('Magnitude of DTFTs of x_1(n) and x_2(n)');
legend('DTFT of x_1(n)', ['DTFT of x_2(n), shifted by ' num2str(m) ' samples']);

subplot(2,1,2);
angle_X1 = atan(imag(X1)./real(X1));
angle_X2 = atan(imag(X2)./real(X2));
plot(omega_x, angle_X1);
hold on;
plot(omega_x, angle_X2);
xlabel('\omega');
ylabel('arg(X(\omega))');
title('Phase of DTFTs of x_1(n) and x_2(n)');
legend('DTFT of x_1(n)', ['DTFT of x_2(n), shifted by ' num2str(m) ' samples']);
