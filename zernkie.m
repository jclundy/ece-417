%% ECE 417 

% 1) Load the picture
original = imread('cameraman.tif');

% 2) Add white gaussian noise
sigma = [5, 10, 20, 30, 50, 75, 100] / 100;
noisy_image = imnoise(original, 'gaussian', 0, sigma(1));

figure(1)
imshow(original)
figure(2)
imshow(noisy_image)