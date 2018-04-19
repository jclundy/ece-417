function newImage = Zernike_moment(image,p,q)
degreeOfFiltering = 95;
N = size(image,1);
x = 1:N; y = x;
[X,Y] = meshgrid(x,y);

% Generate a number of pixels of interest around a pixel
% This will create a matrix of radii which are non-zero only within the
% desired range, plugging this set of equations into the R_pq polynomial
% solver allows us to calculate the set of V_pq equations around the image.

R = hypot(2*X-N-1, 2*Y-N-1);
Theta = atan2(2*Y-N-1,2*X-N-1);
R = (R<=5).*R;
Theta = (R<=5).*Theta;

% Product = zeros(size(image));
% 
% for k=1:length(p)
%     Rad = R_pq(p(k), q(k), R);    % get the radial polynomial
%     Product(:, :, k) = conv2(double(image(x,y)),Rad.*exp(q(k)*i*Theta), 'same');
%     Product(:, :, k) = Product(:, :, k)*(p(k)+1)/pi;
% end


Rad = R_pq(p, q, R);    % get the radial polynomial
Product = conv2(double(image(x, y)),Rad.*exp(q*1i*Theta), 'same');
newImage = Product;
%     Product(:, :, k) = Product(:, :, k)*(p(k)+1)/pi;



% Rad = R_pq(p, q, R);    % get the radial polynomial

% convoluting with the original image yields the Zernike moments
% Product = conv2(double(image(x,y)),Rad.*exp(1i*q*Theta), 'same');
% Product = Product*(p+1)/pi;
% weightMatrix = normalizeWeight(image, Product, degreeOfFiltering);
% newImage = NLFilter(image, weightMatrix);
% if (p == 3 || p == 2) && (q < p)
%     
%     normalizingRad = R_pq(p, q, R)
%     normalizingProduct = conv2(double(image(x,y)),Rad.*exp(1i*q*Theta), 'same');
% end


% newImage = Product*(p+1)/pi;


% cnt = nnz(R)+1;             % count the number of pixels inside the unit circle
% Z = (n+1)*Z/cnt;            % normalize the amplitude of moments
% A = abs(Z);                 % calculate the amplitude of the moment
% Phi = angle(Z)*180/pi;      % calculate the phase of the mement (in degrees)
