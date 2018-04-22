function r = R_pq(p, q, rho)
% -------------------------------------------------------------------------
% This function takes in an array of radii, order and repetition and
% outputs the corresponding radial polynomial
% Inputs:
% p - An array of Zernike orders
% q - An array of repetitions
% rho - A matrix of radius lengths

r = zeros(size(rho));
for k = 0:(p-abs(q))/2
    temp = ((-1)^k)*factorial(p-k)/(factorial(k)*factorial((p+abs(q))...
        /2-k)*factorial((p-abs(q))/2-k));
    r = r + temp*rho.^(p-2*k);
end
r(isnan(r))=0;
r = (rho~=0).*r;
end