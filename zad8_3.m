clearvars;
close all;
clc;

Image = imread('ferrari.bmp');

SE = strel('square', 3);
ImageImerode = imerode(Image, SE);
ImageImdilate = imdilate(Image, SE);

figure(1); 

subplot(2,3,1);
imshow(Image);
title('Oryginalny');

subplot(2,3,2);
imshow(ImageImerode);
title('Erozja');

subplot(2,3,3);
imshow(ImageImdilate);
title('Dylatacja');

% gradient morfologiczny ?? 
ImageDiff = ImageImdilate - ImageImerode;

subplot(2,3,4);
imshow(ImageDiff);
title('Gradient morfologiczny');

subplot(2,3,5);
imshow(imtophat(Image, SE));
title('top-hat');


subplot(2,3,6);
imshow(imbothat(Image, SE));
title('bottom-hat');

%% Niejednorodnosc oswietlenia

Image2 = imread('rice.png');
Image2Disk = imtophat(Image2, strel('disk', 10));

figure(2);
subplot(1,2,1);
imshow(Image2);

subplot(1,2,2);
imshow(Image2Disk);