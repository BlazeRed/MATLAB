%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.3 c)
%
%Effettuare tre filtraggi LoG dell'immagine 'mri.tif', usando la edge()
%rispettivamente con il parametro sigma = 0.5 ; 2 ; 3 della gaussiana.
% Riportare le osservazioni nelle conclusioni.
%
%Nonis Mauro 123350
%16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
img = imread('mri.tif');
tac = double(img);
%filtraggio con il filtro LoG
log1 = edge(tac, 'log', 0.5);
log2 = edge(tac, 'log', 2);
log3 = edge(tac, 'log', 3);
%visualizzazione
subplot(2, 2, 1), imshow(img), title('Immagine originale');
subplot(2, 2, 2), imshow(log1), title('LoG con soglia 0.5');
subplot(2, 2, 3), imshow(log2), title('LoG con soglia 2');
subplot(2, 2, 4), imshow(log3), title('LoG con soglia 3');

%con una soglia maggiore si va a perdere informazione, anche riguardanti
%edge significativi