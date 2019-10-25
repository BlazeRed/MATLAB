%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 c)
%
%Considerare l'immagine blobs.png a cui aggiungere rumore 
%gaussiano additivo con varianza=0.1. Effettuare il calcolo delle sole 
%ampiezze degli edge candidati, usando l'operatore di gradiente di Sobel. 
%Visualizzare;
%
% Nonis Mauro 123350
%9 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
img = imread('blobs.png');
blob = double(img);
%aggiunta rumore all'immagine
rumore = imnoise(blob,'gaussian', 0, 0.1);
%filtro sobel orizzontale
sobx = fspecial('sobel');
%filtro sobel verticale
soby = sobx';
%applicazione filtro sobel
imsobx = imfilter(rumore, sobx);
imsoby = imfilter(rumore, soby);
%calcoli per sobel (vedi slide)
immAmpG = abs(imsobx) + abs(imsoby);
%visualizzazione immagini
subplot(1, 3, 1), imshow(blob), title('Immagine originale');
subplot(1, 3, 2), imshow(rumore), title('Immagine con rumore');
subplot(1, 3, 3), imshow(immAmpG), title('Immagine ampiezze sobel');