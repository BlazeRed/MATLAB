%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.4 a) b)
%
%Definire un'immagine sintetica binaria costituita da soli tre punti 
%bianchi isolati. Applicare rumore gaussiano additivo a media nulla e 
%varianza 0.01. Applicare un filtro derivativo di Laplace alla sola immagine
%col rumore, per ottenere la mappa delle ampiezze di edge candidati.
%Usare fspecial() con parametro alpha di default e imfilter(). 
%Visualizzare le due immagini iniziali senza e con rumore; nella stessa 
%finestra visualizzare la mappa di ampiezze col rumore, anche in modalità 
%grafica 3D usando la procedura mesh().
%
%
%Calcolare psnr, snr e MSE per stimare il rapporto segnale-rumore 
%dell'immagine prima e dopo il filtraggio di Laplace. Prima del filtraggio
%prendere come riferimento l'immagine sorgente senza rumore; dopo il filtraggio
%ricalcolare le tre stime prendendo come riferimento l'immagine iniziale con rumore.
%Riportare i risultati in un'unica tabella usando uitable().
%
%Nonis Mauro 123350
%16 aprile 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%creo immagine
img = zeros(60, 60);
img(5:5, 17:17) = 1;
img(25:25, 11:11) = 1;
img(55:55, 24:24) = 1;
%aggiunta rumore all'immagine
imRumore = imnoise(img,'gaussian', 0, 0.01);
%filtro di laplace
laplaceFilt = fspecial('laplacian');
%applicazione filtro Laplace
imFilt = imfilter(imRumore, laplaceFilt);
%visualizzazione
subplot(1, 4, 1), imshow(img), title('Immagine originale');
subplot(1, 4, 2), imshow(imRumore), title('Immagine con rumore');
subplot(1, 4, 3), imshow(imFilt, []), title('Mappa delle ampiezze');
subplot(1, 4, 4), mesh(imFilt), title('Mappa delle ampiezze');
%calcolo psnr
[psnrR, snrR] = psnr(imRumore, img);
[psnrF, snrF] = psnr(imFilt, img);
%calcolo MSE
mseR = immse(imRumore, img);
mseF = immse(imFilt, img);
%tabella per la visualizzazione
f = figure;
uit = uitable(f);
d = {psnrR, snrR, mseR; snrF, snrF, mseF};
uit.ColumnName = {'PSNR', 'SNR', 'MSE'};
uit.RowName = {'Con Rumore', 'Con Filtro'};
uit.Data = d;
uit.Position = [0 0 400 200];


