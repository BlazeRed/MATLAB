%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.2 b)
%
%Visualizzare i singoli canali H, S, V in livelli di grigio, assieme ai rispettivi istogrammi;
%
%Nonis Mauro 123350
%25 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico l'immagine
rgb = imread('peppers.png');
%trasformazione da rgb ad hsv
hsv = rgb2hsv(rgb);
%estrazione livelli colore in scala di grigio
imgH = hsv(:,:,1);
imgS = hsv(:,:,2);
imgV = hsv(:,:,3);
%visualizzazione componenti e istogrammi
subplot(2, 4, 1), imshow(hsv), title('HSV');
subplot(2, 4, 2), imshow(imgH), title('Hue');
subplot(2, 4, 3), imshow(imgS), title('Saturation');
subplot(2, 4, 4), imshow(imgV), title('Value');
subplot(2, 4, 5), imhist(hsv), title('Istogramma HSV'), grid;
subplot(2, 4, 6), imhist(imgH), title('Istogramma Hue'), grid;
subplot(2, 4, 7), imhist(imgS), title('Istogramma Saturation'), grid;
subplot(2, 4, 8), imhist(imgV), title('Istogramma Value'), grid;
