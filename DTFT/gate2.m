clc
clear all

% Define the time axis
t = linspace(-5, 5, 1000);

% Define the gate function
gate = zeros(size(t));
for ii = 1:length(t)
    if abs(t(ii)) <= 1
        gate(ii) = 1;
    end
end

% Plot the gate function
plot(t, gate)
xlabel('Time')
ylabel('Amplitude')
