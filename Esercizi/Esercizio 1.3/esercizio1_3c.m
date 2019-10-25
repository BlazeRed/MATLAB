%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.3 c)
%
%Sempre a partire dall'immagine in livelli di grigio ottenuta al punto a), partizionarla in 
%16 bande. Visualizzare l'immagine risultante usando due colormap, la jet() e la hot().
%
% Nonis Mauro 123350
%25 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico l'immagine
img = imread('westconcordaerial.png');
%converto l'immagine in scala di grigio
gray = rgb2gray(img);
%applico la funzione grayslice() con parametro 16
scale = grayslice(gray, 16);
%visualizzazione con colormap differenti
figure, imshow(scale, jet), title('colormap jet');
figure, imshow(scale, hot), title('colormap hot');
