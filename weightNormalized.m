function newImage = weightNormalized(image, zernikeMoments, h)
m = size(zernikeMoments, 1);
n = size(zernikeMoments, 2);
newImage = zeros(m, n);
for x1 = 1:m
    for y1 = 1:n
        V_pixel = zernikeMoments(x1,y1,:);
        weights = zeros(m , n);
        for xind = x1-10:x1+10
            for yind = y1-10:y1+10
                x2 = xind;
                y2 = yind;
                if(x2 <= 0)
                    x2 = 1 - x2;
                end
                if(x2 > m)
                    x2 = 2*m  - x2;
                end
                if(y2 <= 0)
                    y2 = 1 - y2;
                end
                if(y2 > n)
                    y2 = 2*n - y2;
                end
                V_other_pixel = zernikeMoments(x2,y2,:);
                weights(x2, y2) = evaluate_weight(1, V_pixel, V_other_pixel,h);
            end
        end
        C = sum(sum(weights, 1), 2);
        weights = weights / C;
        newImage(x1, y1) = sum(dot(double(image), weights));
    end
end