%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.9
%
%Effettuare l'inversione oggetto-sfondo; binarizzare l'immagine; 
%aggiungere alla immagine binarizzata tre rettangoli pieni disgiunti tra 
%loro e dagli altri oggetti dell'immagine. Visualizzare: l'immagine originale; 
%il suo istogramma; l'immagine binarizzata; l'immagine modificata con l'aggiunta dei rettangoli;
%
%Nonis Mauro 123350
%7 maggio 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imread('circlesBrightDark.png');
inverted = imcomplement(img); %creazione immagine negativa
binar = imbinarize(inverted); %binarizzazione
newImg = binar;
%aggiunta rettangoli all'immagine
newImg(10:100, 100:160)=1.;
newImg(150:200, 150:250)=1.;
newImg(300:400, 50:150)=1.;
%visualizzazione
figure, 
subplot(2, 2, 1), imshow(img), title('Immagine originale');
subplot(2, 2, 2), histogram(img), grid, title('Istogramma immagine originale');
subplot(2, 2, 3), imshow(binar), title('Immagine binarizzata');
subplot(2, 2, 4), imshow(newImg), title('Immagine con aggiunta di rettangoli');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte b)
%
%All?ultima immagine applicare la procedura MATLAB bwconncomp() per l?analisi di componenti connesse.
%Visualizzare, usando la fprintf(), i risultati dell?analisi compiuta dalla bwconncomp(). 
%In particolare: la connettività; la risoluzione dell?immagine; il numero di oggetti individuati; 
%la dimensione dell?array di celle contenenti i pixel appartenenti a ciascun oggetto.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
connComp = bwconncomp(newImg);
fprintf('\nconnettività %2.0f \n', connComp.Connectivity);
fprintf('risoluzione immagine %2.0f \n', connComp.ImageSize);
fprintf('num oggetti %2.0f \n', connComp.NumObjects);
fprintf('dimensione array %2.0f \n\n', length(connComp.PixelIdxList));
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte c)
%
%Usare la regionprops() per la stima di caratteristiche geometriche (geometric features) 
%delle regioni individuate al passo (b): in particolare riportare in una tabella uitable() le stime di perimetri,
%aree, centroidi delle regioni individuate tramite bwconncomp().
%Visualizzare l?immagine binaria modificata come al punto (a), con sovrapposti i centroidi delle regioni individuate.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%calcolo delle geometrie
geomFeat = regionprops(connComp, 'Area', 'Perimeter', 'Centroid');
area = cat(1, geomFeat.Area);
perimeter = cat(1, geomFeat.Perimeter);
centroid = cat(1, geomFeat.Centroid);
%visualizzazione tabellare
fig = figure;
colnames = {'Area', 'Perimeter', 'Centroid x', 'Centroid y'};
table = uitable(fig, 'Data', [area, perimeter, centroid], 'ColumnName', colnames, 'Position', [20 20 400 200]);
%visualizzazione immagine modificata con centroidi
figure,
imshow(newImg), title('Immagine con i centroidi')
hold on
plot(centroid(:,1), centroid(:,2), 'r*')
hold off
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte d)
%
%Visualizzare la stessa immagine con sovrapposti i centroidi delle sole regioni di forma circolare.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%soglia per la roundness
threshold = 0.9;
figure,
imshow(newImg), title('Immagine con i centroidi sulle solo componenti circolari')
hold on
for k = 1:connComp.NumObjects
    kPerimeter = geomFeat(k).Perimeter;
    kArea = geomFeat(k).Area;
    %continuazione calcolo sull'immagine
    roundness = 4*pi*kArea/kPerimeter^2;
    % mark objects above the threshold with a black circle
    if roundness > threshold
        kCentroid = geomFeat(k).Centroid;
        plot(kCentroid(1),kCentroid(2),'r*');
    end
end
hold off