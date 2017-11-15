clearvars;
close all;
clc;

Coins = imread('coins.png');

figure(1);
subplot(1,2,1);
imshow(Coins);

subplot(1,2,2);
imhist(Coins);

%% binaryzacja

Im2bw = imbinarize(Coins, 82/255);

figure(2);
imshow(Im2bw);

%% szum

Figura = imread('figura.png');

figure(3);
subplot(1,2,1);
imshow(Figura);

subplot(1,2,2);
imhist(Figura);

Figura2 = imread('figura2.png');
figure(4);
subplot(1,2,1);
imshow(Figura2);

subplot(1,2,2);
imhist(Figura2);

Figura3 = imread('figura3.png');
figure(5);
subplot(1,2,1);
imshow(Figura3);

subplot(1,2,2);
imhist(Figura3);

Figura4 = imread('figura4.png');
figure(6);
subplot(1,2,1);
imshow(Figura4);

subplot(1,2,2);
imhist(Figura4);

%% metoda Otsu
Otsu = graythresh(Coins);
% Otsu = 0.4941 (recznie 82/255 = 0.3216)
ImageOtsu = imbinarize(Coins, Otsu);

%% kittler
Kittler = clusterKittler(Coins) / 255;
InageKittler = imbinarize(Coins, Kittler);

%% Yen
Yen = entropyYen(Coins) / 255;
ImageYen = imbinarize(Coins, Yen);

figure(7);

subplot(2,3,1); 
imshow(Coins);

subplot(2,3,4);
imhist(Coins);

subplot(2,3,2);
imshow(Im2bw); 
title('Metoda ręczna 0.3216');

subplot(2,3,3); 
imshow(ImageOtsu); 
title(['Metoda Otsu ', num2str(Otsu)]);

subplot(2,3,5); 
imshow(InageKittler); 
title(['Metoda Kittler ', num2str(Kittler)]);

subplot(2,3,6); 
imshow(ImageYen); 
title(['Metoda Yen ', num2str(Yen)]);

%% Porównanie metod dla innych obrazów

Rice = imread('rice.png');

Im2bw = imbinarize(Rice, 120/255);

%% metoda Otsu
Otsu = graythresh(Rice);
% Otsu = 0.4941 (recznie 82/255 = 0.3216)
ImageOtsu = imbinarize(Rice, Otsu);

%% kittler
Kittler = clusterKittler(Rice) / 255;
InageKittler = imbinarize(Rice, Kittler);

%% Yen
Yen = entropyYen(Rice) / 255;
ImageYen = imbinarize(Rice, Yen);

figure(8);

subplot(2,3,1); 
imshow(Rice);

subplot(2,3,4);
imhist(Rice);

subplot(2,3,2);
imshow(Im2bw); 
title('Metoda ręczna 0.4706');

subplot(2,3,3); 
imshow(ImageOtsu); 
title(['Metoda Otsu ', num2str(Otsu)]);

subplot(2,3,5); 
imshow(InageKittler); 
title(['Metoda Kittler ', num2str(Kittler)]);

subplot(2,3,6); 
imshow(ImageYen); 
title(['Metoda Yen ', num2str(Yen)]);

%% tekst

Tekst = imread('tekst.bmp');

Im2bw = imbinarize(Tekst, 140/255);

%% metoda Otsu
Otsu = graythresh(Tekst);
ImageOtsu = imbinarize(Tekst, Otsu);

%% kittler
Kittler = clusterKittler(Tekst) / 255;
InageKittler = imbinarize(Tekst, Kittler);

%% Yen
Yen = entropyYen(Tekst) / 255;
ImageYen = imbinarize(Tekst, Yen);

figure(9);

subplot(2,3,1); 
imshow(Tekst);

subplot(2,3,4);
imhist(Tekst);

subplot(2,3,2);
imshow(Im2bw); 
title('Metoda ręczna 0.5490');

subplot(2,3,3); 
imshow(ImageOtsu); 
title(['Metoda Otsu ', num2str(Otsu)]);

subplot(2,3,5); 
imshow(InageKittler); 
title(['Metoda Kittler ', num2str(Kittler)]);

subplot(2,3,6); 
imshow(ImageYen); 
title(['Metoda Yen ', num2str(Yen)]);

%% obiekty.bmp
Obiekty = imread('obiekty.bmp');

Im2bw = imbinarize(Obiekty, 140/255);

%% metoda Otsu
Otsu = graythresh(Obiekty);
ImageOtsu = imbinarize(Obiekty, Otsu);

%% kittler
Kittler = clusterKittler(Obiekty) / 255;
InageKittler = imbinarize(Obiekty, Kittler);

%% Yen
Yen = entropyYen(Obiekty) / 255;
ImageYen = imbinarize(Obiekty, Yen);

figure(10);

subplot(2,3,1); 
imshow(Obiekty);

subplot(2,3,4);
imhist(Obiekty);

subplot(2,3,2);
imshow(Im2bw); 
title('Metoda ręczna 0.5490');

subplot(2,3,3); 
imshow(ImageOtsu); 
title(['Metoda Otsu ', num2str(Otsu)]);

subplot(2,3,5); 
imshow(InageKittler); 
title(['Metoda Kittler ', num2str(Kittler)]);

subplot(2,3,6); 
imshow(ImageYen); 
title(['Metoda Yen ', num2str(Yen)]);

%% katalog.bmp
Katalog = imread('katalog.bmp');

Im2bw = imbinarize(Katalog, 140/255);

%% metoda Otsu
Otsu = graythresh(Katalog);
ImageOtsu = imbinarize(Katalog, Otsu);

%% kittler
Kittler = clusterKittler(Katalog) / 255;
InageKittler = imbinarize(Katalog, Kittler);

%% Yen
Yen = entropyYen(Katalog) / 255;
ImageYen = imbinarize(Katalog, Yen);

figure(11);

subplot(2,3,1); 
imshow(Obiekty);

subplot(2,3,4);
imhist(Obiekty);

subplot(2,3,2);
imshow(Im2bw); 
title('Metoda ręczna 0.5490');

subplot(2,3,3); 
imshow(ImageOtsu); 
title(['Metoda Otsu ', num2str(Otsu)]);

subplot(2,3,5); 
imshow(InageKittler); 
title(['Metoda Kittler ', num2str(Kittler)]);

subplot(2,3,6); 
imshow(ImageYen); 
title(['Metoda Yen ', num2str(Yen)]);
