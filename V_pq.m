function V_star = V_pq(p, q, rho, theta)
V = R_pq(p, q, rho) * exp(1i*q*theta);
V_star = conj(V);
end