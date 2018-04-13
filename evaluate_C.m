function C = evaluate_C(f, x, y)
[m,n] = size(f);
V1 = evaluate_V(f,x,y);
C = 0;
h = 95;
for i=1:m
    for j=2:n
        x2 = i;
        y2 = j;
        V2 = evaluate_V(f,x2,y2);
        similarity = evaluate_similarity(V1, V2);
        C = C + evaluate_weight(1, similarity, h);
    end
end