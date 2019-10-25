%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.6 a) b)
%
%Studiare la documentazione MATLAB sulla procedura bwboundaries() per l'inseguimento di contorni
%(contour following) in immagini binarie;
%
%Visualizzare l'immagine sorgente e il suo istogramma dei livelli di grigio;
%
%Nonis Mauro 123350
%30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
img = imread('Immagini/phantom.gif');
imgBW = imbinarize(img);
%visualizzazione
figure,
subplot(1, 2, 1), imshow(imgBW), title('Immagine originale binaria');
subplot(1, 2, 2), histogram(imgBW), grid, title('Istogramma livelli grigio');


