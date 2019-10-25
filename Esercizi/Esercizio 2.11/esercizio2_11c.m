%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script Esercizio 2.11
%
%Considerare la sequenza videoPersonal.X e ripetere le operazioni effettuate al punto (b)
%
%Nonis Mauro 123350
%21 maggio 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
video = 'video/mouse.mp4';
%visualizzo il video
implay(video);
videoSeq = VideoReader(video);
%leggo il frame 35
frameX = read(videoSeq, 35);
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
