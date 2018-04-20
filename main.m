%% ECE 417 

% 1) Load the picture
original = imread('cameraman.tif');

% 2) Add white gaussian noise
sigma = [5, 10, 20, 30, 50, 75, 100] / 100;
p = [0, 1, 2, 2];
q = [0, 1, 0, 2];
noisy_image = imnoise(original, 'gaussian', 0, 0.003);

% noisy_image = noisy_image(33:96,81:144);

figure(1)
imshow(original)
figure(2)
imshow(noisy_image)

newImage = Zernike_moment(noisy_image, p, q);

newImage = abs(newImage);
newImage = uint8(newImage);
figure(3)
imshow(newImage);
