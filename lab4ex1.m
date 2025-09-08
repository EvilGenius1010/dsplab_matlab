clc; clear; close all;

% Filter specifications
fp = 1000; fs = 500;
wp = 2*pi*fp; ws = 2*pi*fs;
Rp = 1; Rs = 50;

% Butterworth High-Pass Filter
[Nb, Wcb] = buttord(wp, ws, Rp, Rs, 's');
[bb, ab] = butter(Nb, Wcb, 'high', 's');
[hb, wb] = freqs(bb, ab);
fb = wb / (2*pi); % Convert to Hz

% Plot Butterworth - Figure 1
figure(1);
semilogx(fb, 20*log10(abs(hb)), 'b', 'LineWidth', 1.5);
grid on;
title('Figure 1: Butterworth High-Pass Filter');
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');

% Chebyshev Type I High-Pass Filter
[Nc1, Wcc1] = cheb1ord(wp, ws, Rp, Rs, 's');
[bc1, ac1] = cheby1(Nc1, Rp, Wcc1, 'high', 's');
[hc1, wc1] = freqs(bc1, ac1);
fc1 = wc1 / (2*pi); % Convert to Hz

% Plot Chebyshev Type I - Figure 2
figure(2);
semilogx(fc1, 20*log10(abs(hc1)), 'r', 'LineWidth', 1.5);
grid on;
title('Figure 2: Chebyshev Type I High-Pass Filter');
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');