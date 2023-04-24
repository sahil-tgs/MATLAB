% Define signal parameters
n = -20:20;
N = length(n);
x1 = [];
x2 = [];
m = -5; % time shift factor

% Define gate sequence x1(n)
for i = 1:N
    if n(i) >= 0 && n(i) <= 10
        x1(i) = 1;
    else
        x1(i) = 0;
    end
end

% Define time shifted gate sequence x2(n) = x1(n+m)
for i = 1:N
    if (n(i) + m) >= 0 && (n(i) + m) <= 10
        x2(i) = 1;
    else
        x2(i) = 0;
    end
end

% Plot gate sequences
figure;
subplot(2,1,1);
stem(n,x1);
xlabel('n');
ylabel('x_1(n)');
title('Discrete Gate Sequence x_1(n)');

subplot(2,1,2);
stem(n,x2);
xlabel('n');
ylabel('x_2(n)');
title(['Discrete Gate Sequence x_2(n), shifted by ' num2str(m) ' samples']);

% Define frequency range for DTFT
omega_x = -pi:0.01:pi;
L = length(omega_x);
X1 = zeros(1, L);
X2 = zeros(1, L);

% Calculate DTFT of gate sequences
for k = 1:L
    for i = 1:N
        X1(k) = X1(k) + x1(i) * exp(-1j*omega_x(k)*n(i));
        X2(k) = X2(k) + x2(i) * exp(-1j*omega_x(k)*n(i));
    end
end

% Plot magnitude and phase of DTFTs
figure;
subplot(2,1,1);
plot(omega_x, abs(X1));
xlabel('\omega');
ylabel('|X_1(\omega)|');
title('DTFT of x_1(n)');

subplot(2,1,2);
plot(omega_x, abs(X2));
xlabel('\omega');
ylabel('|X_2(\omega)|');
title(['DTFT of x_2(n), shifted by ' num2str(m) ' samples']);

% Calculate linear phase of DTFTs
phi_X1 = unwrap(angle(X1));
phi_X2 = unwrap(angle(X2));

% Plot linear phase of DTFTs
figure;
subplot(2,1,1);
plot(omega_x, phi_X1);
xlabel('\omega');
ylabel('arg(X_1(\omega))');
title('Linear Phase of x_1(n)');

subplot(2,1,2);
plot(omega_x, phi_X2);
xlabel('\omega');
ylabel('arg(X_2(\omega))');
title(['Linear Phase of x_2(n), shifted by ' num2str(m) ' samples']);

