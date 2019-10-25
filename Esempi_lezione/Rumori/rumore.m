img = zeros(30,30);
img(5:25, 13:17)=1;

rumor001 = imnoise(img,'gaussian', 0, 0.01); 
rumor01 = imnoise(img,'gaussian', 0, 0.1); 
rumor1 = imnoise(img,'gaussian', 0, 1); 

subplot(2, 4, 1), imshow(img, 'InitialMagnification', 'fit'), title('originale');
subplot(2, 4, 2), imshow(rumor001, 'InitialMagnification', 'fit'), title('rumor 0.01');
subplot(2, 4, 3), imshow(rumor01, 'InitialMagnification', 'fit'), title('rumor 0.1');
subplot(2, 4, 4), imshow(rumor1, 'InitialMagnification', 'fit'), title('rumor 1');

subplot(2, 4, 5), imhist(img), grid;
subplot(2, 4, 6), imhist(rumor001), grid;
subplot(2, 4, 7), imhist(rumor01), grid;
subplot(2, 4, 8), imhist(rumor1), grid;
