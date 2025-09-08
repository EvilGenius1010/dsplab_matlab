img = imread("peppers.png");
gray_img = rgb2gray(img);
eq_img=histeq(gray_img);

h_smooth = fspecial("average",[5,5]);
smooth_img = imfilter(gray_img,h_smooth);

h_sharp = fspecial("unsharp");
sharp_img = imfilter(gray_img,h_sharp);

subplot(1,3,1);
imshow(smooth_img);
title("Smoothed");
subplot(1,3,3);
imshow(sharp_img);
title("Sharpened");

