%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 2.1 c)
%
%Stimare quantitativamente l'effetto del rumore e del
%filtraggio di media usando l'MSE, avendo preso come 
%riferimento l'immagine sorgente. In particolare:
%
%(c1) Stimare l'MSE delle immagini con rumore basso-alto, prima del filtraggio;
%(c2) Stimare l'MSE delle immagini che avevano rumore basso-alto, dopo il filtraggio;
%
%Riportare i risultati in un'unica tabella usando la procedura uitable().
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
%Creazione filtro medio 3x3 e appicazione
filter = fspecial('average', [3 3]);
imbasso = imfilter(rbasso, filter);
imalto = imfilter(ralto, filter);
%calcolo MSE dato dal rumore prima del filtraggio
mseBasso = immse(rbasso, double(board));
mseAlto = immse(ralto, double(board));
%calcolo MSE dato dal filtraggio
mseFbasso = immse(imbasso, double(board));
mseFalto = immse(imalto, double(board));
%visualizzazione valori
f = figure;
uit = uitable(f);
d = {mseBasso, mseAlto; mseFbasso, mseFalto};
uit.ColumnName = {'MSE basso', 'MSE alto'};
uit.RowName = {'Prima filtro', 'Dopo filtro'};
uit.Data = d;