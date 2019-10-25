%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.6 c)
%
%Usando la bwboundaries() senza considerare le lacune (holes), ricavare dall'immagine: Nobj, numero di
%oggetti; imgLabel, immagine delle etichette; BoundObj, array con le posizioni dei pixel dei contorni
%degli oggetti; visualizzare Nobj e BoundObj;
%
%Nonis Mauro 123350
%30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
img = imread('Immagini/phantom.gif');
imgBW = imbinarize(img);
%Utilizzo funzione bwboundaries per ottenere i dati richiesti
[B,L,N] = bwboundaries(imgBW, 'noholes');
%Visualizzazione dei valori ottenuti
fprintf('\nValore per Nobj \n');
disp(N);
fprintf('Valore per BoundObj \n');
disp(B);