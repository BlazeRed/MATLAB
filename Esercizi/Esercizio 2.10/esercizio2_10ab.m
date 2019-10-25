%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.10
%
%Riprodurre la sequenza con implay() e visualizzare i metadati. Estrarre la durata in secondi e il
%numero di frame che compongono la sequenza;
%
%Estrarre il frame n.50. Visualizzare il frame; lo stesso convertito in livelli di grigio; lo stesso
%binarizzato. Associare l'istogramma a ciascuna delle tre immagini.
%
%Nonis Mauro 123350
%14 maggio 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
video = 'viplanedeparture.mp4';
%Estraggo le informazioni relative al video
metadata = VideoReader(video);
info = get(metadata);
%visualizzazione metadati
disp('Durata del video ');
disp(info.Duration);
disp('Frame rate del video ');
disp(info.FrameRate);
%visualizzo il video
implay(video);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%leggo il frame 50
frameX = read(metadata, 50);
%rendo il frame in scala di grigio
frameGray = rgb2gray(frameX);
%binarizzo l'immagine
threshEx = 0.5;
frameBW = imbinarize(frameGray, threshEx);
%visualizzazione immagini
figure, 
subplot(2, 3, 1), imshow(frameX), title('Frame originale');
subplot(2, 3, 2), imshow(frameGray), title('Frame bianco e nero');
subplot(2, 3, 3), imshow(frameBW), title('Frame binarizzato');
subplot(2, 3, 4), histogram(frameX), grid, title('Istogramma originale');
subplot(2, 3, 5), histogram(frameGray), grid, title('Istogramma bianco e nero');
subplot(2, 3, 6), histogram(frameBW), grid, title('Istogramma binarizzato');

