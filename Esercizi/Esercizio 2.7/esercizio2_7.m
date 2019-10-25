%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.7
%
%Convertirla nella sua negativa. Visualizzare l'immagine e la negativa, ciascuna col proprio
%istogramma;
%
%Usando la procedura bwboundaries() estrarre il numero di oggetti Nobj; i contorni di ciascun
%oggetto codificati in BoundObj; l'array di etichette imgLabel. Visualizzare soltanto l'immagine RGB
%delle etichette, con sovrapposti i contorni degli oggetti;
%
%%Usando la procedura regionprops() e la matrice delle etichette che si era ricavata al punto (b),
%estrarre le caratteristiche geometriche (features) 'Perimeter', 'Area' di ciascuna regione.
%I valori di perimetri e aree devono essere presentati in una tabella usando la uitable().
%
%Analogamente a quanto fatto al punto (c) estrarre i centroidi ('Centroids'), e visualizzare l'immagine
%RGB delle etichette con sovrapposti i centroidi degli oggetti.
%
%Per ogni oggetto calcolare il fattore di forma di circolarità (roundness factor). Individuare gli oggetti
%che più si avvicinano ad una forma circolare. Visualizzare l'immagine RGB coi contorni sovrapposti (punto (b))
%a cui siano ulteriormente sovrapposti i valori di roundness.
%
%Nonis Mauro 123350
%30 aprile 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%carico immagine
positiva = imread('Immagini/geomTest.png');
positiva = rgb2gray(positiva); %conversione in livelli di grigio
positiva = logical(positiva); %conversione in logical (binario)
negativa = imcomplement(positiva); %creazione immagine negativa
%visualizzazione
figure,
subplot(2, 2, 1), imshow(positiva), title('Immagine originale');
subplot(2, 2, 2), histogram(positiva), grid, title('Istogramma immagine originale');
subplot(2, 2, 3), imshow(negativa), title('Immagine negativa');
subplot(2, 2, 4), histogram(negativa), grid, title('Istogramma immagine negativa');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
[BoundObj,imgLabel,Nobj] = bwboundaries(positiva);
%visualizzazione
figure,
imshow(label2rgb(imgLabel)), title('imgLabel con sovrapposizione di BoundObj'); 
%Sovrapposizione di BoundObj all'immagine imgLabel RGB
hold on
for k=1:length(BoundObj)
   boundary = BoundObj{k};
     %per indicare i Nobj
     plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
end
hold off
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%estrazione caratteristiche geometriche
features = regionprops(imgLabel, 'Area', 'Perimeter', 'Centroid');
%preparazione per visione tabellare
area = cat(1, features.Area);
perimeter = cat(1, features.Perimeter);
%visualizzazione dei dati in formato tabellare
figure,
colnames = {'Area', 'Perimeter'};
data = {area, perimeter};
t = uitable('Data', [area, perimeter], 'ColumnName', colnames, 'Position',[20 20 200 180]);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte d)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
centroids = cat(1,features.Centroid);
%visualizzazione immagine a colori con centroidi sovrapposti
figure,
imshow(label2rgb(imgLabel)), title('Immagine con centroidi');
hold on
plot(centroids(:,1),centroids(:,2),'black*')
hold off
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte e)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%rendere RGB l'immagine delle etichette
imgLabelRGB = label2rgb(imgLabel);
%soglia per il calcolo della roundness
threshold = 0.9;
%
figure('Name','Immagine delle etichette con misure di circolarità')
imshow(imgLabelRGB), title('Immagine etichette con misure dicircolarità')
hold on
%
for k = 1:length(BoundObj)
    boundary = BoundObj{k};
    % Obtain the perimeter and area corresponding to label 'k'
    perimeter = features(k).Perimeter;
    area = features(k).Area;
    % Compute the roundness metric of object 'k'
    metric = 4*pi*area/perimeter^2;
    % prepare display of results
    metric_string = sprintf('%2.2f',metric);
    % mark objects above the threshold with a black circle
    if metric > threshold
    centroid = features(k).Centroid;
    plot(centroid(1),centroid(2),'k*');
    end
    text(boundary(1,2)-40,boundary(1,1)+13,metric_string,'Color','k',... 
    'FontSize',14,'FontWeight','bold');
end
hold off