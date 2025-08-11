% Sampling points for frequency response
N = 1024;

% Define filter coefficients for each case

% a) y[n] + 0.13y[n−1] + 0.52y[n−2] + 0.3y[n−3] = 0.16x[n] − 0.48x[n−1] + 0.48x[n−2] − 0.16x[n−3]
a1 = [1 0.13 0.52 0.3];
b1 = [0.16 -0.48 0.48 -0.16];

% b) y[n] − 0.268y[n−2] = 0.634x[n] − 0.634x[n−2]
a2 = [1 0 -0.268];
b2 = [0.634 0 -0.634];

% c) y[n] + 0.268y[n−2] = 0.634x[n] + 0.634x[n−2]
a3 = [1 0 0.268];
b3 = [0.634 0 0.634];

% d) 10y[n] – 5y[n−1] + y[n−2] = x[n] − 5x[n−1] + 10x[n−2]
a4 = [10 -5 1];
b4 = [1 -5 10];

% Plot frequency responses
figure;
filters = {'a', 'b', 'c', 'd'};
for i = 1:4
    subplot(2,2,i);
    eval(['[H, w] = freqz(b' num2str(i) ', a' num2str(i) ', N);']);
    plot(w/pi, abs(H), 'LineWidth', 1.5);
    title(['Filter ' filters{i} ' Magnitude Response']);
    xlabel('\omega / \pi'); ylabel('|H(e^{j\omega})|');
    grid on;
end
