clearvars;
close all; 
clc;

Image = imread('lena.bmp');
Image = imresize(Image, 0.25);

I31 = imadjust(Image, [0 1], [0 31/255]);
I15 = imadjust(Image, [0 1], [0 15/255]);
I7 = imadjust(Image, [0 1], [0 7/255]);
I3 = imadjust(Image, [0 1], [0 3/255]);
I1 = imadjust(Image, [0 1], [0 1/255]);

subplot(2,3,1);
imshow(Image);

subplot(2,3,2);
imshow(I31, []);

subplot(2,3,3);
imshow(I15, []);

subplot(2,3,4);
imshow(I7, []);

subplot(2,3,5);
imshow(I3, []);

subplot(2,3,6);
imshow(I1, []);
