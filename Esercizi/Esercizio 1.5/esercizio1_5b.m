%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.5 b) c)
%
%Rispetto all'immagine senza rumore presa come riferimento, calcolare l'errore quadratico medio
%MSE (funzione immse()); il rapporto segnale-rumore di picco (PSNR);  il rapporto segnale %rumore (SNR) per i tre livelli di rumore simulato. 
%Per la stima di PSNR e SNR usare la funzione psnr()
%
%Visualizzare i risultati in forma di tabella (funzione uitable())
%
% Nonis Mauro 123350
%26 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%creo l'immagine di riferimento senza rumore
img = zeros(30,30);
img(5:25, 13:17)=1;
%applico il rumore all'immagine
rumor001 = imnoise(img,'gaussian', 0, 0.01); 
rumor01 = imnoise(img,'gaussian', 0, 0.1); 
rumor1 = imnoise(img,'gaussian', 0, 1); 
%calcolo MSE
mse001 = immse(rumor001, img);
mse01 = immse(rumor01, img);
mse1 = immse(rumor1, img);
%calcolo peaksnr e snr
[psnr001, snr001] = psnr(rumor001, img);
[psnr01, snr01] = psnr(rumor01, img);
[psnr1, snr1] = psnr(rumor1, img);
%visualizzazione tabellare
f = figure;
uit = uitable(f);
d = {mse001, psnr001, snr001; mse01, psnr01, snr01; mse1, psnr1, snr1 };
uit.ColumnName = {'MSE', 'PSNR', 'SNR'};
uit.RowName = {'001', '01', '1'};
uit.Data = d;
