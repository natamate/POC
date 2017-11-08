clearvars;
close all;
clc;

phobos = imread('phobos.bmp');

figure(1);
subplot(1,6,1);
imshow(phobos);

subplot(1,6,2);
imshow(histeq(phobos));

load histogramZadany;

%{
figure(2)
imshow(histogramZadany);
%}

subplot(1,6,3);
imshow(histeq(phobos,histogramZadany));

subplot(1,6,4);
imshow(imadjust(phobos));

subplot(1,6,5);
imshow(adapthisteq(phobos));

subplot(1,6,6);
imhist(phobos);