% Define signal parameters
clear all
close all
clc

a = 0.8;
n = -10:10;

% Calculate discrete-time signals
for ii=1:length(n)
    if(n(ii)<0)
        x1(ii)=a^(-n(ii));
        x2(ii)=0;
    else
        x1(ii)=0;
        x2(ii)=a^n(ii);
    end
end

% Define frequency range for DTFT

omega_x = -pi:0.01:pi;

% Calculate DTFT of each signal
X1 = DTFT_of_sqn(exp(-1j*omega_x'*n), x1, length(omega_x));
X2 = DTFT_of_sqn(exp(-1j*omega_x'*n), x2, length(omega_x));

% Calculate DTFT of sum of signals
x_sum = x1 + x2;
X_sum = DTFT_of_sqn(exp(-1j*omega_x'*n), x_sum, length(omega_x));

% Verify linearity property
G = X1 + X2;
Y = X_sum;

% Plot signals and DTFTs
figure;

subplot(3,2,1);
stem(n, x1);
title('x1');
xlabel('n');
ylabel('x1');

subplot(3,2,2);
plot(omega_x, abs(X1));
title('DTFT of x1');
xlabel('\omega');
ylabel('|X1(\omega)|');

subplot(3,2,3);
stem(n, x2);
title('x2');
xlabel('n');
ylabel('x2');

subplot(3,2,4);
plot(omega_x, abs(X2));
title('DTFT of x2');
xlabel('\omega');
ylabel('|X2(\omega)|');

subplot(3,2,5);
stem(n, x_sum);
title('x1 + x2');
xlabel('n');
ylabel('x1 + x2');

subplot(3,2,6);
plot(omega_x, abs(X_sum));
title('DTFT of x1 + x2');
xlabel('\omega');
ylabel('|X1 + X2(\omega)|');

% Plot G and Y on the same figure
figure;
plot(omega_x, abs(G), 'r--', omega_x, abs(Y), 'b');
title('Comparison of G and Y');
xlabel('\omega');
ylabel('|G(\omega)| or |Y(\omega)|');
legend('G', 'Y');


function [X_omega] = DTFT_of_sqn(exp, x_n, length_omega)
% Calculate DTFT of input signal x_n using the exponential matrix exp

% Initialize output array
X_omega = [];

% Calculate DTFT using manual summation formula
for ii=1:length_omega
    sum = 0;
    for jj=1:length(x_n)
        sum = sum + x_n(jj)*exp(ii,jj);
    end
    X_omega(ii) = sum;
end

end


