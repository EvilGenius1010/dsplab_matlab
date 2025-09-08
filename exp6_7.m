img = im2double(rgb2gray(imread("peppers.png")));

h= fspecial("gaussian",[5,5],1.0);

blurred = imfilter(img,h);

figure;
subplot(1,2,1); imshow(img); title("Original");
subplot(1,2,2); imshow(blurred); title("Gaussian Blurred");
