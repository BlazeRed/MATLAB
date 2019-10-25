% The colormap (Look-Up Table) of the ?moon? intensity image is
% visualized by means of the MATLAB procedures colorbar and gray 
%
img=imread('moon.tif'); 
imshow(img), colorbar 
colmap=gray;