img = im2double(rgb2gray(imread("peppers.png")));

log_img = log(1+img);
log_img = log_img/max(log_img(:));

gamma = 0.5;
gamma_img = img.^ gamma;

figure;subplot(1,3,1); imshow(img); title("original");
subplot(1,3,2); imshow(log_img); title("Log Transform");
subplot(1,3,3); imshow(gamma_img); title("Gamma Transform");