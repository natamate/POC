clearvars;
close all;
clc;

Image = imread('fingerprint.bmp');

%% scienianie

figure(1);
subplot(1,4,1);
imshow(Image);

Image2 = bwmorph(Image, 'thin', 1);
subplot(1,4,2);
imshow(Image2);
title('n = 1');

Image2 = bwmorph(Image, 'thin', 2);
subplot(1,4,3);
imshow(Image2);
title('n = 2');

Image2 = bwmorph(Image, 'thin', Inf);
subplot(1,4,4);
imshow(Image2);
title('n = Inf');

%% szkieletyzacja

Image = imread('kosc.bmp');

figure(2);
subplot(1,2,1);
imshow(Image);

Image2 = bwmorph(Image, 'skel', Inf);
subplot(1,2,2);
imshow(Image2);

%% otwarcie przez rekonstrukcje

Image = imread('text.bmp');

figure(3);

subplot(1,5,1);
imshow(Image);

SE = ones(51, 1);

subplot(1,5,2);
imshow(imopen(Image,SE));
title('Maska pionowa');

%% rekonstrukcja

marker = imerode(Image, SE);
mask = Image;
ImageReconstruct = imreconstruct(marker, mask);

subplot(1,5,3);
imshow(ImageReconstruct);
title('Rekonstrukcja');

%% Wypelnianie dziur

ImageFill = imfill(Image,'holes');

subplot(1,5,4);
imshow(ImageFill);
title('Wypelnienie dziur');

%% czyszczenie brzegu
Imageclear = imclearborder(Image);

subplot(1,5,5);
imshow(Imageclear);
title('Czyszczenie brzegu');
