% Define signal parameters

n = -20:20;
N = length(n);
x1 = zeros(1,N);
x2 = zeros(1,N);
prompt = "Time shift=";
m = input(prompt); % time shift factor

% Define gate sequence x1(n)
for i=1:N
    if n(i)>=0 && n(i)<=10
        x1(i) = 1;
    end
end

% Define gate sequence x2(n)
for i=1:N
    if n(i)-m>=0 && n(i)-m<=10
        x2(i) = 1;
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

% Calculate DTFT of x1 and x2
omega_x = -pi:0.01:pi;
X1 = DTFT_of_sqn(exp(-1j*omega_x'*n), x1, length(omega_x));
X2 = DTFT_of_sqn(exp(-1j*omega_x'*n), x2, length(omega_x));

% Plot DTFT magnitude of x1 and x2
figure;
subplot(2,1,1);
plot(omega_x, abs(X1));
xlabel('\omega');
ylabel('|X_1(\omega)|');
title('DTFT magnitude of x_1(n)');

subplot(2,1,2);
plot(omega_x, abs(X2));
xlabel('\omega');
ylabel('|X_2(\omega)|');
title(['DTFT magnitude of x_2(n), shifted by ' num2str(m) ' samples']);

% Calculate phase of DTFT of x1 and x2
angle_X1 = atan(imag(X1)./real(X1));
angle_X2 = atan(imag(X2)./real(X2));

% Plot linear phase of x1 and x2
figure;
subplot(2,1,1);
plot(omega_x, angle_X1);
xlabel('\omega');
ylabel('\angle X_1(\omega)');
title('Linear phase of x_1(n)');

subplot(2,1,2);
plot(omega_x, angle_X2);
xlabel('\omega');
ylabel('\angle X_2(\omega)');
title(['Linear phase of x_2(n), shifted by ' num2str(m) ' samples']);
