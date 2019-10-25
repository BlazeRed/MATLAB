%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 b)
%
%All'immagine della barra aggiungere rumore gaussiano con varianza=0.01. 
%Ripetere il calcolo delle mappe di edge candidati con filtraggi di 
%Roberts e Sobel. Visualizzare i risultati;
%
% Nonis Mauro 123350
%9 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%creo l'immagine di riferimento senza rumore
img = zeros(30,30);
img(5:25, 13:17)=1;
%aggiunta rumore all'immagine
rumore = imnoise(double(img),'gaussian', 0, 0.1);
%filtro sobel orizzontale
sobx = fspecial('sobel');
%filtro sobel verticale
soby = sobx';
%applicazione filtro sobel
imsobx = imfilter(rumore, sobx);
imsoby = imfilter(rumore, soby);
%calcoli per sobel (vedi slide)
immAmpG = abs(imsobx) + abs(imsoby);
%visualizzazione sobel
figure,
subplot(2, 3, 1), imshow(rumore), title('Immagine con rumore');
subplot(2, 3, 2), imshow(immAmpG), title('Immagine con sobel');
subplot(2, 3, 3), imshow(imsobx, []), title('Immagine sobel X');
subplot(2, 3, 4), imshow(imsoby, []), title('Immagine sobel Y');
subplot(2, 3, 5), quiver(imsobx, imsoby), grid, title('Immagine direzioni');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%filtri roberts
robx = [1, 0;0, -1];
roby = [0, 1; -1, 0];
%applicazione filtro roberts
imrobx = imfilter(rumore, robx);
imroby = imfilter(rumore, roby);
%calcoli per roberts (vedi slide)
immAmpGR = abs(imrobx) + abs(imroby);
%visualizzazione sobel
figure,
subplot(2, 3, 1), imshow(rumore), title('Immagine con rumore');
subplot(2, 3, 2), imshow(immAmpGR), title('Immagine con roberts');
subplot(2, 3, 3), imshow(imrobx, []), title('Immagine roberts X');
subplot(2, 3, 4), imshow(imroby, []), title('Immagine roberts Y');
subplot(2, 3, 5), quiver(imrobx, imroby), grid, title('Immagine direzioni');







