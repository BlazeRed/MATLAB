%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.3 a)
%
%Convertire l'immagine in un'altra a livelli di grigio tramite la procedura rgb2gray(). 
%Visualizzare l'immagine sorgente, quella convertita in livelli di grigio con la propria
%scala e il proprio istogramma;
%
% Nonis Mauro 123350
%25 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico l'immagine
img = imread('westconcordaerial.png');
%converto l'immagine in scala di grigi
gray = rgb2gray(img);
%visualizzazione
subplot(2, 2, 1), imshow(img), title('Originale'), colorbar 'eastoutside';
subplot(2, 2, 3), imshow(gray), colorbar, title('Scala di grigio');
subplot(2, 2, 4), imhist(gray), title('Istogramma scala di grigio'), grid;
