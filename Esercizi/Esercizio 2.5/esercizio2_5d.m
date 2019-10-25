%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.5 d)
%
%Ripetere i calcoli della correlazione (passo (b)) e della binarizzazione 
%(passo (c)) avendo ruotato di 90° l?immagine ritagliata del carattere ?e? 
%con la imrotate(). Visualizzare i nuovi risultati come già fatto per la consegna (b).
%
%Nonis Mauro 123350
%16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
img = imread('text.png');
text = double(img);
%effettuo il crop dell'immagine
crop = imcrop(text, [140.84375 32.59375 10.375 12.75]);
rotate = imrotate(crop, 90);
%rappresentazione
figure,
subplot(1, 2, 1), imshow(img), title('Immagine sorgente');
subplot(1, 2, 2), imshow(rotate), title('Immagine ritagliata');
%correlazione normalizzata
corrnorm = normxcorr2(rotate, text);
figure,
subplot(1, 3, 1), imshow(corrnorm), title('Correlazione in livelli di grigio');
subplot(1, 3, 2), imhist(corrnorm), grid, title('Istogramma correlazioni');
subplot(1, 3, 3), surf(corrnorm), grid, title('Correlazione in 3D');
%Binarizzazione correlazione
binar = imbinarize(corrnorm, 0.8);
figure,
imshow(binar, 'InitialMagnification', 'fit'), title('Correlazione binarizzata');