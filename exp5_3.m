Fs = 2000; f1 = 100; f2 = 300; f3 = 500;
t = 0:(1/Fs):1;
x = sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t); % input signal
fp = [250 350]; fs = [150 450]; % band edge frequencies 
wp = fp/(Fs/2); ws = fs/(Fs/2); % normalize the frequencies
wc = (wp+ws)/2; % cutoff frequency
tw = min(abs(wp-ws)); % transition width
N = ceil(8/tw); % order of the filter
win = bartlett(N+1); % Bartlett window used to get 25 dB attenuation
b = fir1(N,wc,"bandpass",win); % filter coefficients
[h w] = freqz(b,1,512,Fs); % 512-point frequency response, w in Hz
plot(w,20*log10(abs(h))); grid on;
title('Bandpass filter using Bartlett window'); 
ylabel('Gain in dB'); xlabel('Frequency in Hz');

y = filter(b,1,x); % filtered output
X = fft(x,512); Y = fft(y,512);
L = length(X)/2; f = (0:(L-1))/L*(Fs/2);
figure; subplot(211); plot(f,abs(X(1:L))); 
title('Spectrum of input'); xlabel('Frequency in Hz');
subplot(212); plot(f,abs(Y(1:L))); 
title('Spectrum of output'); xlabel('Frequency in Hz');