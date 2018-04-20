function weightMatrix = normalizeWeight(image, zernikeMoments, h)
image = double(image);
weightMatrix = zeros(size(image));
zernikeMoments(:,:,3) = zernikeMoments(:,:,3)./zernikeMoments(:,:,1);

for ix = 1:length(image)
    for iy = 1:length(image)
        temp = 0;
        for jx = 1:length(image)
            for jy = 1:length(image)
                temp = 
        end
    end
    weightMatrix(:,:,i) = ((zernikeMoments(i) - image).^2)/h^2;
    weightMatrix(:,:,i) = exp(-weightMatrix(:,:,i));
    weightMatrix(:,:,i) = weightMatrix(:,:,i)/sum(sum(weightMatrix(:,:,i), 1), 2);
end