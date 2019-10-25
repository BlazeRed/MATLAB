%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.1 d)
%
%Visualizzare ciascuna componente di colore R,G,B in forma di immagine a colori e il relativo
%istogramma dei livelli di intensità.
%
% Nonis Mauro 123350
%12 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
imgRGB = imread('peppers.png');
imgRed = imgRGB;
imgBlue = imgRGB;
imgGreen = imgRGB;
%calcolo dei canali rendendo zero le altre componenti
imgRed(:,:,2) = 0;
imgRed(:,:,3) = 0;
imgGreen(:,:,1) = 0;
imgGreen(:,:,3) = 0;
imgBlue(:,:,1) = 0;
imgBlue(:,:,2) = 0;
%visualizzazione
subplot(2, 4, 1), imshow(imgRGB), title('RGB');
subplot(2, 4, 2), imshow(imgRed), title('Componente R');
subplot(2, 4, 3), imshow(imgGreen), title('Componente G');
subplot(2, 4, 4), imshow(imgBlue), title('Componente B');
subplot(2, 4, 5), imhist(img), title('Istogramma RGB'), grid;
subplot(2, 4, 6), imhist(imgRed), title('Istogramma R'), grid;
subplot(2, 4, 7), imhist(imgGreen), title('Istogramma G'), grid;
subplot(2, 4, 8), imhist(imgBlue), title('Istogramma B'), grid;