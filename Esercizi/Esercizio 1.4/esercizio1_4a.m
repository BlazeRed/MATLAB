%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script Esercizio 1.4 a) b)
%
%Selezionare gli otto piani di bit usando la procedura MATLAB bitget().
%Visualizzare gli otto piani di bit.
%
%Effettuare ricostruzioni parziali dell?originale sommando soltanto alcuni piani di bit, nelle 
%situazioni seguenti: (1) immagine del solo piano del bit 8 (il più significativo); (2) %immagine ricostruita sommando soltanto i piani 7,8; (3) i  
%piani 6,7,8; (s4) i piani 5,6,7,8; (5) i piani 4,5,6,7,8. Visualizzare l?immagine originale
%e le cinque ricostruzioni parziali.
%
%Nonis Mauro 123350
%25 marzo 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%carico l'immagine
img = imread('cameraman.tif');
%estraggo gli 8 piani con la funzione bitget()
planes1 = bitget(img, 1);
planes2 = bitget(img, 2);
planes3 = bitget(img, 3);
planes4 = bitget(img, 4);
planes5 = bitget(img, 5);
planes6 = bitget(img, 6);
planes7 = bitget(img, 7);
planes8 = bitget(img, 8);
%calcolo per ricostruire l'immagine 
planes8 = planes8 * 2^8;
planes7 = planes7 * 2^7;
planes6 = planes6 * 2^6;
planes5 = planes5 * 2^5;
planes4 = planes4 * 2^4;
%sommo insieme i vari livelli per ricostruire l'immagine
merge2 = planes7 + planes8;
merge3 = planes6 + merge2;
merge4 = planes5 + merge3;
merge5 = planes4 + merge4;
%visualizzazione dei vari piani
subplot(3, 3, 1), imshow(logical(planes1)); title('Piano 1');
subplot(3, 3, 2), imshow(logical(planes2)); title('Piano 2');
subplot(3, 3, 3), imshow(logical(planes3)); title('Piano 3');
subplot(3, 3, 4), imshow(logical(planes4)); title('Piano 4');
subplot(3, 3, 5), imshow(logical(planes5)); title('Piano 5');
subplot(3, 3, 6), imshow(logical(planes6)); title('Piano 6');
subplot(3, 3, 7), imshow(logical(planes7)); title('Piano 7');
subplot(3, 3, 8), imshow(logical(planes8)); title('Piano 8');
subplot(3, 3, 9), imshow(img); title('Immagine originale');
figure,
%visualizzazione della fusione parziale dei livelli
subplot(2, 3, 1), imshow(img), title('Immagine originale');
subplot(2, 3, 2), imshow(planes8), title('Piano 8');
subplot(2, 3, 3), imshow(merge2), title('Piano 7,8');
subplot(2, 3, 4), imshow(merge3), title('Piano 6,7,8');
subplot(2, 3, 5), imshow(merge4), title('Piano 5,6,7,8');
subplot(2, 3, 6), imshow(merge5), title('Piano 4,5,6,7,8');