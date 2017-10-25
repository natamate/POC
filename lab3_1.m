clearvars;
close all; 
clc;

load funkcjeLUT;

%{
figure(1);
plot(kwadratowa);
%}

Image = imread('lena.bmp');
%{
figure(2);
imshow(Image);

ImageLUT = intlut(Image,kwadratowa);
figure(3);
imshow(ImageLUT);
%}

figure('NumberTitle', 'off', 'Name', 'kwadratowa');
LUT(Image,kwadratowa);

figure('NumberTitle', 'off', 'Name', 'log');
LUT(Image,log);

figure('NumberTitle', 'off', 'Name', 'odwrotna');
LUT(Image,odwrotna);

figure('NumberTitle', 'off', 'Name', 'pierwiastkowa');
LUT(Image,pierwiastkowa);

figure('NumberTitle', 'off', 'Name', 'pila');
LUT(Image,pila);

figure('NumberTitle', 'off', 'Name', 'wykladnicza');
LUT(Image,wykladnicza);

figure('NumberTitle', 'off', 'Name', 'odwlog');
LUT(Image,odwlog);