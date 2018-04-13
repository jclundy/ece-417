function Z = Z_pq(p, q, f, x, y, r)
Z_sum = 0;
for dx=-r:r
    for dy=-r:r
        if (abs(dx)==3 && abs(dy) == 3 || abs(dx)== 2 && abs(dy) == 3 || abs(dx)==3 && abs(dy) == 2)
            continue
            % these indices are skipped so that the area of pixels roughly
            % corresponds to a circle
        end
        new_x = x + dx;
        new_y = y + dy;
        rho = sqrt(dx^2 + dy^2) / r; % rho normalized to be from 0 - 1
        theta = asin(dy/rho);
        Z_sum = Z_sum + V_pq(p, q, rho, theta) * f(new_x, new_y);
    end
Z = (p + 1)/pi * Z_sum;
end