clc; clear; close all;

% Filter specs
Fs = 2000;           % Sampling frequency
fp = 400; fs = 600;  % Passband and stopband edges (Hz)
Rp = 1; Rs = 20;     % Passband ripple and stopband attenuation (dB)

% Normalize frequencies (0 to 1, where 1 = Nyquist = Fs/2)
Wp = fp/(Fs/2);
Ws = fs/(Fs/2);


[N_butt, Wn_butt] = buttord(Wp, Ws, Rp, Rs);
[b_butt, a_butt] = butter(N_butt, Wn_butt);
[H_butt, f] = freqz(b_butt, a_butt, 1024, Fs);


[N_cheb, Wn_cheb] = cheb1ord(Wp, Ws, Rp, Rs);
[b_cheb, a_cheb] = cheby1(N_cheb, Rp, Wn_cheb);
[H_cheb, ~] = freqz(b_cheb, a_cheb, 1024, Fs);


[N_ellip, Wn_ellip] = ellipord(Wp, Ws, Rp, Rs);
[b_ellip, a_ellip] = ellip(N_ellip, Rp, Rs, Wn_ellip);
[H_ellip, ~] = freqz(b_ellip, a_ellip, 1024, Fs);


figure;
plot(f, 20*log10(abs(H_butt)), 'b', 'LineWidth', 1.5); hold on;
plot(f, 20*log10(abs(H_cheb)), 'r', 'LineWidth', 1.5);
plot(f, 20*log10(abs(H_ellip)), 'g', 'LineWidth', 1.5);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Comparison of Digital Low-Pass Filters');
legend('Butterworth', 'Chebyshev I', 'Elliptic');