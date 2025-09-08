img = imread("peppers.png");

figure;
imshow(img);
title("Select ROI and double click");
roi = imcrop;

figure;
imshow(roi);
title("Cropped ROI");