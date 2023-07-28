RGB = imread('roman.jpg');
R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);
enhanced_r = histeq(R);

figure(1);
imshow(enhanced_r);

imwrite(enhanced_r, 'enhanced_r.jpg')

expo = exprnd(0.4,500);
expohist = imhist(expo);
expo_match = histeq(R, expohist);
figure(2);
imshow(expo_match);

imwrite(expo_match, 'expo_match.jpg')

gauss = normrnd(0.5,0.3,500);
gausshist = imhist(gauss);
gauss_match = histeq(R, gausshist);
figure(3);
imshow(gauss_match);

imwrite(gauss_match, 'gauss_match.jpg')

logn = lognrnd(-1,0.5,500);
lognhist = imhist(logn);
logn_match = histeq(R, lognhist);
figure(4);
imshow(logn_match);

imwrite(logn_match, 'logn_match.jpg')

enhanced_g = histeq(G);
enhanced_b = histeq(B);
enhanced_rgb= cat(3, enhanced_r, enhanced_g, enhanced_b);
figure(5);
imshow(enhanced_rgb);

imwrite(enhanced_rgb, 'enhanced_rgb.jpg')

clahe_r = adapthisteq(R);
clahe_g = adapthisteq(G);
clahe_b = adapthisteq(B);

clahe_rgb = cat(3, clahe_r, clahe_g, clahe_b);
figure(6);
imshow(clahe_rgb);

imwrite(clahe_rgb, 'clahe_rgb.jpg')
