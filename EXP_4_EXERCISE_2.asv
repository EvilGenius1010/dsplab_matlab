% Filter specifications
Wp = 2 * pi * 1000;   % Passband edge in rad/s
Ws = 2 * pi * 500;    % Stopband edge in rad/s
Rp = 1;               % Passband ripple in dB
Rs = 50;              % Stopband attenuation in dB

% Frequency vector for plotting
w = logspace(2, 5, 1000);  % 100 Hz to 100 kHz

%% a) Analog High-Pass Butterworth Filter
[n_butt, Wn_butt] = buttord(Wp, Ws, Rp, Rs, 's');
[b_butt, a_butt] = butter(n_butt, Wn_butt, 'high', 's');
h_butt = freqs(b_butt, a_butt, w);

%% b) Analog High-Pass Chebyshev Type I Filter
[n_cheb1, Wn_cheb1] = cheb1ord(Wp, Ws, Rp, Rs, 's');
[b_cheb1, a_cheb1] = cheby1(n_cheb1, Rp, Wn_cheb1, 'high', 's');
h_cheb1 = freqs(b_cheb1, a_cheb1, w);

%% Plotting
figure;
semilogx(w/(2*pi), 20*log10(abs(h_butt)), 'b', 'LineWidth', 1.5); hold on;
semilogx(w/(2*pi), 20*log10(abs(h_cheb1)), 'r', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Analog High-Pass Filter Comparison');
legend('Butterworth', 'Chebyshev Type I');
xline(500, '--k', 'Stopband Edge');
xline(1000, '--k', 'Passband Edge');
