%L?immagine della scacchiera - checkerboard() - 
%deve essere rappresentata in forma binaria e 
%risoluzione 256x256 pixel. Applicare alla scacchiera rumore 
%additivo gaussiano a media nulla, con varianza 0.1 (rumore basso); 
%e con varianza 1. (rumore alto). Visualizzare l?immagine sorgente della
%scacchiera e le due immagini con rumore, assieme ai rispettivi istogrammi dei livelli di grigio;

%creazione della scacchiera
board = checkerboard(25);
%rendo binaria l'immagine
s = (board > 0.5);

% %%%%%
% %a)
% %%%%%
%aggiunta del rumore alle immagini
rumor01 = imnoise(double(s),'gaussian', 0, 0.1); 
rumor1 = imnoise(double(s),'gaussian', 0, 1);
% %visualizzazione
% figure,
% subplot(2, 3, 1), imshow(s, 'InitialMagnification', 'fit'), title('originale');
% subplot(2, 3, 2), imshow(rumor01, 'InitialMagnification', 'fit'), title('rumor');
% subplot(2, 3, 3), imshow(rumor1, 'InitialMagnification', 'fit'), title('rumor 1');
% subplot(2, 3, 4), imhist(s), title('Istogramma originale'), grid;
% subplot(2, 3, 5), imhist(rumor01), title('Istogramma rumor'), grid;
% subplot(2, 3, 6), imhist(rumor1), title('Istogramma rumor 1'), grid;

% %%%%%
% %b)
% %%%%%
% %Creazione filtro medio e appicazione
% filter1 = fspecial('average');
% image1 = imfilter(rumor01, filter);
% image2 = imfilter(rumor1, filter);
% %Visualizzazione
% figure, 
% subplot(1, 2, 1),imshow(image1);
% subplot(1, 2, 2),imshow(image2);

% %%%%%
% %c)
% %%%%%
% %calcolo MSE dato dal rumore prima del filtraggio
% mseBasso = immse(rumor01, double(s));
% mseAlto = immse(rumor1, double(s));
% 
% %calcolo MSE dato dal filtraggio
% mseFbasso = immse(image1, double(s));
% mseFalto = immse(image2, double(s));
% %visualizzazione valori
% f = figure;
% uit = uitable(f);
% d = {mseBasso, mseAlto; mseFbasso, mseFalto};
% uit.ColumnName = {'MSE basso', 'MSE alto'};
% uit.RowName = {'Prima filtro', 'Dopo filtro'};
% uit.Data = d;

%%%%%
%d)
%%%%%
%Creazione filtro medio e appicazione
filter5x5 = fspecial('average', [5 5]);
image3 = imfilter(rumor01, filter5x5);
image4 = imfilter(rumor01, filter5x5);

%calcolo MSE dato dal rumore prima del filtraggio
mseBasso = immse(rumor01, double(s));
mseAlto = immse(rumor1, double(s));

%calcolo MSE dato dal filtraggio
mseFbasso = immse(image3, double(s));
mseFalto = immse(image4, double(s));

%visualizzazione valori
f = figure;
uit = uitable(f);
d = {mseBasso, mseAlto; mseFbasso, mseFalto};
uit.ColumnName = {'MSE basso', 'MSE alto'};
uit.RowName = {'Prima filtro', 'Dopo filtro'};
uit.Data = d;

