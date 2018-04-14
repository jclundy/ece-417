function Z = Z_pq(p, q, f, x, y, r)
Z_sum = 0;
[m,n] = size(f);
for dx=-r:r
    for dy=-r:r
        if(dx == 0 && dy == 0)
            continue
        end
        if (abs(dx)==3 && abs(dy) == 3 || abs(dx)== 2 && abs(dy) == 3 || abs(dx)==3 && abs(dy) == 2)
            continue
            % these indices are skipped so that the area of pixels roughly
            % corresponds to a circle
        end
        new_x = x + dx;
        if(new_x < 1)
            new_x = 1 - new_x; % symetric boundary
        end
        if(new_x > m)
            new_x = 2*m - new_x; % symetric boundary
        end
        new_y = y + dy;
        if(new_y < 1)
            new_y = 1 - new_y; % symetric boundary
        end
        if(new_y > n)
            new_y = 2*n - new_y; % symetric boundary
        end
        
        rho = sqrt(dx^2 + dy^2); 
        theta = asin(dy/rho);
        
        rho = rho / r;% rho normalized to be from 0 - 1
        f_xy = f(new_x, new_y);
        V_p_q_val = V_pq(p, q, rho, theta);
        if(isnan(V_p_q_val))
            V_p_q_val = 0;
        end
        V = abs(V_p_q_val);
        Z_sum = Z_sum + V * f_xy;
    end
end
Z = (p + 1)/pi * Z_sum;
