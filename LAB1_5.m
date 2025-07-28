clc; clear; close all;

k = 0:15;
x1 = (-1/2).^k;
x2 = (2).^k;
x3 = (-2).^k;

subplot(3,1,1); 
stem(k, x1);
title('(-1/2)^k'); 
xlabel('k');
ylabel('Amplitude');

subplot(3,1,2);
stem(k, x2);
title('(2)^k');
xlabel('k'); 
ylabel('Amplitude');

subplot(3,1,3);
stem(k, x3);
title('(-2)^k');
xlabel('k'); 
ylabel('Amplitude');

fs = 1000;             
t = 0:1/fs:1;           


f = 5;                  
y1 = square(2*pi*f*t, 25);  
y2 = square(2*pi*f*t, 50);  
y3 = square(2*pi*f*t, 75);  

figure;
subplot(3,1,1); 
plot(t, y1);
title('Square wave - 25% Duty'); 
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, y2);
title('Square wave - 50% Duty'); 
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, y3);
title('Square wave - 75% Duty'); 
xlabel('Time');
ylabel('Amplitude');

tri = sawtooth(2*pi*f*t, 0.5); 


figure;
plot(t, tri);
title('Triangular Wave'); xlabel('Time'); ylabel('Amplitude');

f1 = 10; f2 = 30; f3 = 60;

multi = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);

figure;
plot(t, multi);
title('Multi-tone Signal (10Hz, 30Hz, 60Hz)');
xlabel('Time'); ylabel('Amplitude');
