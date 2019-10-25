%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.4 c)
%
%Effettuare il filtraggio di Laplace dell'immagine reale 'coins.png'. 
%Visualizzare l'immagine sorgente; la mappa delle ampiezze; la mappa
%stessa in modalità grafica usando la mesh(); la mappa dopo aver eliminato
%i valori negativi (passo (c) precedente).
%
%Nonis Mauro 123350
%16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
img = imread('coins.png');
coins = double(img);
%filtro di Laplace
laplaceFilt = fspecial('laplacian');
%applicazione filtro Laplace
imFilt = imfilter(coins, laplaceFilt);
%rappresentazione grafica
figure,
subplot(1, 4, 1), imshow(img), title('Immagine originale');
subplot(1, 4, 2), imshow(imFilt, []), title('Mappa delle ampiezze');
subplot(1, 4, 3), imshow(imFilt), title('Mappa senza valori negativi');
subplot(1, 4, 4), mesh(imFilt), title('Mappa in modalità grafica');