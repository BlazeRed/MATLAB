%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Simulazione 2018-2019
%
%Nonis Mauro 123350
%28 maggio 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte a)
%
%Binarizzare l?immagine usando la procedura imbinarize() con una soglia = 0.7; 
%effettuare l?inversione oggetto-sfondo. Visualizzare: l?immagine originale; 
%l?immagine binarizzata, prima dell?inversione; 
%l?immagine binarizzata dopo l?inversione oggetto-sfondo; 
%i tre rispettivi istogrammi;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
img = imread('eight.tif');
soglia = 0.7;
%binarizzo l'immagine
imgBin = imbinarize(img, soglia);
%rendo negativa l'immagine
imgNeg = imcomplement(imgBin);
%visualizzazione
figure,
subplot(3, 2, 1), imshow(img), title('Immagine originale');
subplot(3, 2, 2), histogram(img), grid, title('Istogramma img originale');
subplot(3, 2, 3), imshow(imgBin), title('Immagine binarizzata');
subplot(3, 2, 4), histogram(imgBin), grid, title('Istogramma img binarizzata');
subplot(3, 2, 5), imshow(imgNeg), title('Immagine invertita');
subplot(3, 2, 6), histogram(imgBin), grid, title('Istogramma img invertita');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte b)
%
%Dall?immagine binaria dopo l?inversione estrarre gli edge usando 
%la edge() con parametri di default; estrarre i contorni usando 
%la bwboundaries(). In un?unica figura: 1) visualizzare la mappa 
%degli edge (solo ampiezze); 2) visualizzare l?immagine delle 
%etichette con sovrapposti i contorni; dal confronto visivo di 
%1) con 2) riportare in breve le osservazioni nelle conclusioni;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%estraggo gli edge 
mappaEdge = edge(imgBin);
%estraggo i contorni
[Boundobj, imgLabel, Nobj] = bwboundaries(imgNeg, 'noholes');
%visualizzazione
figure,
subplot(1, 2, 1), imshow(mappaEdge), title('Immagine degli edge');
subplot(1, 2, 2), imshow(imgLabel), title('Immagine etichette con i contorni');
hold on
for k = 1:length(Boundobj)
   boundary = Boundobj{k};
   plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
end
hold off
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte c)
%
%Usando la regionprops() calcolare i centroidi nella 2). 
%Visualizzare i centroidi sovrapposti graficamente all?immagine 2); 
%visualizzare gli stessi centroidi in forma numerica tramite uitable() 
%oppure table(); riportare eventuali osservazioni nelle conclusioni;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%calcolo dei centroidi
features = regionprops(imgLabel, 'Centroid');
%estrazione dei centroidi
centroidi = cat(1, features.Centroid);
%visualizzazione
figure,
imshow(imgLabel), title('Immagine con centroidi');
hold on
plot(centroidi(:,1),centroidi(:,2),'r*')
hold off
%visualizzazione tabellare dei centroidi
figure,
colnames = {'Centroidi X', 'Centroidi Y'};
data = {centroidi};
t = uitable('Data', centroidi, 'ColumnName', colnames, 'Position',[20 20 220 300]);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte c)
%
%Usando la regionprops() calcolare perimetri e aree delle 
%regioni individuate. Visualizzare i risultati in forma di 
%tabella usando la uitable() oppure la table().
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%calcolo dei perimetri e aree
geom = regionprops(imgLabel, 'Area', 'Perimeter');
%estraggo i valori per area e perimetro
area = cat(1, geom.Area);
perimetro = cat(1, geom.Perimeter);
%visualizzazione tabellare dei centroidi
figure,
colnames = {'Perimetro', 'Area'};
data = {perimetro, area};
t = uitable('Data', [perimetro, area], 'ColumnName', colnames, 'Position',[20 20 220 300]);
%

