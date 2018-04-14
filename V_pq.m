function V_star = V_pq(p, q, rho, theta)
R_pq_val = R_pq(p, q, rho);
exp_val = exp(1i*q*theta);
V = R_pq_val * exp_val;
V_star = conj(V);
if(isnan(V_star))
    V_star = 0;
end
end