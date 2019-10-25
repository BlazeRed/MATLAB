%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.5 a) b) c)
%
%Usando la procedura imtool() individuare una regione rettangolare 
%dell'immagine che corrisponda al carattere 'e'. Ritagliare la sottoimmagine
%corrispondente usando la procedura imcrop(). Visualizzare l'immagine sorgente e l'immagine ritagliata.
%
%Calcolare la correlazione normalizzata tra le due immagini usando la procedura normxcorr2();
%visualizzare la correlazione rappresentandola in livelli di grigio assieme al proprio istogramma,
%e in grafica 3d tramite la procedura surf()
%
%Binarizzare l?immagine della correlazione tramite sogliatura usando la imbinarize() con valore di soglia thresh=0.8. Visualizzare l?immagine binarizzata.
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
%rappresentazione
figure,
subplot(1, 2, 1), imshow(img), title('Immagine sorgente');
subplot(1, 2, 2), imshow(crop), title('Immagine ritagliata');
%%%%
%b)
%%%%
%correlazione normalizzata
corrnorm = normxcorr2(crop, text);
figure,
subplot(1, 3, 1), imshow(corrnorm), title('Correlazione in livelli di grigio');
subplot(1, 3, 2), imhist(corrnorm), grid, title('Istogramma correlazioni');
subplot(1, 3, 3), surf(corrnorm), grid, title('Correlazione in 3D');
%%%%
%c)
%%%%
%Binarizzazione correlazione
binar = imbinarize(corrnorm, 0.8);
figure,
imshow(binar, 'InitialMagnification', 'fit'), title('Correlazione binarizzata');
