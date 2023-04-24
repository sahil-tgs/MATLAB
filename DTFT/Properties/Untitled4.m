% Define the input sequences
n = 0:15;
x1 = sin(pi/4*n);
x2 = cos(pi/3*n);

% Define the length of the DTFT
length_omega = 1024;

% Calculate the DTFTs of x1 and x2 using the DTFT_of_sqn function
exp1 = exp(-1i*2*pi/length_omega*(0:length_omega-1)'*(0:length(n)-1));
X1 = DTFT_of_sqn(exp1, x1, length_omega);
exp2 = exp(-1i*2*pi/length_omega*(0:length_omega-1)'*(0:length(n)-1));
X2 = DTFT_of_sqn(exp2, x2, length_omega);

% Calculate the convolution of x1 and x2 manually using the formula
y = zeros(1,length(x1)+length(x2)-1);
for n=0:length(y)-1
    y(n+1) = sum(x1.*circshift(x2,n));
end

% Calculate Y1 = X1 * X2
Y1 = X1 .* X2;

% Calculate DTFT of y using the DTFT_of_sqn function
exp3 = exp(-1i*2*pi/length_omega*(0:length_omega-1)'*(0:length(y)-1));
Y2 = DTFT_of_sqn(exp3, y, length_omega);

% Plot x1, x2, X1, X2, Y1, and Y2 appropriately side by side
figure;
subplot(2,3,1);
stem(n,x1);
xlabel('Time (n)');
ylabel('Amplitude');
title('x1(n) = sin(\pi/4*n)');

subplot(2,3,2);
plot(linspace(-pi,pi,length_omega),fftshift(abs(X1)));
xlabel('Frequency (\omega)');
ylabel('|X1(\omega)|');
title('Magnitude Spectrum of x1(n)');

subplot(2,3,3);
stem(n,x2);
xlabel('Time (n)');
ylabel('Amplitude');
title('x2(n) = cos(\pi/3*n)');

subplot(2,3,4);
plot(linspace(-pi,pi,length_omega),fftshift(abs(X2)));
xlabel('Frequency (\omega)');
ylabel('|X2(\omega)|');
title('Magnitude Spectrum of x2(n)');

subplot(2,3,5);
stem(0:length(y)-1,y);
xlabel('Time (n)');
ylabel('Amplitude');
title('Convolution of x1(n) and x2(n)');

subplot(2,3,6);
plot(linspace(-pi,pi,length_omega),fftshift(abs(Y1)));
hold on;
plot(linspace(-pi,pi,length_omega),fftshift(abs(Y2)), 'r--');
xlabel('Frequency (\omega)');
ylabel('Magnitude');
title('Comparison of DTFT of Product and Manual Convolution');
legend('DTFT of Product', 'DTFT of Manual Convolution', 'Location', 'north');

% Define the DTFT_of_sqn function
function [X_omega] = DTFT_of_sqn(exp, x_n, length_omega)
% Calculate DTFT of input signal x_n using the exponential matrix exp

% Initialize output array
X_omega = zeros(1,length_omega);

% Calculate DTFT using manual summation formula
for ii=1:length_omega
    sum = 0;
    for jj=1:length(x_n)
        sum = sum + x_n(jj)*exp;
    end
end
end

