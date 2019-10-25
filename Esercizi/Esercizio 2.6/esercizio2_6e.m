%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.6 e)
%
%Ripetere i passi al punto (c) e (d) considerando anche le lacune.
%
%Nonis Mauro 123350
%30 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico immagine
img = imread('Immagini/phantom.gif');
imgBW = imbinarize(img);
[B,L,N] = bwboundaries(imgBW);
%viaualizzazione
subplot(1, 3, 1), imshow(L), title('imgLabel in formato sorgente');
subplot(1, 3, 2), imshow(label2rgb(L)), title('imgLabel in formato RGB');
subplot(1, 3, 3), imshow(label2rgb(L)), title('imgLabel con sovrapposizione di BoundObj'); 
%Sovrapposizione di BoundObj all'immagine imgLabel RGB
hold on
for k=1:length(B)
   boundary = B{k};
     %per indicare i Nobj
     plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
end
%Visualizzazione dei valori ottenuti
fprintf('\nValore per Nobj \n');
disp(N);
fprintf('Valore per BoundObj \n');
disp(B);
hold off