%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.11
%
%Considerare la sequenza traffic.avi Estrarre il frame n.35 e visualizzarlo; 
%visualizzare lo stesso convertito in livelli di grigio; lo stesso binarizzato
%con soglia thresh=0.5. Associare l?istogramma a ciascuna delle tre immagini;
%
%Implementare l'algoritmo di segmentazione del moto (Lezione 2.4, par.3). 
%In particolare: in un ciclo sui frame, calcolare il valore assoluto delle 
%differenze pixel per pixel tra due frame consecutivi; binarizzare le immagini
%così ottenute, usando un valore di soglia threshDiff=0.3. Visualizzare la
%sequenza delle differenze prima e dopo la sogliatura.
%
%Nonis Mauro 123350
%21 maggio 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
video = 'video/traffic.mp4';
%visualizzo il video
implay(video);
videoSeq = VideoReader(video);
%leggo il frame 35
frameX = read(videoSeq, 35);
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
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%estraggo i dati del video
info = get(videoSeq);
nframes = videoSeq.NumberOfFrames;
nframe1 = nframes - 1;

videoDiffer = zeros([size(frameX, 1), size(frameX, 2), 1, nframe1], class(frameBW));
videoDifferBefore = zeros([size(frameX, 1), size(frameX, 2), 1, nframe1], class(frameBW));
threshDiff = 0.3;

for k = 1 : nframe1
    currentFrame = read(videoSeq, k); 
    nextFrame = read(videoSeq, k+1);
    currentFrameGray = rgb2gray(currentFrame);
    nextFrameGray = rgb2gray(nextFrame);
    diff = abs(currentFrameGray - nextFrameGray);
    videoDifferBefore(:,:,:,k) = diff;
    diffBW = imbinarize(diff, threshDiff);
    videoDiffer(:,:,:,k) = diffBW;
end
%visualizzazione
before = implay(videoDifferBefore);
set(before.Parent, 'Name', 'Segmentazione del moto prima della binarizzazione')
after = implay(videoDiffer);
set(after.Parent, 'Name', 'Segmentazione del moto dopo della binarizzazione')
