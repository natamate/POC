clearvars;
close all;

% wczytaj
lena_bmp = imread('lena_gray.bmp');

%konwertuj do obr indeksowanego
[ind, map] = gray2ind(lena_bmp, 256);

figure(1);

imshow(ind, map);

%zmien mape kolorow
map = colormap(summer(256));

figure(2);

imshow(ind, map);

map = colormap(winter(256));

figure(3);

imshow(ind, map);
