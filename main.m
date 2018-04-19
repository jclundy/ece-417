%% ECE 417 

%% Setup
% 1) Load the picture
original = imread('cameraman.tif');
original=original(33:96,81:144);
% 2) Add white gaussian noise
sigma = [5, 10, 20, 30, 50, 75, 100] / 100;
noisy_image = imnoise(original, 'gaussian', 0, sigma(1));
f = noisy_image;

figure(1)
imshow(original)
figure(2)
imshow(f)

% Meta parameters

[m, n] = size(f);
l = m*n;
h = 95;

%% Algorithm 
f_filtered = zeros(m,n);
V_m_n = zeros(m,n,6);
f = im2double(f);
f_flattened = f(:);
%1 ) Evaluate V = [(Z00, Z11, Z20, Z22, Z31, Z33)] for each pixel
for x = 1:m
    for y = 1:n
        [z_00, z_11, z_20, z_22, z_31, z_33] = evaluate_V(f,x,y);
        V_m_n(x,y,:) = [z_00, z_11, z_20, z_22, z_31, z_33];
    end
end

%2 ) For each pixel, evaluate similarity of pixel to every pixel in image
for x1 = 1:m
    for y1 = 1:n
        V_pixel = V_m_n(x1,y1,:);
        weights = zeros(m, n);
        for x2 = 1:m
            for y2 = 1:n
                V_other_pixel = V_m_n(x2,y2,:);
                weights(x2, y2) = evaluate_weight(1, V_pixel, V_other_pixel,h);
            end
        end
        weights_flattened = weights(:);
        C = sum(weights_flattened);
        weights_flattened = weights_flattened / C;
        f_filtered(x1,y1) = dot(weights_flattened,f_flattened);
    end
end
%max_f = max(f_filtered);
%min_f = min(f_filtered);
%f_filtered = (f_filtered - min_f) / max_f; 
figure(3)
imshow(f_filtered)

