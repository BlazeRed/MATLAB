%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 a)
%
%Considerare l'immagine sintetica della barra. 
%Calcolare la mappa delle ampiezze e delle direzioni dei 
%punti di edge candidati, operando sull'immagine senza 
%rumore con un filtraggio derivativo tipo gradiente di Roberts 
%e di Sobel. Visualizzare i risultati;
%
% Nonis Mauro 123350
%9 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%creo l'immagine di riferimento senza rumore
img = zeros(30,30);
img(5:25, 13:17)=1;
%filtro sobel orizzontale
sobx = fspecial('sobel');
%filtro sobel verticale
soby = sobx';
%applicazione filtro sobel
imsobx = imfilter(img, sobx);
imsoby = imfilter(img, soby);
%calcoli per sobel (vedi slide)
immAmpG = abs(imsobx) + abs(imsoby);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%filtri roberts
robx = [1, 0;0, -1];
roby = [0, 1; -1, 0];
%applicazione filtro roberts
imrobx = imfilter(img, robx);
imroby = imfilter(img, roby);
%calcoli per roberts (vedi slide)
immAmpGR = abs(imrobx) + abs(imroby);
%visualizzazione
figure,
subplot(2,4,1), imshow(immAmpG), title('Ampiezza sobel');
subplot(2,4,2), imshow(imsobx, []), title('Immagine sobel X');
subplot(2,4,3), imshow(imsoby, []), title('Immagine sobel Y');
subplot(2,4,4), quiver(imsoby, imsobx), grid, title('Immagine DirG');
subplot(2,4,5), imshow(immAmpGR), title('Ampiezza roberts');
subplot(2,4,6), imshow(imrobx, []), title('Immagine roberts X');
subplot(2,4,7), imshow(imroby, []), title('Immagine roberts Y');
subplot(2,4,8), quiver(imroby, imrobx), grid, title('Immagine DirG');
