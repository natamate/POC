clearvars;
close all; 
clc;

Image = imread('lena.bmp');

Image256 = imresize(Image, 0.5, 'bilinear');

Image128 = imresize(Image, 0.25, 'bilinear');

Image64 = imresize(Image, 0.125, 'bilinear');

figure(1);
imshow(Image);
title('Original size');

figure(2);
imshow(Image256, 'InitialMagnification', 200);
title('256 x 256');

figure(3);
imshow(Image128, 'InitialMagnification', 400);
title('128 x 128');

figure(4);
imshow(Image64, 'InitialMagnification', 800);
title('64 x 64');