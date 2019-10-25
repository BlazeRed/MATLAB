%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 d)
%
%Considerare l'immagine 'circuit.tif' senza aggiunta di rumore.
%Calcolare la mappa delle ampiezze e delle direzioni degli edge 
%candidati tramite gradiente di Sobel;
%
% Nonis Mauro 123350
%9 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
circuit = imread('circuit.tif');
%filtro sobel orizzontale
sobx = fspecial('sobel');
%filtro sobel verticale
soby = sobx';
%applicazione filtro sobel
imsobx = imfilter(circuit, sobx);
imsoby = imfilter(circuit, soby);
%calcoli per sobel (vedi slide)
immAmpG = abs(imsobx) + abs(imsoby);
%visualizzazione immagini
subplot(1, 3, 1), imshow(circuit), title('Immagine originale');
subplot(1, 3, 2), imshow(immAmpG), title('Immagine ampiezze');
subplot(1, 3, 3), quiver(imsobx, imsoby), grid, title('Mappa delle direzioni');