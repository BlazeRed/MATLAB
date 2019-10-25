%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.1 a)
%
% Visualizzare l?immagine ?cameraman?; i metadati;
% la sua look-up table (LUT); l?istogramma dei livelli di grigio. 
%
% Nonis Mauro 123350
%12 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imread('cameraman.tif');
%Visualizza i metadati; 
imfinfo('cameraman.tif')
%Visualizza l'immagine 'cameraman.tif'
subplot(2, 2, 1), imshow(img), title("cameraman.tif")
%Visualizza la look-up table (LUT); 
subplot(2, 2, 2), imshow(img), colorbar, title("Look-up table")
%Visualizza l'istogramma dei livelli di grigio.	
subplot(2, 2, 3), imhist(img), grid, title("Istogramma livelli di grigio")
