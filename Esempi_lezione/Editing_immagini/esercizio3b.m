% The colormap (LUT) of the ?trees? image is defined by means of imshow
% and pre-defined color scales in MATLAB (hot, jet). Images in false colors appear. % The scales are visualized by colorbar and disp(colormap)
%
img=imread('trees.tif');
figure, imshow(img), colorbar
figure, imhist(img), grid
figure, imshow(img, hot), colorbar
disp(colormap)
figure, imshow(img,jet), colorbar
disp(colormap)