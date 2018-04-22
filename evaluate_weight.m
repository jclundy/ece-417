function weight = evaluate_weight(C, V1, V2, h)
% -------------------------------------------------------------------------
% A function that calculates the weight of a given pixel when compared to
% another
% Input:
% V1 - intensity of pixel 1
% V2 - intensity of pixel 2
% h - degree of filtering
similarity = evaluate_similarity(V1, V2);
weight = 1/C * exp(-similarity / h^2);
end