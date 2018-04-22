function [] = displayZernikeMoments(moments,p,q)
% -------------------------------------------------------------------------
% Generates and displays the Zernike moments of a given image
% Input:
% moments - array of Zernike moments
% p - An array of Zernike orders
% q - An array of repetitions

for k=1:length(p)
    m1 = moments(:,:,k);
    max_m1 = max(m1(:));
    min_m1 = min(m1(:));
    m1 = (m1 - min_m1)/max_m1;
    figure();
    hold on;
    imshow(m1);
    title(['Zernike Moment for p = ',num2str(p(k)),' and q = ',...
        num2str(q(k)),'']);
    hold off;
end
