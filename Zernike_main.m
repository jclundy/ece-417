% -------------------------------------------------------------------------
% Copyright C 2014 Amir Tahmasbi
% Texas A&M University
% amir.tahmasbi@tamu.edu
% http://people.tamu.edu/~amir.tahmasbi/index.html
%
% License Agreement: To acknowledge the use of the code please cite the 
%                    following papers:
%
% [1] A. Tahmasbi, F. Saki, S. B. Shokouhi, 
%     Classification of Benign and Malignant Masses Based on Zernike Moments, 
%     Comput. Biol. Med., vol. 41, no. 8, pp. 726-735, 2011.
%
% [2] F. Saki, A. Tahmasbi, H. Soltanian-Zadeh, S. B. Shokouhi,
%     Fast opposite weight learning rules with application in breast cancer 
%     diagnosis, Comput. Biol. Med., vol. 43, no. 1, pp. 32-41, 2013.
%
% -------------------------------------------------------------------------
% A demo of how to use the Zernike moment function. 
%
% Example: 
%   1- calculate the Zernike moment (n,m) for an oval shape,
%   2- rotate the oval shape around its centeroid,
%   3- calculate the Zernike moment (n,m) again,
%   4- the amplitude of the moment (A) should be the same for both images
%   5- the phase (Phi) should be equal to the angle of rotation

clc; close all;

n = 4; m = 2;           % Define the order and the repetition of the moment

% 1) Load the picture
original = imread('cameraman.tif');

% 2) Add white gaussian noise
sigma = [5, 10, 20, 30, 50, 75, 100] / 100;
noisy_image = imnoise(original, 'gaussian', 0, sigma(2));

figure(1)
imshow(original)
figure(2)
imshow(noisy_image)

[~, ~, ~, newImage] = Zernikmoment(noisy_image, 2, 0);

newImage = abs(newImage);
newImage = uint8(newImage);
figure(3)
imshow(newImage);
