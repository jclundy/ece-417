%% 1) Problem Formulation
% A method is required to filter out noise in textured images
%% 2) Proposed Solution
% The proposed algorithm calculates 6 Zernkie moments of different orders 
% for of each pixel in the image. It uses these values to apply a non-local 
% means filter on the image.  
% For each pixel in the image, the zernkie values are used to calculate a 
% weight for the similarity between a pixel and every other pixel in a 
% local search region.
%%
% 
% <<images/weight_formula.PNG>>
% 
% Each weight value is normalized by the sum of all weights for the pixels
% in a region:
%%
% 
% <<images/normalize_weights.PNG>>
% 
% The filtered pixel value is given by:
%%
% 
% <<images/filtered_pixel_formula.PNG>>
% where u(i) is a unfiltered pixel value, NL(u) is the filtered pixel value
% Zernike moments are calculated with the following equations:
%%
% 
% <<images/zernkie_formula.PNG>>
% 
% This is filter evaluated on a circular region of pixels with radius r, and x, y are
% given by x = dx / r, y = dy / r, where dx and dy are the distance in
% pixels of each pixel to the center of the region.  This is done so that
% the values of x and y are within the unit circle:
%%
% 
% <<images/unit_circle.PNG>>
% 
% 
%%
% 
% <<images/V_pq_formula.PNG>>
% 
%%
% 
% <<images/R_pq_formula.PNG>>
% 
% The calculated zernkie moments are normalized according to the equation:


%% 3) Data Sources
% The test image used was Lena.  The image is then corrupted with WGN noise
% with variance between 5, and 100.

%% 4) Solution

%% 5) Visualization

%% 6) Analysis and conclusions
% Reproducing the results
% 
% Predictability of the algorithm
% Our conclusions
% Drawbacks of the solution

% We were able to reproduce the filtering effects on the image Lena.jpg.
% The paper reported a PSNR of XXX for their method w, when applied on a 
% noisy image with sigma = 20.  Our implementation resulted in a PSNR of
% XXX.  The noisy image had a PSNR of XXX.
% 
% The algorithm is fairly predictable in terms of how the zernike moments
% of different images appear. As well, the algorithm is entirely
% deterministic.  
% The major drawback of this algorithm is the slow performance.  For an nxn
% image, the algorithm took XXX seconds to complete.
%% 7) List of source functions
