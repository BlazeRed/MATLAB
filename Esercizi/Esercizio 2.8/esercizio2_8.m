%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.8 a)
%
%Visualizzare: l'immagine originale e il suo istogramma;
%
%Applicare la procedura MATLAB bwconncomp() per l'analisi di componenti 4-connesse. Visualizzare i
%risultati dell'analisi compiuta dalla bwconncomp().
%
%Usare la regionprops() per la stima di caratteristiche geometriche delle regioni individuate al passo (b):
%in particolare riportare le stime di perimetri e aree delle regioni individuate tramite bwconncomp().
%Visualizzare l'immagine binaria con sovrapposti i centroidi delle regioni individuate.
%
%Ripetere i passi (b) e (c) effettuando l'analisi delle componenti 8-connesse.
%
%Nonis Mauro 123350
%30 aprile 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Immagine sintetica con rettangoli
img = zeros(50,50);
img(10:40, 10:16)=1.;
img(41:45, 5:10)=1.;
img(19:40, 20:30)=1.;
img(41:45, 31:45)=1.;
img(5:20, 35:45)=1.;
%visualizzazione
figure,
subplot(1, 2, 1), imshow(img), title('Immagine sorgente');
subplot(1, 2, 2), histogram(img), grid, title('Istogramma');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%calcolo delle componenti connesse
connComp = bwconncomp(img, 4);
%visualizzazione risultato
fprintf('\nconnettività %2.0f \n', connComp.Connectivity);
fprintf('risoluzione immagine %2.0f \n', connComp.ImageSize);
fprintf('num oggetti %2.0f \n', connComp.NumObjects);
fprintf('dimensione array %2.0f \n\n', length(connComp.PixelIdxList));
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Caratteristiche geometriche delle regioni trovate
geom = regionprops(connComp, 'Area', 'Perimeter', 'Centroid');
%preparazione per visione tabellare
area = cat(1, geom.Area);
perimeter = cat(1, geom.Perimeter);
centroids = cat(1,geom.Centroid);
%viaualizzazione tabellare
figure,
colnames = {'Area', 'Perimeter'};
uitable('Data', [area, perimeter], 'ColumnName', colnames);
%visualizzazione immagine con sovrapposizione
figure,
imshow(img, 'InitialMagnification','fit'), title('Immagine sovrapposti centroidi') ;
hold on
plot(centroids(:,1),centroids(:,2),'r*')
hold off
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte d)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%calcolo delle componenti connesse
connComp8 = bwconncomp(img, 8);
%visualizzazione risultato
fprintf('\nconnettività %2.0f \n', connComp8.Connectivity);
fprintf('risoluzione immagine %2.0f \n', connComp8.ImageSize);
fprintf('num oggetti %2.0f \n', connComp8.NumObjects);
fprintf('dimensione array %2.0f \n\n', length(connComp8.PixelIdxList));
%Caratteristiche geometriche delle regioni trovate
geom = regionprops(connComp8, 'Area', 'Perimeter', 'Centroid');
%preparazione per visione tabellare
area = cat(1, geom.Area);
perimeter = cat(1, geom.Perimeter);
centroids = cat(1,geom.Centroid);
%viaualizzazione tabellare
figure,
colnames = {'Area', 'Perimeter'};
uitable('Data', [area, perimeter], 'ColumnName', colnames);
%visualizzazione immagine con sovrapposizione
figure,
imshow(img, 'InitialMagnification','fit'), title('Immagine sovrapposti centroidi') ;
hold on
plot(centroids(:,1),centroids(:,2),'r*')
hold off