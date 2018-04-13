function Z = Z_pq_normalized(p, q, f, x, y, r)
Z_p_minus_2_q = Z_pq(p-2, q, f, x, y, r);
if(Z_p_minus_2_q == 0 || q == p)
    Z = Z_pq(p, q, f, x, y, r);
else
    if(q < p)
        Z = Z_pq(p, q, f, x, y, r) / Z_p_minus_2_q;
    end
end
end