img = imread("peppers.png");
gray_img = rgb2gray(img);
eq_img=histeq(gray_img);

figure;
subplot(1,2,1);
imshow(gray_img);
title("Original Grayscale");

subplot(1,2,2);
imshow(eq_img);
title("Equalized Image");

figure;  % <-- Move this up
subplot(1,2,1);
imhist(gray_img);
title("Original Histogram");

subplot(1,2,2);
imhist(eq_img);
title("Equalized Histogram");
