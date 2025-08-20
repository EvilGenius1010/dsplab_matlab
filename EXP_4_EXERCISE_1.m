fp=200; Wp=2*pi*fp;
fs=700; Ws=2*pi*fs;
Rp=1;
Rs=50;

% Frequency vector for plotting
w = logspace(2, 4, 1000);  % 100 Hz to 10 kHz

%% a) Butterworth Filter
[n_butt, Wn_butt] = buttord(Wp, Ws, Rp, Rs, 's');
[b_butt, a_butt] = butter(n_butt, Wn_butt, 's');
h_butt = freqs(b_butt, a_butt, w);

%% b) Chebyshev Type I Filter
[n_cheb1, Wn_cheb1] = cheb1ord(Wp, Ws, Rp, Rs, 's');
[b_cheb1, a_cheb1] = cheby1(n_cheb1, Rp, Wn_cheb1, 's');
h_cheb1 = freqs(b_cheb1, a_cheb1, w);

%% c) Chebyshev Type II Filter
[n_cheb2, Wn_cheb2] = cheb2ord(Wp, Ws, Rp, Rs, 's');
[b_cheb2, a_cheb2] = cheby2(n_cheb2, Rs, Wn_cheb2, 's');
h_cheb2 = freqs(b_cheb2, a_cheb2, w);

%% d) Elliptic Filter
[n_ellip, Wn_ellip] = ellipord(Wp, Ws, Rp, Rs, 's');
[b_ellip, a_ellip] = ellip(n_ellip, Rp, Rs, Wn_ellip, 's');
h_ellip = freqs(b_ellip, a_ellip, w);

%% Plotting
figure;
semilogx(w/(2*pi), 20*log10(abs(h_butt)), 'b', 'LineWidth', 1.5); hold on;
semilogx(w/(2*pi), 20*log10(abs(h_cheb1)), 'r', 'LineWidth', 1.5);
semilogx(w/(2*pi), 20*log10(abs(h_cheb2)), 'g', 'LineWidth', 1.5);
semilogx(w/(2*pi), 20*log10(abs(h_ellip)), 'm', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Analog Lowpass Filter Comparison');
legend('Butterworth', 'Chebyshev I', 'Chebyshev II', 'Elliptic');
xline(200, '--k', 'Passband Edge');
xline(700, '--k', 'Stopband Edge');