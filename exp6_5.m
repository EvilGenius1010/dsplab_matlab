img = imread("peppers.png");
gray_img = rgb2gray(img);
negative_img = 255-img;

subplot(1,2,1);
imshow(img);
title("Original Image");

subplot(1,2,2);
imshow(negative_img);
title("Negative Image");