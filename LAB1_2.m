F1=1000; %Sampling frequency of 1000Hz.
F2=200; %Sampling frequency of 20hz
t=0:1/F1:(1/F2); % generation of the time sequence for 1 period duration.
x=5*sin(2*pi*F2*t); %sine wave of freq 200 Hz and amplitude 5, sampled at Fs
subplot(3,1,1); stem(t,x,'*g');
title('Sine wave sampled at 200 Hz, one period duration'); 
ylabel('Amplitude'); xlabel('Time');
F3=10000;
t=0:1/F3:(1/F2);
x=5*sin(2*pi*F2*t);
subplot(3,1,2);
stem(t,x);
title('Sine wave sampled at 10000 Hz, one period duration '); 
ylabel('Amplitude'); xlabel('Time')
t=0:1/F1:(2/F2); % time sequence for two cycle duration
x = 5*sin(2*pi*F2*t);
subplot(3,1,3); stem(t,x,'sr');
title('Sine wave sampled at 10000 Hz, two cycle duration'); 
ylabel('Amplitude'); xlabel('Time');