function R = R_pq(p, q, rho)
R = zeros(size(rho));
for k = 0:(p-abs(q))/2
    Sum = ((-1)^k)*factorial(p-k)/(factorial(k)*factorial((p+abs(q))/2-k)*factorial((p-abs(q))/2-k));
    R = R + Sum*rho.^(p-2*k);
end
R(isnan(R))=0;
R = (rho~=0).*R;
R = R/sum(sum(R, 1), 2);
