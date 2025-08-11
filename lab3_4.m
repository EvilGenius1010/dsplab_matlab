% Define parameters
n = 0:15;
x = (-0.9).^n;  % Equivalent to 0.9^n * e^(j3*pi*n)

% Frequency range
omega = linspace(-pi, pi, 1000);  % 1000 points from -π to π
X = zeros(size(omega));

% Compute DTFT manually
for k = 1:length(omega)
    X(k) = sum(x .* exp(-1j * omega(k) * n));
end

% Plot magnitude and phase
figure;
subplot(2,1,1);
plot(omega, abs(X));
title('Magnitude of X(e^{j\omega})');
xlabel('\omega'); ylabel('|X(e^{j\omega})|');
grid on;

subplot(2,1,2);
plot(omega, angle(X));
title('Phase of X(e^{j\omega})');
xlabel('\omega'); ylabel('∠X(e^{j\omega})');
grid on;

% Verify periodicity
omega_shifted = omega + 2*pi;
X_shifted = zeros(size(omega_shifted));
for k = 1:length(omega_shifted)
    X_shifted(k) = sum(x .* exp(-1j * omega_shifted(k) * n));
end

% Compare original and shifted DTFT
figure;
plot(omega, abs(X), 'b', omega, abs(X_shifted), 'r--');
legend('|X(e^{j\omega})|', '|X(e^{j(\omega + 2\pi)})|');
title('Periodicity of DTFT');
xlabel('\omega'); ylabel('Magnitude');
grid on;
