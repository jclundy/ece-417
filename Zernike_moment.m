function [newImage, Moments] = Zernike_moment(image,p,q)
% -------------------------------------------------------------------------
% This function takes in a noisy image and computes an array of Zernike
% moments to denoise the image
% Inputs:
% image - The noisy image to be denoised
% p - An array of Zernike orders
% q - An array of repetitions

degreeOfFiltering = 95;
N = size(image,1);
x = 1:N; y = x;
[X,Y] = meshgrid(x,y);

% Generate a number of pixels of interest around a pixel
% This will create a matrix of radii and angles which are non-zero only 
% within the desired range, plugging this set of equations into the radial 
% polynomial solver (R_pq) allows us to calculate the set of V_pq equations 
% around the image.

r = hypot(2*X-N-1, 2*Y-N-1);
theta = atan2(2*Y-N-1,2*X-N-1);
r = (r<=5).*r/5;
theta = (r<=5).*theta;  

% Generate an array of Zernike Moments using the inputted orders and
% number of reptitions

Moments = zeros([size(image), length(p)]);
for k=1:length(p)
    Rad = R_pq(p(k), q(k), r);    % get the radial polynomial
    Moments(:, :, k) = conv2(double(image(x,y)),Rad.*exp(...
            q(k)*1i.*theta), 'same');
    Moments(:, :, k) = Moments(:, :, k)*(p(k)+1)/pi;
    Moments(:, :, k) = abs(Moments(:, :, k));
end

newImage = weightNormalized(image, Moments, degreeOfFiltering);
newImage = abs(newImage);
newImage = uint8(newImage);