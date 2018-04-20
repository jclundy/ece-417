function newImage = NLFilter(image, weightMatrix)
newImage = zeros(size(image));
% figure(4)
for i = 1:size(weightMatrix, 3)
    newImage = newImage + double(image).*weightMatrix(:, :, i);
%     imshow(newImage);
end