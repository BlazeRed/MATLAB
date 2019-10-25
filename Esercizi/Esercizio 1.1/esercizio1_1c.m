%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script 1.1c relativo all'esercizio 1.1c
%Nonis Mauro - 12/03/19
%Visualizzare ciascuna componente di colore R, G, B in forma di immagine
%a livelli di grigio (intensità) e il relativo istogramma dei livelli di intensità.

img = imread('peppers.png');

%metodo per estrarre i diversi livelli colore (in scala di grigi)
imgRed = img(:,:,1);
imgGreen = img(:,:,2);
imgBlue = img(:,:,3);

%rappresentazione del risultato su due righe con relativi istogrammi
subplot(2, 4, 1), imshow(img), title("Sorgente");
subplot(2, 4, 2), imshow(imgRed), title("Componente red");
subplot(2, 4, 3), imshow(imgGreen), title("Componente green");
subplot(2, 4, 4), imshow(imgBlue), title("Componente blue");

subplot(2, 4, 5), imhist(img), title("Istogramma sorgente"), grid;
subplot(2, 4, 6), imhist(imgRed), title("Istogramma red"), grid;
subplot(2, 4, 7), imhist(imgGreen), title("Istogramma green"), grid;
subplot(2, 4, 8), imhist(imgBlue), title("Istogramma blue"), grid;

