function newImage = weightNormalized(image, zernikeMoments, h)
% This function normalizes the weighting of the Zernike moments and
% performs the nonlocal filtering of the noisy image.  The algorithm 
% calculates the simularity measure of the pixel relative to its 
% surrounding pixels and assigns it a weight according based on the 
% simularity.  A window size of 21 was used as suggested in the original
% paper.
% Inputs:
% image - The noisy image to be denoised
% zernikeMoments - An array of zernikeMoments for the image
% h - degree of filtering parameter

m = size(zernikeMoments, 1);
n = size(zernikeMoments, 2);

zernikeMoments(:,:,3) = zernikeMoments(:,:,3)./zernikeMoments(:,:,1);
zernikeMoments(:,:,5) = zernikeMoments(:,:,5)./zernikeMoments(:,:,2);

newImage = zeros(m, n);
for x1 = 1:m
    for y1 = 1:n
        V_pixel = zernikeMoments(x1,y1,:);
        weights = zeros(m , n);
        for xind = x1-10:x1+10
            for yind = y1-10:y1+10
                x2 = xind;
                y2 = yind;
                if(x2 <= 0)
                    x2 = 1 - x2;
                end
                if(x2 > m)
                    x2 = 2*m  - x2;
                end
                if(y2 <= 0)
                    y2 = 1 - y2;
                end
                if(y2 > n)
                    y2 = 2*n - y2;
                end
                v_other_pixel = zernikeMoments(x2,y2,:);
                weights(x2, y2) = evaluate_weight(1, V_pixel, v_other_pixel,h);
            end
        end
        c = sum(sum(weights, 1), 2);
        weights = weights / c;
        newImage(x1, y1) = sum(dot(double(image), weights));
    end
end