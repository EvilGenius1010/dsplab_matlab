%{
h[n] = (0.5)𝑛{𝑢[𝑛] – 𝑢[𝑛 – 10])
(a) 𝑥[𝑛] = (0.8)𝑛 (𝑢[𝑛]– 𝑢[𝑛 − 5]) 
(b) x[n] = δ[n] + 3δ[n – 1] + 4δ[n – 3]
%}


% Time index
n = 0:10;

% Impulse response h[n] = (0.5)^n for 0 <= n < 10
h = (0.5).^n;
h(n >= 10) = 0;  % Ensure h[n] is zero at n = 10

% Input (a): x[n] = (0.8)^n for 0 <= n < 5
x1 = (0.8).^n;
x1(n >= 5) = 0;

% Output (a): convolution
y1 = conv(x1, h);
y1 = y1(1:11);  % Truncate to n = 0 to 10

% Input (b): x[n] = δ[n] + 3δ[n-1] + 4δ[n-3]
x2 = zeros(size(n));
x2(n == 0) = 1;
x2(n == 1) = 3;
x2(n == 3) = 4;

% Output (b): convolution
y2 = conv(x2, h);
y2 = y2(1:11);  % Truncate to n = 0 to 10

% Plotting
figure;
subplot(2,1,1);
stem(n, y1, 'filled');
title('Output y[n] for Input (a)');
xlabel('n'); ylabel('y[n]');

subplot(2,1,2);
stem(n, y2, 'filled');
title('Output y[n] for Input (b)');
xlabel('n'); ylabel('y[n]');
