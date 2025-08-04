clc; clear; close all;

%% System Function H(z)
% H(z) = (z^2 - 1) / (z - 3)^2
num = [1 0 -1];     % z^2 - 1
den = [1 -6 9];     % (z - 3)^2 = z^2 - 6z + 9

%% a) Impulse Response (anti-causal)
% Use partial fraction expansion
[r, p, k] = residue(num, den);

% Anti-causal impulse response: valid for n < 0
N = 20;  % Number of samples
n = -N:-1;  % Negative time indices
h = zeros(size(n));
for i = 1:length(r)
    h = h + r(i) * (p(i)).^n;
end

figure;
stem(n, h, 'filled');
title('Anti-Causal Impulse Response h[n]');
xlabel('n'); ylabel('h[n]');

%% b) Difference Equation Representation
disp('Numerator coefficients (b):');
disp(num);
disp('Denominator coefficients (a):');
disp(den);

% Difference equation:
% a(1)*y[n] + a(2)*y[n+1] + a(3)*y[n+2] = b(1)*x[n] + b(2)*x[n+1] + b(3)*x[n+2]
% (note: future terms due to anti-causality)

%% c) Pole-Zero Plot
figure;
zplane(num, den);
title('Pole-Zero Plot');

%% d) Output y[n] for x[n] = 3*sin(n*pi/3)*u[n]
n_pos = 0:N-1;
x = 3 * sin(n_pos * pi / 3);  % causal input

% Flip impulse response for anti-causal convolution
h_flip = fliplr(h);

% Pad input to match anti-causal convolution
x_padded = [zeros(1, length(h_flip)-1), x];
y = conv(x_padded, h_flip, 'valid');

figure;
stem(n_pos, y, 'filled');
title('Output y[n] for x[n] = 3sin(nπ/3)u[n]');
xlabel('n'); ylabel('y[n]');
