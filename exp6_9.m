img = im2double(rgb2gray(imread("peppers.png")));
noisy_img = imnoise(img,"salt & pepper",0.05);
filtered_img = medfilt2(noisy_img,[3,3]);

figure;
subplot(1,3,1); imshow(img); title("Original");
subplot(1,3,2); imshow(noisy_img); title("Noisy image");
subplot(1,3,3); imshow(filtered_img); title("Filtered image");