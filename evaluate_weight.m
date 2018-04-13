function weight = evaluate_weight(C, similarity, h)
weight = 1/C * exp(-similarity / h^2);
end