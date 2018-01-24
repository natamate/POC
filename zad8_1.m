clearvars;
close all;
clc;

Image = imread('ertka.bmp');

figure(1);
subplot(1,2,1);
imshow(Image);

%% operacja erozji
SE = strel('square', 3);
ImageErode = imerode(Image, SE);

subplot(1,2,2);
imshow(ImageErode);
title('Erozja');

%% zmiana elementow strukturalnych 

figure(2);
subplot(1,3,1);
imshow(ImageErode);

SE = strel('sphere', 3);
ImageErode = imerode(Image, SE);

subplot(1,3,2);
imshow(ImageErode);
title('Erozja sphere');

SE = strel('diamond', 3);
ImageErode = imerode(Image, SE);

subplot(1,3,3);
imshow(ImageErode);
title('Erozja diamond');

%% zwiekszanie liczby iteracji dla erozji

figure(3);
SE = strel('square', 3);
ImageErode = imerode(Image, SE);

subplot(1,2,1);
imshow(ImageErode);

ImageErode2 = imerode(ImageErode, SE);
ImageErode3 = imerode(ImageErode2, SE);
ImageErode4 = imerode(ImageErode3, SE);

subplot(1,2,2);
imshow(ImageErode4);
title('Kilkukrotna Erozja');

%% usun wlosy

Image = imread('buzka.bmp');

M = [1 0 0;
    0 1 0;
    0 0 1];

%{
 lub ta druga  str

M = [0 0 1;
    0 1 0;
    1 0 0];
%}
    
ImageErode = imerode(Image, M);

figure(4);
subplot(1,2,1);
imshow(Image);

subplot(1,2,2);
imshow(ImageErode);

%% dylatacja

Image = imread('ertka.bmp');

ImageImdilate = imdilate(Image, SE);


figure(5); 

subplot(1,2,1);
imshow(Image);

subplot(1,2,2);
imshow(ImageImdilate);
title('Dylatacja');

%% operacje morfologiczne

%Image = imread('wyspa.bmp');
Image = imread('kolka.bmp');
%Image = imread('ertka.bmp');

figure(6);
subplot(1,5,1);
imshow(Image);
title('oryginalny');

subplot(1,5,2);
SE = strel('square', 3);
ImageErode = imerode(Image, SE);
imshow(ImageErode);
title('Erozja');

subplot(1,5,3);
imshow(ImageImdilate);
title('Dylatacja');

subplot(1,5,4);
ImageImOpen = imopen(Image,SE);
imshow(ImageImOpen);
title('Otwarcie');

subplot(1,5,5);
ImageImClose = imclose(Image,SE);
imshow(ImageImClose);
title('Zamknięcie');

%% Wykonanie krzyzykow

Image = imread('hom.bmp');

SE1 = [0 1 0;
       1 1 1;
       0 1 0;];

SE2 = [1 0 1;
       0 0 0;
       1 0 1;];
   
Imagebwhitmiss = bwhitmiss(Image, SE1, SE2);

figure(7);
subplot(2,1,1);
imshow(Image);

subplot(2,1,2);
imshow(Imagebwhitmiss);
