%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.6 d)
%
%Visualizzare l'immagine delle etichette imgLabel in formato sorgente e in formato RGB; sovrapporre a
%questa i contorni degli oggetti dell'array BoundObj calcolato al punto (c), e visualizzare questa
%immagine assieme alle prime due nella stessa finestra;
%
%Nonis Mauro 123350
%30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
img = imread('Immagini/phantom.gif');
imgBW = imbinarize(img);
%calcolo boundaries
[B,L,N] = bwboundaries(imgBW, 'noholes');
%Visualizzazione
subplot(1, 3, 1), imshow(L), title('imgLabel in formato sorgente');
subplot(1, 3, 2), imshow(label2rgb(L)), title('imgLabel in formato RGB');
subplot(1, 3, 3), imshow(label2rgb(L)), title('imgLabel con sovrapposizione di BoundObj'); 
%sovrapposizione boundary all'immagine RGB
hold on
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
end
hold off