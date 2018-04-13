function similarity = evaluate_similarity(V1, V2)
dV = (V1 - V2).^2
similarity = sum(dV);
end