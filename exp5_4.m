M = 20; % assume 
Hr = [1 1 1 zeros(1,15) 1 1]; % desired frequency response magnitude
k1 = 0:floor((M-1)/2);
k2 = floor((M-1)/2)+1:(M-1);
a = (M-1)/2;
b = [-a*2*pi*k1/M, a*2*pi*(M-k2)/M]; % desired frequency response phase angles
H = Hr.*exp(j*b); % multiply magnitude and phase to get H
b = real(ifft(H,M)); % Inverse DFT to get b coefficients
[h w]=freqz(b,1); % frequency response plot
plot(w/pi,20*log10(abs(h)));
grid on; title('FIR LPF using frequency sampling design'); 
xlabel('Normalized Frequency'), ylabel('Gain in dB');
