clearvars;
close all;
clc;

lenargb = imread('lenaRGB.bmp');

figure(1)
subplot(2,4,1);
imshow(lenargb);

lenaR = lenargb(:, :, 1);
subplot(2,4,3);
imshow(lenaR);

subplot(2,4,4);
imhist(lenaR);

lenaG = lenargb(:, :, 2);
subplot(2,4,5);
imshow(lenaG);

subplot(2,4,6);
imhist(lenaG);

lenaB = lenargb(:, :, 3);
subplot(2,4,7);
imshow(lenaB);

subplot(2,4,8);
imhist(lenaB);

%% Wyrownanie histogramu dla obrazu kolorowego
imgUpdate = lenargb;
imgUpdate(:,:,1) = histeq(lenaR);
imgUpdate(:,:,2) = histeq(lenaG);
imgUpdate(:,:,3) = histeq(lenaB);

figure(2);
imshow(imgUpdate);

lenahsv = rgb2hsv(lenargb);

figure(2);
subplot(1,3,1);
imhist(lenahsv(:,:,1));
subplot(1,3,2);
imhist(lenahsv(:,:,2));
subplot(1,3,3); 
imhist(lenahsv(:,:,3));

lenahsvUpdate = lenahsv;
lenahsvUpdate (:,:,2) = histeq(lenahsv(:,:,2),256);
lenahsv2 = hsv2rgb(lenahsvUpdate);

figure(3);
imshow(lenahsv2);

%{


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
%}