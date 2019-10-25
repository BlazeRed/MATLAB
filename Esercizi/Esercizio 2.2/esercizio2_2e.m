%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.2 e)
%
%Considerare l'immagine 'circuit.tif'. Sulla sola mappa delle
%ampiezze degli edge candidati effettuare una sogliatura (binarizzazione)
%tramite la im2bw(); sperimentare tre diversi valori di soglia: 0.4, 0.6, 0.9.
%Visualizzare le mappe sogliate (binarizzate).
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
%binarizzazione delle ampiezze con diverse soglie
bnr4 = imbinarize(immAmpG, 0.4);
bnr6 = imbinarize(immAmpG, 0.6);
bnr9 = imbinarize(immAmpG, 0.9);
%visualizzazione
subplot(1, 4, 1), imshow(immAmpG), title('Mappa ampiezze');
subplot(1, 4, 2), imshow(bnr4), title('Mappa con soglia 0.4');
subplot(1, 4, 3), imshow(bnr6), title('Mappa con soglia 0.6');
subplot(1, 4, 4), imshow(bnr9), title('Mappa con soglia 0.9');