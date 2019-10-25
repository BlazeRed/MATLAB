%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.4 c)
%
%Invertire l'immagine filtrata (negativo->positivo) ed eliminare i valori 
%negativi mediante sogliatura usando imbinarize(); visualizzare la nuova 
%immagine anche in modalità grafica.
%
%Nonis Mauro 123350
%16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%creo immagine
img = zeros(60, 60);
img(5:5, 17:17) = 1;
img(25:25, 11:11) = 1;
img(55:55, 24:24) = 1;
img = double(img);
%aggiunta rumore all'immagine
imRumore = imnoise(img,'gaussian', 0, 0.01);
%filtro di laplace
laplaceFilt = fspecial('laplacian');
%applicazione filtro Laplace
imFilt = imfilter(imRumore, laplaceFilt);
%immagine invertita
invertIm = -imFilt;
%binarizzazione immagine ivertita
bin = imbinarize(invertIm, 1);
figure,
subplot(1, 2, 1), imshow(invertIm, []), title('Immagine invertita');
subplot(1, 2, 2), imshow(bin, []), title('Immagine binarizzata');

