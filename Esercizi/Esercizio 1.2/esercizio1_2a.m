%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.2 a)
%
%Convertirla da codifica RGB in codifica HSV 
%(Hue, Saturation, Value) usando la procedura 
%MATLAB rgb2hsv(). Visualizzare l?originale RGB 
%e la trasformata HSV coi rispettivi istogrammi;
%
% Nonis Mauro 123350
%25 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico l'immagine
rgb = imread('peppers.png');
%trasformazione da rgb ad hsv
hsv = rgb2hsv(rgb);
%visualizzazione con relativi istogrammi
subplot(2, 2, 1), imshow(rgb), title('RGB');
subplot(2, 2, 2), imhist(rgb), title('Istogramma RGB'), grid;
subplot(2, 2, 3), imshow(hsv), title('HSV');
subplot(2, 2, 4), imhist(hsv), title('Istogramma HSV'), grid;


