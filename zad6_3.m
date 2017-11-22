clearvars;
close all;
clc; 

%% filtry liniowe gornoprzepustowe

%% laplasjan

Image = imread('moon.tif');

M = [0 1 0; 1 -4 1; 0 1 0];

M = M/9;

figure(1);

subplot(1,5,1);
imshow(Image);

ImageSkal = conv2(double(Image), M, 'same') + 128;

subplot(1,5,2);
imshow(ImageSkal, []);
title('skalowanie');

ImageModul = abs(conv2(double(Image), M, 'same'));

subplot(1,5,3);
imshow(ImageModul, []);
title('modul');

h = fspecial('laplacian');
ImageLaplacian = conv2(double(Image), double(h), 'same');

subplot(1,5,4);
imshow(ImageLaplacian, []);
title('laplasjan');

subplot(1,5,5);
imshow(double(Image) - double(ImageLaplacian), []);
title('oryginal - filtracja');




















%{

close all;
clearvars;
clc;
moon = imread('moon.tif');
M = [
    0 1 0;
    1 -4 1;
    0 1 0
    ];
M = M / 9;

figure;
imshow(moon);

figure;
moon_scal = conv2(double(moon), M, 'same') + 128;
imshow(moon_scal, []);

figure;
moon_abs = abs(conv2(double(moon), M, 'same'));
imshow(moon_abs, []);

figure;
h = fspecial('laplacian');
moon_lap = conv2(double(moon), double(h), 'same');
imshow(moon_lap, []);

figure;
imshow(double(moon) - double(moon_lap), []);
%}