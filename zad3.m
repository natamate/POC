clearvars; close all; clc;
IMG1 = imread('lenaRGB.bmp');
figure;

subplot(2,3,1);
imshow(IMG1(:,:,1));
subplot(2,3,2);
imshow(IMG1(:,:,2));
subplot(2,3,3);
imshow(IMG1(:,:,3));
subplot(2,3,4);
imhist(IMG1(:,:,1));
subplot(2,3,5);
imhist(IMG1(:,:,2));
subplot(2,3,6);
imhist(IMG1(:,:,3));

IMG1EQ = IMG1;
IMG1EQ (:,:,1) = histeq(IMG1(:,:,1),256);
IMG1EQ (:,:,2) = histeq(IMG1(:,:,2),256);
IMG1EQ (:,:,3) = histeq(IMG1(:,:,3),256);
figure;
imshow(IMG1EQ);

IMG2 = rgb2hsv(IMG1);
figure;
subplot(1,3,1);
imhist(IMG2(:,:,1));
subplot(1,3,2);
imhist(IMG2(:,:,2));
subplot(1,3,3); 
imhist(IMG2(:,:,3));

IMG2EQ = IMG2;
IMG2EQ (:,:,3) = histeq(IMG2(:,:,3),256);
IMG21 = hsv2rgb(IMG2EQ);
figure;
imshow(IMG21);

IMG3 = imread('jezioro.jpg');

subplot(2,3,1);
imshow(IMG3(:,:,1));
subplot(2,3,2);
imshow(IMG3(:,:,2));
subplot(2,3,3);
imshow(IMG3(:,:,3));
subplot(2,3,4);
imhist(IMG3(:,:,1));
subplot(2,3,5);
imhist(IMG3(:,:,2));
subplot(2,3,6);
imhist(IMG3(:,:,3));

IMG3EQ = IMG3;
IMG3EQ (:,:,1) = histeq(IMG3(:,:,1),256);
IMG3EQ (:,:,2) = histeq(IMG3(:,:,2),256);
IMG3EQ (:,:,3) = histeq(IMG3(:,:,3),256);
figure;
imshow(IMG3EQ);


IMG4 = rgb2hsv(IMG3);
figure;
subplot(1,3,1);
imhist(IMG4(:,:,1));
subplot(1,3,2);
imhist(IMG4(:,:,2));
subplot(1,3,3); 
imhist(IMG4(:,:,3));

IMG4EQ = IMG4;
IMG4EQ (:,:,3) = histeq(IMG4(:,:,3),256);
IMG41 = hsv2rgb(IMG4EQ);
figure;
imshow(IMG41);