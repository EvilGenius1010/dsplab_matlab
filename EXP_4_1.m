N=5; %order
[z,p,k] = buttap(5); % butterworth filter
[num,den] = zp2tf(z,p,k);
[h,w] = freqs(num,den);
semilogx(w,20*log10(abs(h)));
title('Normalized prototype filter');
xlabel("Freq in rad/sec");ylabel("Gain in db")
wc=0.5*pi;
p1=p*wc;
k1=k*wc^N;
[num1,den1] = zp2tf(z,p1,k1);
[h1,w1]=freqs(num1,den1);
figure;semilogx(w1,20*log10(abs(h1)));
title("required filter");xlabel('Frequency in rad/sec'); ylabel('Gain in dB');
disp(h1);