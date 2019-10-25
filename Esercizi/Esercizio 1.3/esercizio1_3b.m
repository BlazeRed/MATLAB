%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.3 b)
%
%Usare la procedura MATLAB grayslice() per partizionare la scala dei livelli di grigio in 
%128 e in 64 bande. Visualizzare le due immagini risultanti ciascuna col proprio %istogramma;
%
%Nonis Mauro 123350
%25 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico l'immagine
img = imread('westconcordaerial.png');
%converto l'immagine in scala di grigio
gray = rgb2gray(img);
%applico la funzione grayslice() con i diversi parametri
scale128 = grayslice(gray, 128);
scale64 = grayslice(gray, 64);
%visualizzazione
subplot(2, 2, 1), imshow(scale128), title('grayslice 128');
subplot(2, 2, 2), imhist(scale128), title('Istogramma grayslice 128'), grid;
subplot(2, 2, 3), imshow(scale64), title('grayslice 64');
subplot(2, 2, 4), imhist(scale64), title('Istogramma grayslice 64'), grid;
