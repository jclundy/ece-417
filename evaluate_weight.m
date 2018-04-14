function weight = evaluate_weight(C, V1, V2, h)
similarity = evaluate_similarity(V1, V2);
weight = 1/C * exp(-similarity / h^2);
end