img = imread("peppers.png");
imshow(img);
title("Original Image");

%Get the image info
disp("Image size:");
disp(size(img));
disp("Image class");
disp(class(img));
