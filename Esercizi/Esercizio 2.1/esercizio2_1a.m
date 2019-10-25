%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.1 a)
%
%L'immagine della scacchiera - checkerboard() - deve essere rappresentata
%in forma binaria e risoluzione 256x256 pixel. Applicare alla scacchiera 
%rumore additivo gaussiano a media nulla, con varianza 0.1 (rumore basso);
%e con varianza 1. (rumore alto). Visualizzare l'immagine sorgente della 
%scacchiera e le due immagini con rumore, assieme ai rispettivi istogrammi
%dei livelli di grigio;
%
% Nonis Mauro 123350
%1 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%creazione della scacchiera
s = checkerboard(32);
%rendo binaria l'immagine
board = (s > 0.5);
%aggiunta del rumore alle immagini
rbasso = imnoise(double(board),'gaussian', 0, 0.1); 
ralto = imnoise(double(board),'gaussian', 0, 1);
%visualizzazione
% figure,
% subplot(2, 3, 1), imshow(board), title('originale');
% subplot(2, 3, 2), imshow(rbasso), title('Rumore basso');
% subplot(2, 3, 3), imshow(ralto), title('Rumore alto');
% subplot(2, 3, 4), imhist(board), title('Istogramma originale'), grid;
% subplot(2, 3, 5), imhist(rbasso), title('Istogramma basso'), grid;
% subplot(2, 3, 6), imhist(ralto), title('Istogramma alto'), grid;

class(board)