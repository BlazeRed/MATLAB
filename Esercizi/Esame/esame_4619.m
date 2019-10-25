%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esame 2018-2019
%
%Nonis Mauro 123350
%4 giugno 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte a)
%
%Usare l?immagine ?eye.gif?.
%
%Aggiungere rumore tipo ?speckle? usando la 
%procedura imnoise() con varianza var=0.9. 
%Visualizzare l?immagine sorgente; quella con rumore; 
%i rispettivi istogrammi dei livelli di grigio;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
fonte = imread('eye.gif');
img = double(fonte);
%imagine con rumore 
rumor = imnoise(img, 'speckle', 0.9);
%visualizzazione immagini
figure, 
subplot(2, 2, 1), imshow(img), title('Immagine originale');
subplot(2, 2, 2), histogram(img), grid, title('Istogramma originale');
subplot(2, 2, 3), imshow(rumor), title('Immagine con rumore');
subplot(2, 2, 4), histogram(rumor), grid, title('Istogramma con rumore');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte b)
%
%Ridurre il rumore applicando un filtro di tipo
%?disk? con tre valori del parametro radius=1,3,7. 
%Visualizzare nuovamente l?immagine con rumore 
%assieme alle filtrate, ciascuna con il rispettivo 
%istogramma. Individuare il filtro con le prestazioni
%migliori usando il MSE e riportarlo nelle conclusioni.
%Riportare i risultati in tabella con uitable() ;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%creazione filtri 
filter1 = fspecial('disk', 1);
filter3 = fspecial('disk', 3);
filter7 = fspecial('disk', 7);
%applicazione filtri
im1  = imfilter(rumor, filter1);
im3  = imfilter(rumor, filter3);
im7  = imfilter(rumor, filter7);
%calcolo MSE
mse1 = immse(im1, rumor);
mse3 = immse(im3, rumor);
mse7 = immse(im7, rumor);
%visualizzazione tabellare
f = figure;
uit = uitable(f);
d = {mse1; mse3; mse7};
uit.ColumnName = {'MSE'};
uit.RowName = {'1', '3', '7'};
uit.Data = d;

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte c)
%
%Sull?immagine filtrata che è stata valutata 
%migliore, calcolare due mappe di ampiezze di 
%edge. Calcolare entrambe usando la edge() 
%con filtraggio ?LOG? (Laplacian Of Gaussian) 
%e due valori di soglia, threshold=0 e 0.015. 
%Visualizzarle in un?unica figura. 
%Riportare brevi osservazioni nelle conclusioni;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%calcolo edge con soglia 0
edge0 = edge(im1, 'log',  0);
%calcolo edge con soglia 0.015
edge15 = edge(im1, 'log', 0.015);
%vsualizzazione
figure,
subplot(1, 2, 1), imshow(edge0), title('Immagine con soglia 0');
subplot(1, 2, 2), imshow(edge15), title('Immagine con soglia 0.015');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte d)
%
%Sulla stessa immagine selezionata al 
%punto (c) individuare le regioni (oggetti) 
%e i loro contorni usando la bwboundaries() 
%con l?opzione ?holes?. Visualizzare due 
%immagini: quella delle regioni etichettate 
%e la stessa con i contorni sovrapposti;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%individuo le regioni
[BoundObj,imgLabel,Nobj] = bwboundaries(im1, 'holes');
%visualizzazione
figure,
subplot(1, 2, 1), imshow(imgLabel), title('Immagine regioni etichette');
subplot(1, 2, 2), imshow(imgLabel), title('Immagine regioni etichette con contorni');
%sovrapposizione boundary all?immagine RGB
hold on
for k = 1:length(BoundObj)
   boundary = BoundObj{k};
   plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
end
hold off
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte e)
%
%Ripetere le operazioni richieste al 
%punto (d) usando l?opzione ?noholes?. 
%Visualizzare in una nuova figura le 
%due immagini come al punto (d).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%individuo le regioni
[BoundObj2, imgLabel2, Nobj2] = bwboundaries(im1, 'noholes');
%visualizzazione
figure,
subplot(1, 2, 1), imshow(imgLabel2), title('Immagine regioni etichette');
subplot(1, 2, 2), imshow(imgLabel2), title('Immagine regioni etichette con contorni');
%sovrapposizione boundary all?immagine RGB
hold on
for k = 1:length(BoundObj2)
   boundary = BoundObj2{k};
   plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
end
hold off








