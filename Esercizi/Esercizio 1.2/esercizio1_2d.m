%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.2 d)
%
%Ripetere le operazioni effettuate al punto (c) 
%dopo aver azzerato anche il canale H (oltre al 
%canale S già azzerato).
%
% Nonis Mauro 123350
%25 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico l'immagine
img = imread('peppers.png');
%trasformazione da rgb ad hsv
hsv = rgb2hsv(img);
%Calcolo per azzerare H e S
HSzero = hsv; %copio l'immagine
HSzero(:,:,2) = 0; %saturazione a zero
HSzero(:,:,1) = 0; %Hue a zero
%riconverto in RGB
rgb = hsv2rgb(HSzero);
%visualizzazione
subplot(2, 2, 1), imshow(HSzero), title('HSV senza HS');
subplot(2, 2, 2), imhist(HSzero), title('Istogramma HSV'), grid;
subplot(2, 2, 3), imshow(rgb), title('RGB senza HS'); 
subplot(2, 2, 4), imhist(rgb), title('Istogramma RGB'), grid;
