%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.1 a)
%
%Visualizzare l?immagine ?peppers.png?; i metadati. 
%
% Nonis Mauro 123350
%12 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Visualizzazione dell?immagine 'peppers.png'
img = imread('peppers.png');
imshow(img), title("peppers.png")
%Visualizzazione metadati
imfinfo('peppers.png')