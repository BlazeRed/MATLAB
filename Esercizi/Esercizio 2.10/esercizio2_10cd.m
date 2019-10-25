%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.10
%
%Acquisire con un dispositivo mobile (smartphone, tablet) una sequenza video di 6-7 secondi,
%rispettando le seguenti condizioni: c1) La scena reale deve contenere un singolo oggetto in
%moto relativo rigido rispetto al dispositivo, che deve essere tenuto fermo; c2) durante 
%l'acquisizione non devono esserci apprezzabili variazioni di illuminazione: ad esempio,
%si deve evitare di inquadrare una sorgente luminosa o lo schermo di un computer;
%
%Chiamare la sequenza acquisita videoPersonal.X Effettuare l'analisi esplorativa della sequenza 
%secondo le consegne riportate nei punti (a), (b) precedenti.
%
%Nonis Mauro 123350
%14 maggio 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
videoPersonal = 'video/mouse.mp4';
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte d)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Estraggo le informazioni relative al video
metadata = VideoReader(videoPersonal);
info = get(metadata);
%visualizzazione metadati
disp('Durata del video ');
disp(info.Duration);
disp('Frame rate del video ');
disp(info.FrameRate);
%visualizzo il video
implay(videoPersonal);
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
