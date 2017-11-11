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

%% wyswietl histogram dla poszczegolnych skladowych
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

%% przekstalcenie do przestrzeni hsv
lenahsv = rgb2hsv(lenargb);

figure(3);
subplot(1,3,1);
imhist(lenahsv(:,:,1));
subplot(1,3,2);
imhist(lenahsv(:,:,2));
subplot(1,3,3); 
imhist(lenahsv(:,:,3));

lenahsvUpdate = lenahsv;
lenahsvUpdate (:,:,2) = histeq(lenahsv(:,:,2),256);
lenahsv2 = hsv2rgb(lenahsvUpdate);

figure(4);
imshow(lenahsv2);

%% dla jeziora
jezioro = imread('jezioro.jpg');

figure(5);
subplot(2,3,1);
imshow(jezioro(:,:,1));

subplot(2,3,2);
imshow(jezioro(:,:,2));

subplot(2,3,3);
imshow(jezioro(:,:,3));

%% wyswietl histogram dla poszczegolnych skladowych
subplot(2,3,4);
imhist(jezioro(:,:,1));

subplot(2,3,5);
imhist(jezioro(:,:,2));

subplot(2,3,6);
imhist(jezioro(:,:,3));

%% Wyrownanie histogramu dla obrazu kolorowego
jezioroUpdate = jezioro;
jezioroUpdate (:,:,1) = histeq(jezioro(:,:,1),256);
jezioroUpdate (:,:,2) = histeq(jezioro(:,:,2),256);
jezioroUpdate (:,:,3) = histeq(jezioro(:,:,3),256);

figure(6);
imshow(jezioroUpdate);

%% przekstalcenie do przestrzeni hsv

jezioroHSV = rgb2hsv(jezioro);

figure(7);
subplot(1,3,1);
imhist(jezioroHSV(:,:,1));

subplot(1,3,2);
imhist(jezioroHSV(:,:,2));

subplot(1,3,3); 
imhist(jezioroHSV(:,:,3));

jezioroHSVUpdate = jezioroHSV;

jezioroHSVUpdate (:,:,3) = histeq(jezioroHSV(:,:,3),256);

jezioroHSV2 = hsv2rgb(jezioroHSVUpdate);

figure(8);
imshow(jezioroHSV2);
