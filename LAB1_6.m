clc; clear; close all;

% Define n
n = 0:100;

% Create unit step signals as arrays
u = double(n >= 0);
u_100 = double(n >= 100);

% Sequence (c): x[n] = sin(pi*n/25) * (u[n] - u[n-100])
x3 = sin(pi*n/25) .* (u - u_100);
y3 = [0, diff(x3)];  % Digital differentiator

% Plot
figure;
subplot(1,2,1); plot(n, x3); title('x[n] = Sinusoidal Windowed Signal');
xlabel('n'); ylabel('Amplitude');

subplot(1,2,2); plot(n, y3); title('y[n] = x[n] - x[n-1] (Differentiated)');
xlabel('n'); ylabel('Amplitude');
