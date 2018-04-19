function weightMatrix = normalizeWeight(image, zernikeMoments, h)
image = double(image);
weightMatrix = zeros(size(zernikeMoments));
for i = 1:size(zernikeMoments, 3)
    weightMatrix(:,:,i) = ((zernikeMoments(i) - image).^2)/h^2;
    weightMatrix(:,:,i) = exp(-weightMatrix(:,:,i));
    weightMatrix(:,:,i) = weightMatrix(:,:,i)/sum(sum(weightMatrix(:,:,i), 1), 2);
end