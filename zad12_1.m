clearvars;
close all;
clc;

Image = imread('dwieFale.bmp');

figure(1);
subplot(1,3,1);
imshow(Image);
title('oryginal');

%% uzyskanie F-obrazu przez wykonanie transformaty Fouriera
ImageF = fft2(Image);
subplot(1,3,2);
imshow(ImageF);
title('F-obraz');

%% przesuniecie F-obrazow
ImageShift = fftshift(ImageF);
subplot(1,3,3);
imshow(ImageShift);
title('Po przesunieciu');

%% wyznaczenie amplitudy i fazy

A = abs(ImageShift);

F = angle(ImageShift.*(A>0.0001));

A = log10(A+1);

figure(2);

subplot(1,3,1);
imshow(ImageShift);

subplot(1,3,2);
imshow(A,[]);
title('Amplituda');

subplot(1,3,3);
imshow(F,[]);
title('Faza');

%% wczytanie po kolei kolejnych figur
Image = imread('kolo.bmp');
%Image = imread('kwadrat.bmp');
%Image = imread('kwadrat45.bmp');
%Image = imread('trojkat.bmp');

figure(3);
subplot(1,3,1);
imshow(Image);
title('oryginal');

ImageF = fft2(Image);
subplot(1,3,2);
imshow(ImageF);
title('F-obraz');

ImageShift = fftshift(ImageF);
subplot(1,3,3);
imshow(ImageShift);
title('Po przesunieciu');
%% mozna cos wywnioskowac o kierunku krawedzi z F-obrazu po przesunieciu poiewaz widac wyrazne krawedzie dla poszczegolych figur

%% transformacja przez dwie transformaty jednowymiarowe

Image = imread('kolo.bmp');
%Image = imread('kwadrat.bmp');
%Image = imread('kwadrat45.bmp');
%Image = imread('trojkat.bmp');

%% transf po wierszach
F1 = fft(Image,[],1);

%% transf po kolumnach
F2 = fft(F1,[],2);

figure(4);
subplot(1,2,1);
imshow(F2);
title('zlozenie transformat');

F = fft2(Image);
subplot(1,2,2);
imshow(F);
title('fft2');


