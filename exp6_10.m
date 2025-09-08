img = imread("peppers.png");

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

figure;
subplot(2,2,1);imshow(img); title("Original");
subplot(2,2,2);imshow(r); title("Red color extraction");
subplot(2,2,3);imshow(g); title("Green color extraction");
subplot(2,2,4);imshow(b); title("Yelllow color extraction");