clearvars;
close all;
clc;

Image = imread('calculator.bmp');

figure(1);
subplot(1,5,1);
imshow(Image);
title('Oryginal');

%% OTWARCIE PRZEZ rekonstrukcje

marker = imerode(Image, ones(1,71));
mask = Image;
ImageReconstruct = imreconstruct(marker, mask);

subplot(1,5,2);
imshow(ImageReconstruct);
title('Rekonstrukcja');

%% Top hat poprzez rekonstrukcje
ImageTopHat = Image - ImageReconstruct;

subplot(1,5,3);
imshow(ImageTopHat);
title('Top Hat');


%% likwidacja odblaskow pionowych

marker = imerode(ImageTopHat, ones(1,11));
mask = ImageTopHat;
ImageLoss = imreconstruct(marker, mask);

subplot(1,5,4)
imshow(ImageLoss);
title('Likwidacja odblasków pionowych');

%% rekonstrukcja z markerem postaci minimum

ImageImdilate = imdilate(ImageLoss, ones(1,21));

marker = min(ImageImdilate, ImageTopHat);
mask = ImageTopHat;
ImageMinimum = imreconstruct(marker, mask);

subplot(1,5,5);
imshow(ImageMinimum);
title('Efekt końcowy');

%% Porownanie otwarcie klasyczne i przez rekonstrukcje
figure(2);

subplot(2,1,1);
imshow(ImageReconstruct);
title('Rekonstrukcja');

subplot(2,1,2);
imshow(imopen(Image, ones(1,71)));
title('Imopen');

%% Porownanie Top Hat

figure(3); 
subplot(2,1,1);
imshow(ImageTopHat);
title('TOPHAT poprzez rekonstrukcji');

subplot(2,1,2);
imshow(imtophat(Image,ones(1,71)));
title('Klasyczny top hat');