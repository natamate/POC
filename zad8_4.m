clearvars;
close all;
clc;

Image = imread('calculator.bmp');

Image1_erozjaPionowa = imerode(Image,ones(1,71));
Image1_otwarciePrzezRekonstrukcje = imreconstruct(Image1_erozjaPionowa, Image);
Image1_otwarcie = imopen(Image,ones(1,71));

Image2_topHatPrzezRekonstrukcje = imabsdiff(Image, Image1_otwarciePrzezRekonstrukcje);
Image2_topHat = imtophat(Image, ones(1,71));

Image3_erozjaPozioma = imerode(Image2_topHatPrzezRekonstrukcje, ones(1,11));
Image3_rekonstrukcja = imreconstruct(imerode(Image2_topHatPrzezRekonstrukcje, ones(1,11)), Image2_topHatPrzezRekonstrukcje);

Image4_dylatacjaPozioma = imdilate(Image3_rekonstrukcja, ones(1,21));
Image4_rekonstrukcja = imreconstruct(min(Image4_dylatacjaPozioma,Image2_topHatPrzezRekonstrukcje),Image2_topHatPrzezRekonstrukcje);

%% Poszczegolne etapy izolowanie tekstu kalkulator

figure(1);

subplot(1,4,1); 
imshow(Image1_otwarciePrzezRekonstrukcje);
title('Otwarcie przez rekonstrukcje');

subplot(1,4,2);
imshow(Image2_topHatPrzezRekonstrukcje);
title('Top Hat przez rekonstrukcje');

subplot(1,4,3);
imshow(Image3_rekonstrukcja);
title('Likwidacja odblaskow pionowych');

subplot(1,4,4);
imshow(Image4_rekonstrukcja);
title('Wynik');

%% Porówanie rekonstrukcji dla metod klasycznych

figure(2);

subplot(2,2,1);
imshow(Image1_otwarciePrzezRekonstrukcje);
title('Otwarcie przez rekonstrukcje');

subplot(2,2,2);
imshow(Image2_topHatPrzezRekonstrukcje);
title('Top Hat przez rekonstrukcje');

subplot(2,2,3);
imshow(Image1_otwarcie); 
title('Otwarcie klasyczne');

subplot(2,2,4); 
imshow(Image2_topHat); 
title('Top Hat Klasyczny');

%% Wynik
figure(3);

imshow(Image4_rekonstrukcja); 
%title('Wynik');
