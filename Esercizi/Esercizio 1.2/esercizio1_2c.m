%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.2 c)
%
%Desaturare l'immagine HSV, cioè azzerare il 
%canale S; riconvertire l'immagine alla codifica 
%RGB e visualizzare l'immagine risultante; 
%visualizzare gli istogrammi della HSV desaturata;
%
% Nonis Mauro 123350
%25 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico l'immagine
img = imread('peppers.png');
%trasformazione da rgb ad hsv
hsv = rgb2hsv(img);
%Calcolo per azzerare la saturazione
desaturato = hsv; %copio l'immagine
desaturato(:,:,2) = 0; %saturazione a zero
%riconverto in RGB
rgb = hsv2rgb(desaturato);
%visualizzazione
subplot(2, 2, 1), imshow(desaturato), title('HSV desaturata');
subplot(2, 2, 2), imhist(desaturato), title('Istogramma HSV'), grid;
subplot(2, 2, 3), imshow(rgb), title('RGB desaturata'); 
subplot(2, 2, 4), imhist(rgb), title('Istogramma RGB'), grid;
