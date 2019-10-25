%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.1 b)
%
%Effettuare il filtraggio delle due immagini con rumore 
%(non dell'immagine sorgente!) tramite filtro di media
%(average) con maschera 3x3. Visualizzare:
%
%b1) Immagine sorgente; con rumore basso; filtrata;
%b2) Immagine sorgente; con rumore alto; filtrata.
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
%Creazione filtro medio 3x3 e appicazione
filter = fspecial('average', [3 3]);
imbasso = imfilter(rbasso, filter);
imalto = imfilter(ralto, filter);
%Visualizzazione
figure,
subplot(2, 3, 1), imshow(board), title('Originale');
subplot(2, 3, 2), imshow(rbasso), title('Rumore basso');
subplot(2, 3, 3), imshow(imbasso), title('Filtrata');
subplot(2, 3, 4), imshow(board), title('Originale');
subplot(2, 3, 5), imshow(ralto), title('Rumore alto');
subplot(2, 3, 6), imshow(imalto), title('Filtrata');

