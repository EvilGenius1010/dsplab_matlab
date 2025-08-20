Fs = 1000; % sampling frequency
wc = 100/(Fs/2); % normalized cutoff frequency
[b,a] = butter(3,wc); % digital filter coefficients using BLT
[h,w] = freqz(b,a); % frequency response
f = (w/pi)*(Fs/2); % convert normalized frequency into Hz
plot(f,20*log10(abs(h))); grid on;
ylabel('Gain in dB'); xlabel('Freq in Hz'); title('Filter response');
t = 0:(1/Fs):1; % time sequence
x = sin(2*pi*50*t) + sin(2*pi*200*t); % input signal with 50Hz and 200Hz freqs
y = filter(b,a,x); % obtain the output of the filter
X = fft(x,512); % spectrum of the input
Y = fft(y,512); % spectrum of the output
L = length(X)/2; % take half of the samples (0 to pi radians)
f = (0:(L-1))/L*(Fs/2); % convert sample numbers into frequency in Hz
figure; subplot(211); plot(f,abs(X(1:L))); 
title('Spectrum of input');
subplot(212); plot(f,abs(Y(1:L))); 
title('Spectrum of output'); xlabel('Frequency in Hz');