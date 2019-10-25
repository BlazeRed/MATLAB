%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.1 d)
%
%Ripetere i calcoli effettuati ai punti (b), (c) con lo 
%stesso operatore di media (average) e maschere di 
%dimensioni 5x5, 9x9. Non visualizzare le immagini. 
%Usando la procedura uitable() riportare in un?unica 
%tabella i seguenti dati:
%
%d1) Le stime dell?MSE per immagini con rumore basso-alto 
%non filtrate (riportare le stime già effettuate al punto (c1));
%d2) Le stime MSE per le immagini con rumore basso-alto, 
%filtrate con le diverse maschere: 3x3 (già al punto (c2)); 5x5 ; 9x9
%
% Nonis Mauro 123350
%1 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%creazione della scacchiera
s = checkerboard(32);
%rendo binaria l'immagine
board = (s > 0.5);
%aggiunta del rumore alle immagini
rbasso = imnoise(double(board),'gaussian', 0, 0.1); 
ralto = imnoise(double(board),'gaussian', 0, 1);
%calcolo MSE dato dal rumore prima del filtraggio
mseBasso = immse(rbasso, double(board));
mseAlto = immse(ralto, double(board));
%Creazione filtro medio 3x3 e appicazione
filter3 = fspecial('average', [3 3]);
imbasso3 = imfilter(rbasso, filter3);
imalto3 = imfilter(ralto, filter3);
%calcolo MSE dato dal filtraggio
mseFbasso3 = immse(imbasso3, double(board));
mseFalto3 = immse(imalto3, double(board));
%%%%
%d1)
%%%%
%Creazione filtro medio 5x5 e appicazione
filter5 = fspecial('average', [5 5]);
imbasso5 = imfilter(rbasso, filter5);
imalto5 = imfilter(ralto, filter5);
%calcolo MSE dato dal filtraggio
mseFbasso5 = immse(imbasso5, double(board));
mseFalto5 = immse(imalto5, double(board));
%%%%
%d2)
%%%%
%Creazione filtro medio 9x9 e appicazione
filter9 = fspecial('average', [9 9]);
imbasso9 = imfilter(rbasso, filter9);
imalto9 = imfilter(ralto, filter9);
%calcolo MSE dato dal filtraggio
mseFbasso9 = immse(imbasso9, double(board));
mseFalto9 = immse(imalto9, double(board));
%visualizzazione valori
f = figure;
uit = uitable(f);
d = {mseBasso, mseAlto; mseFbasso3, mseFalto3; mseFbasso5, mseFalto5; mseFbasso9, mseFalto9};
uit.ColumnName = {'MSE basso', 'MSE alto'};
uit.RowName = {'Prima filtro', 'Dopo filtro 3x3', 'Dopo filtro 5x5', 'Dopo filtro 9x9'};
uit.Data = d;
uit.Position = [0 0 350 200];
%Visualizzazione
figure,
subplot(2, 3, 1), imshow(board), title('Originale');
subplot(2, 3, 2), imshow(rbasso), title('Rumore basso');
subplot(2, 3, 3), imshow(imbasso3), title('Filtrata 3');
subplot(2, 3, 4), imshow(imbasso5), title('Filtrata 5');
subplot(2, 3, 5), imshow(imbasso9), title('Filtrata 9');
