% Sampling period
T = 0.1;

% Define analog transfer function H(s) = (s + 1)/(s^2 + 5s + 1)
num_s = [1 1];
den_s = [1 5 1];

% Impulse invariance transformation: returns digital filter coefficients
[num_z, den_z] = impinvar(num_s, den_s, T);

% Frequency response of analog filter
w = logspace(0, 2.5, 1000);  % Frequency vector (rad/s)
h_s = freqs(num_s, den_s, w);

% Frequency response of digital filter
[h_z, w_z] = freqz(num_z, den_z, 1024);

% Convert digital frequency to Hz
f_z = w_z / (2*pi*T);

% Plot magnitude responses
figure;

subplot(2,1,1);
semilogx(w/(2*pi), 20*log10(abs(h_s)), 'b', 'LineWidth', 1.5);
title('Analog Filter Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

subplot(2,1,2);
plot(f_z, 20*log10(abs(h_z)), 'r', 'LineWidth', 1.5);
title('Digital Filter Magnitude Response (Impulse Invariance)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;
