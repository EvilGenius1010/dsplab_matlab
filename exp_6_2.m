gray_img = rgb2gray(img);
imshow(gray_img);
title("Grayscale image");

figure;
imhist(gray_img);
title("Histograrm of gray image");