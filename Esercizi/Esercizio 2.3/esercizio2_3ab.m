%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.3 a) b)
%
%Usare l'immagine blobs.png. Calcolare la mappa di ampiezze di edge con l'operatore di Sobel usando la
%edge() di MATLAB. Calcolare la stessa mappa di ampiezze di edge di Sobel usando fspecial(), imfilter().
%Binarizzare quest'ultima mappa per selezionare i massimi delle ampiezze (soglia=0.9). Visualizzare nella
%stessa finestra l'immagine sorgente e le due mappe di ampiezze. 
%
%stimare la precisione delle mappe di ampiezze di Sobel calcolate al punto (a), usando il MSE. 
%Assumere come riferimento l'immagine sorgente. Riportare i risultati usando la uitable(), e verbalmente nelle conclusioni.
%
%Nonis Mauro 123350
%16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
img = imread( 'blobs.png');
blob = double(img);
%mappa ampiezze con edge sobel
edgeSobel = edge(blob, 'Sobel');
%filtro sobel orizzontale
sobx = fspecial('sobel');
%filtro sobel verticale
soby = sobx';
%applicazione filtro sobel
imsobx = imfilter(blob, sobx);
imsoby = imfilter(blob, soby);
%calcoli per sobel (vedi slide)
immAmpG = abs(imsobx) + abs(imsoby);
%binarizzazione immAmpG
immAmpBin = imbinarize(immAmpG, 0.9);
%visualizzazione
subplot(1, 3, 1), imshow(blob), title('Immagine originale');
subplot(1, 3, 2), imshow(edgeSobel), title('Filtro con edge()');
subplot(1, 3, 3), imshow(immAmpBin), title('Filtro sobel binarizzato');
%calcolo MSE dato dal rumore prima del filtraggio
mseEdge = immse(double(edgeSobel), blob);
mseImmAmp = immse(double(immAmpBin), blob);
%visualizzazione valori
f = figure;
uit = uitable(f);
d = {mseEdge, mseImmAmp};
uit.ColumnName = {'MSE edge', 'MSE ImmAmp'};
uit.Data = d;

