clearvars;
close all;
clc; 

Image = imread('kw.bmp');

load maskiPP;

%% Gradient Robertsa
figure(1);

subplot(2,3,1);
imshow(Image);

ImageSkal = conv2(double(Image), R1, 'same') + 128;

subplot(2,3,2);
imshow(ImageSkal, []);
title('skalowanie');

ImageModul = abs(conv2(double(Image), R1, 'same'));

subplot(2,3,3);
imshow(ImageModul, []);
title('modul');

subplot(2,3,4);
imshow(Image);

ImageSkal = conv2(double(Image), R2, 'same') + 128;

subplot(2,3,5);
imshow(ImageSkal, []);
title('skalowanie');

ImageModul = abs(conv2(double(Image), R2, 'same'));

subplot(2,3,6);
imshow(ImageModul, []);
title('modul');

%% Gradient Prewitta

figure(2);

subplot(2,3,1);
imshow(Image);

ImageSkal = conv2(double(Image), P1, 'same') + 128;

subplot(2,3,2);
imshow(ImageSkal, []);
title('skalowanie');

ImageModul = abs(conv2(double(Image), P1, 'same'));

subplot(2,3,3);
imshow(ImageModul, []);
title('modul');

subplot(2,3,4);
imshow(Image);

ImageSkal = conv2(double(Image), P2, 'same') + 128;

subplot(2,3,5);
imshow(ImageSkal, []);
title('skalowanie');

ImageModul = abs(conv2(double(Image), P2, 'same'));

subplot(2,3,6);
imshow(ImageModul, []);
title('modul');

%% Gradient Sobela

figure(3);

subplot(2,3,1);
imshow(Image);

ImageSkal = conv2(double(Image), S1, 'same') + 128;

subplot(2,3,2);
imshow(ImageSkal, []);
title('skalowanie');

ImageModul = abs(conv2(double(Image), S1, 'same'));

subplot(2,3,3);
imshow(ImageModul, []);
title('modul');

subplot(2,3,4);
imshow(Image);

ImageSkal = conv2(double(Image), S2, 'same') + 128;

subplot(2,3,5);
imshow(ImageSkal, []);
title('skalowanie');

ImageModul = abs(conv2(double(Image), S2, 'same'));

subplot(2,3,6);
imshow(ImageModul, []);
title('modul');

Image = imread('jet.bmp');

%% Filtr kombinowany

figure(4);
OS1 = conv2(double(Image), S1, 'same');
OS2 = conv2(double(Image), S2, 'same');
OW = sqrt((OS1 .^ 2) + (OS2 .^ 2));

subplot(2, 2, 1);
imshow(Image);

subplot(2, 2, 2);
imshow(OW, []);
title('pierwiastek z sumy kwadratow');

%% Kombinowany filtr wersja alternatywna

OW = abs(OS1) + abs(OS2);

subplot(2, 2, 3);
imshow(Image);

subplot(2, 2, 4);
imshow(OW, []);
title('suma modułów');



















%{



close all;
clearvars;
clc;
kw = imread('kw.bmp');
load('maskiPP.mat');

figure;
subplot(2, 1, 1);
imshow(conv2(double(kw), R1, 'same') + 128);
subplot(2, 1, 2);
imshow(abs(conv2(double(kw), R1, 'same')));

figure;
subplot(2, 1, 1);
imshow(conv2(double(kw), R2, 'same') + 128);
subplot(2, 1, 2);
imshow(abs(conv2(double(kw), R2, 'same')));

figure;
subplot(2, 1, 1);
imshow(conv2(double(kw), P1, 'same') + 128);
subplot(2, 1, 2); 
imshow(abs(conv2(double(kw), P1, 'same')));

figure;
subplot(2, 1, 1);
imshow(conv2(double(kw), P2, 'same') + 128);
subplot(2, 1, 2);
imshow(abs(conv2(double(kw), P2, 'same')));

figure;
subplot(2, 1, 1);
imshow(conv2(double(kw), S1, 'same') + 128);
subplot(2, 1, 2);
imshow(abs(conv2(double(kw), S1, 'same')));

figure;
subplot(2, 1, 1); 
imshow(conv2(double(kw), S2, 'same') + 128);
subplot(2, 1, 2);
imshow(abs(conv2(double(kw), S2, 'same')));

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt((OS1 .^ 2) + (OS2 .^ 2));
subplot(2, 1, 1);
imshow(kw);
subplot(2, 1, 2);
imshow(OW, []);

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = abs(OS1) + abs(OS2);
subplot(2, 1, 1);
imshow(kw);
subplot(2, 1, 2);
imshow(OW, []);

kw = imread('jet.bmp');

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = sqrt((OS1 .^ 2) + (OS2 .^ 2));
subplot(2, 1, 1); 
imshow(kw);
subplot(2, 1, 2);
imshow(OW, []);

figure;
OS1 = conv2(double(kw), S1, 'same');
OS2 = conv2(double(kw), S2, 'same');
OW = abs(OS1) + abs(OS2);
subplot(2, 1, 1);
imshow(kw);
subplot(2, 1, 2);
imshow(OW, [])
%}