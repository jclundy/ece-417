function R = R_pq(p, q, rho)
sum = 0;
for k =abs(q):P
    diff_p = (p - k) / 2;
    diff_q = (k - q) / 2;
    sum_q = (k + q)/2;
    sum_p = (p + k) / 2;
    sum = sum + -1^diff_p * factorial(sum_p)/(factorial(diff_p) * factorial(diff_q) *factorial(sum_q)) * rho^k;
end
R = sum;