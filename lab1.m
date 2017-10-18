clearvars;
close all;

%% Informacje o plikach
info_bmp = imfinfo('lena.bmp');
info_jpg = imfinfo('lena.jpg');

%% 6
%% Wczytywanie
lena_jpg = imread('lena.jpg');
lena_bmp = imread('lena.bmp');

%% Wyswieltanie
figure(1);
imshow(lena_jpg);
figure(2);
imshow(lena_bmp);

% 7
%% Konwersja do skali szarosci
lena_gray = rgb2gray(lena_bmp);
figure(3);
imshow(lena_gray);

% 8
imwrite(lena_gray, 'lena_gray.bmp');

% 9
%% Wyswietlanie jako funkcja dwuwymiarowa
figure(4);
colormap gray;
mesh(lena_gray);

%% Przekroje
figure(5);
plot(lena_gray(10,:));
figure(6);
plot(lena_gray(:,10));