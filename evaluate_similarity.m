function similarity = evaluate_similarity(V1, V2)
% -------------------------------------------------------------------------
% A function that calculates the similarity between two pixels
% Input:
% V1 - intensity of pixel 1
% V2 - intensity of pixel 2
dV = (V1 - V2).^2;
similarity = sum(dV);
end