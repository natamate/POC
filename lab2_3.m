clearvars;
close all; 
clc;

ImageOrg = imread('chessboard.bmp');
ImageRes1 = imresize(ImageOrg, 1.5, 'nearest');

figure(1);
imshow(ImageOrg);
title('Original Image');

figure(2);
imshow(ImageRes1);
title('Resized Image Using Nearest-Neighbor');

ImageRes2 = imresize(ImageOrg, 1.5, 'bilinear');

figure(3);
imshow(ImageRes2);
title('Resized Image Using Bilinear Interpolation');

ImageRes3 = imresize(ImageOrg, 1.5, 'bicubic');

figure(4);
imshow(ImageRes3);
title('Resized Image Using Bicubic Interpolation');


