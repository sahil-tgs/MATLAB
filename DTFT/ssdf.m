clc                % Clears the command window
close all          % Closes all figures
clear all          % Clears all variables from the workspace

%======================================================================%

a = 0.9            % Sets the value of the decay factor a
n = -100:1:100;    % Creates a vector of time indices n from -100 to 100

%======================================================================%
% Generate the single-sided exponential decay sequence
for ii = 1:length(n)      % Loop over each value of n
    if n(ii) < 0          % If n is negative, set x_n to 0
        x_n(ii) = 0;
    else                  % If n is non-negative, compute x_n using the decay factor a
        x_n(ii) = a^n(ii);
    end
end


%======================================================================%

% Plot the single-sided exponential decay sequence
subplot(3,1,1)   % Divides the figure into 3 rows and 1 column and selects the first subplot
stem(n, x_n)                         % Creates a stem plot of the sequence
xlabel('\it{n}')                     % Labels the x-axis as n
ylabel('{\itx}({\itn})')             % Labels the y-axis as x(n)

%======================================================================%

% Compute the frequency spectrum of the sequence
omega_x = -1*pi:0.01*pi:1*pi;        % Creates a vector of angular frequencies from -pi to pi
for jj = 1:length(omega_x)           % Loop over each value of omega_x
    for ii = 1:length(n)             % Loop over each value of n
        expo_x(jj,ii) = exp(-1j*omega_x(jj)*n(ii)); 
                                     % Compute the exponential term in the Fourier transform
    end
    F_omega(1,jj) = sum(x_n.*expo_x(jj,:)); 
                                     % Compute the Fourier transform
end

%====================================================================%

% Compute the phase angle of the Fourier coefficients
angle_F_omega = atan(imag(F_omega)./real(F_omega));

%====================================================================%

% Compute the theoretical magnitude of the Fourier coefficients
for ii = 1:length(omega_x)
    F_omega_theo_mag(ii) = 1/sqrt(1 + a^2 - 2*a*cos(omega_x(ii)));
end

% Plot the magnitude and phase angle of the Fourier coefficients
subplot(3,1,2)                       % Selects the second subplot
% Plots the magnitude of the Fourier coefficients and the theoretical magnitude
plot(omega_x/pi, abs(F_omega), omega_x/pi, abs(F_omega_theo_mag), '--r') 
xlabel('\omega/\pi')                 % Labels the x-axis as omega/pi
ylabel('|{\itX}({\it\omega})|')      % Labels the y-axis as |X(\omega)|

subplot(3,1,3)                       % Selects the third subplot
plot(omega_x/pi, angle_F_omega)      % Plots the phase angle of the Fourier coefficients
xlabel('\omega/\pi')                 % Labels the x-axis as omega/pi
ylabel('\angle|F(\omega)|') % Labels the y-axis as angle(X(\omega))





