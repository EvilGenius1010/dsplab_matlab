    %% Filter specs
wp = 0.2 * pi;  % Passband edge
ws = 0.4 * pi;  % Stopband edge
fs = 2 * pi;    % Normalized sampling frequency

% Convert to normalized frequency (0 to 1)
wp_n = wp / pi;
ws_n = ws / pi;

% Transition width
delta_w = ws_n - wp_n;

% Estimate filter order (simple heuristic)
N = ceil(6.6 / delta_w);  % For Kaiser, use empirical formula
if mod(N,2)==1
    N = N + 1;  % Make filter order even for symmetry
end

%% a) Rectangular Window
h_rect = fir1(N, wp_n, 'low', rectwin(N+1));
[H_rect, w] = freqz(h_rect, 1, 1024);

%% b) Hanning Window
h_hann = fir1(N, wp_n, 'low', hann(N+1));
[H_hann, ~] = freqz(h_hann, 1, 1024);

%% c) Kaiser Window
% Design parameters
A = 60;  % Desired stopband attenuation in dB
beta = 0.1102*(A - 8.7);  % Kaiser beta formula
w_kaiser = kaiser(N+1, beta);
h_kaiser = fir1(N, wp_n, 'low', w_kaiser);
[H_kaiser, ~] = freqz(h_kaiser, 1, 1024);

%% Plot Frequency Responses
figure;
plot(w/pi, abs(H_rect), 'r', 'LineWidth', 1.5); hold on;
plot(w/pi, abs(H_hann), 'g', 'LineWidth', 1.5);
plot(w/pi, abs(H_kaiser), 'b', 'LineWidth', 1.5);
grid on;
xlabel('Normalized Frequency (\omega/\pi)');
ylabel('Magnitude');
title('Frequency Response Comparison of FIR Low-Pass Filters');
legend('Rectangular', 'Hanning', 'Kaiser');
