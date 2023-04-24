clc         % Clear the command window
clear all;  % Clear all variables in the workspace
close all;  % Close all figures

K = 200;    % Set the number of rows of the matrix expo_x
N = 200;    % Set the number of columns of the matrix expo_x

t1 = cputime;   % Get the CPU time before executing the loop

% Compute the matrix expo_x using the exponential method
for jj = 1:K
    for ii = 1:N
        expo_x(jj,ii) = exp(-1j*(2*pi/(N-1))*(ii-1)*(jj-1));
    end
end

% Generate a rectangular pulse signal x
for ii = 1:N
    if ii < 75
        x(ii) = 0;
    elseif ii >= 75 && ii <= 125
        x(ii) = 1;
    else
        x(ii) = 0;
    end
end

% Compute the DFT X_omega of x using matrix multiplication
X_omega = (expo_x)*(x)';

% Compute the IDFT x1 of X_omega using matrix multiplication and shift the signal
x1 = (1/N)*(((expo_x)')*(X_omega))-0.25;

t2 = cputime;   % Get the CPU time after executing the loop
time_taken_in_execution = t2-t1;    % Calculate the time taken to execute the loop
time_taken_in_execution()   % Display the time taken to execute the loop

% Plot the original signal x, the DFT X_omega, and the IDFT x1
subplot(3,1,1), stem(x)
xlabel('\it{n}')
ylabel('{\itx}({\itn})')
subplot(3,1,2), stem(abs(X_omega))
xlabel('\it{\omega\times\pi}')
ylabel('{\itX}({\omega})')
subplot(3,1,3), stem(abs(x1))
xlabel('\it{n}')
ylabel('{F^-1}({\itx}({\omega}))')
