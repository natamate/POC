close all;
clearvars;
clc;

Image = imread('lena.bmp');

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
title('Czestotliwosc');

%% filtracja dolnoprzepustowa

%% tworzymy filtr kolowy dolno przepustowy
%generujemy przestrzen
[f1,f2] = freqspace(512,'meshgrid');
%poczatkowi inicjujemy filtr 1
Hd = ones(512);

r = sqrt(f1.^2 + f2.^2);
%wybierz zakres
Hd(r>0.1) = 0;
%Hd(r<0.9) = 0;
%Hd(r<0.1 | r > 0.9) = 0;

%wizualziacja
figure(3);
colormap(jet(64));
mesh(f1,f2,Hd);

% mnozeie f obrazu przez filtr
ImageFiltered = ImageShift .* Hd;

figure(4);
subplot(1,2,1);
imshow(ImageFiltered);

%% operacja odwrotnego przesuniecia i odwrotnej transformaty
ImageUnshift = ifftshift(ImageFiltered);
ImageUnf = ifft2(ImageUnshift);

subplot(1,2,2)
imshow(ImageUnf,[]);

%%

%% tworzenie filtra 2D
h = fwind1(Hd,hanning(21));

%% wyzn odpowiedz filtra
[H f1 f2] = freqz2(h,512,512);
figure(5);
mesh(f1,f2,H);

figure(6);
ImageFiltered = ImageShift .* H;

subplot(1,2,1);
imshow(ImageFiltered);


ImageUnshift = ifftshift(ImageFiltered);
ImageUnf = ifft2(ImageUnshift);
subplot(1,2,2);
imshow(ImageUnf,[]);
