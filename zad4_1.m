clearvars;
close all;
clc;

lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

figure(1);
subplot(4,2,1);
imshow(lena1);
subplot(4,2,2);
imhist(lena1, 256);

subplot(4,2,3);
imshow(lena2);
subplot(4,2,4);
imhist(lena2, 256);

subplot(4,2,5);
imshow(lena3);
subplot(4,2,6);
imhist(lena3, 256);

subplot(4,2,7);
imshow(lena4);
subplot(4,2,8);
imhist(lena4, 256);

hist1 = imread('hist1.bmp');
figure(2);
subplot(2,2,1);
imshow(hist1);

hist1Update = imadjust(hist1);
subplot(2,2,2);
imshow(hist1Update);

subplot(2,2,3);
imhist(hist1);

subplot(2,2,4);
imhist(hist1Update);

%{
hist1Update2 = imadjust(hist1, [0.3 0.7], [0.3 0.6], 256);
subplot(2,3,5);
imshow(hist1Update2);
subplot(2,3,6);
imhist(hist1Update2);
%}

%% histogram skumulowany
hist1 = imread('hist1.bmp');
%hist1Update = imadjust(hist1);
[H,x] = imhist(hist1, 256);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;

figure(3);
subplot(1,2,1);
imshow(hist1);

subplot(1,2,2);
hold on;
plot(x,H);
plot(x,C2);
hold off;

%% wyrownanie histogramu

LUT = uint8(255*(C2/max(C2)));
[H2 x2] = imhist(intlut(hist1,LUT),256);
C3 = cumsum(H2)/(max(cumsum(H2))/max(H2));

%% histogram i histogram skumulowany

figure(4);
subplot(1,5,1);
imshow(intlut(hist1,LUT));

subplot(1,5,5);
histeq(hist1,256);

subplot(1,5,2); 
imhist(intlut(hist1,LUT),256);

subplot(1,5,3);
bar(x2,H2);

subplot(1,5,4); 
plot(x2,C3);

%% manipulacje histogramem
hist1 = imread('hist1.bmp');

figure(5);
subplot(2,2,1); 
imshow(hist1);

subplot(2,2,2);
imshow(imadjust(hist1));

subplot(2,2,3); 
imshow(histeq(hist1, 256));

subplot(2,2,4); 
imshow(adapthisteq(hist1));

%% obrazy rzeczywiste

hist2 = imread('hist2.bmp');

figure(6);
subplot(2,2,1); 
imshow(hist2);

subplot(2,2,2);
imshow(imadjust(hist2));

subplot(2,2,3); 
imshow(histeq(hist2));

subplot(2,2,4); 
imshow(adapthisteq(hist2));

hist3 = imread('hist3.bmp');

figure(7);
subplot(2,2,1); 
imshow(hist3);

subplot(2,2,2); 
imshow(imadjust(hist3));

subplot(2,2,3);
imshow(histeq(hist3));

subplot(2,2,4);
imshow(adapthisteq(hist3));

hist4 = imread('hist4.bmp');

figure(8);
subplot(2,2,1); 
imshow(hist4);

subplot(2,2,2); 
imshow(imadjust(hist4));

subplot(2,2,3);
imshow(histeq(hist4));

subplot(2,2,4); 
imshow(adapthisteq(hist4));