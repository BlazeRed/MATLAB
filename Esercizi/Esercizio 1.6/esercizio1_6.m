%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.6
%
% Nonis Mauro 123350
%26 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagini
img1 = imread('Foto/img1.jpg');
img2 = imread('Foto/img2.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%stampa metadati
imfinfo('Foto/img1.jpg')
%visualizzazione immagini
subplot(1, 2, 1), imshow(img1), title('Immagini originali');
subplot(1, 2, 2), imshow(img2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%conversione in immagini di intensità
img1gray = rgb2gray(img1);
img2gray = rgb2gray(img2);
%visualizzazione immagini di intensità con istogrammi
figure, 
subplot(2, 2, 1), imshow(img1gray), title('Immagini in scala di grigi')
subplot(2, 2, 2), imshow(img2gray);
subplot(2, 2, 3), imhist(img1gray), grid;
subplot(2, 2, 4), imhist(img2gray), grid;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%differenza immagini
diff = double(img1gray) - double(img2gray);
%visualizzazione differenza con istogramma 
figure,
subplot(1, 2, 1), imshow(diff), title('Immagine differenza');
subplot(1, 2, 2), histogram(diff), grid;




