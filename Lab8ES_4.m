clearvars;
close all;
clc;

O = imread('calculator.bmp');

O1_erozjaPionowa = imerode(O,ones(1,71));
O1_otwarciePrzezRekonstrukcje = imreconstruct(O1_erozjaPionowa, O);
O1K_otwarcie = imopen(O,ones(1,71));

O2_topHatPrzezRekonstrukcje = imabsdiff(O, O1_otwarciePrzezRekonstrukcje);
O2K_topHat = imtophat(O, ones(1,71));

O3_erozjaPozioma = imerode(O2_topHatPrzezRekonstrukcje, ones(1,11));
O3_rekonstrukcja = imreconstruct(imerode(O2_topHatPrzezRekonstrukcje, ones(1,11)), O2_topHatPrzezRekonstrukcje);

O4_dylatacjaPozioma = imdilate(O3_rekonstrukcja, ones(1,21));
O4_rekonstrukcja = imreconstruct(min(O4_dylatacjaPozioma,O2_topHatPrzezRekonstrukcje),O2_topHatPrzezRekonstrukcje);

%% Poszczegulne etapy
figure(1);
subplot(1,4,1); imshow(O1_otwarciePrzezRekonstrukcje); title('Otwarcie przez rekonstrukcje');
subplot(1,4,2); imshow(O2_topHatPrzezRekonstrukcje); title('Top Hat przez rekonstrukcje');
subplot(1,4,3); imshow(O3_rekonstrukcja); title('Likwidacja odblaskow pionowych');
subplot(1,4,4); imshow(O4_rekonstrukcja); title('Result');

%% Porówanie rekonstrukce do metod klasycznych 
figure(2);
subplot(2,2,1); imshow(O1_otwarciePrzezRekonstrukcje); title('Otwarcie przez rekonstrukcje');
subplot(2,2,2); imshow(O2_topHatPrzezRekonstrukcje); title('Top Hat przez rekonstrukcje');
subplot(2,2,3); imshow(O1K_otwarcie); title('Otwarcie klasyczne');
subplot(2,2,4); imshow(O2K_topHat);  title('Top Hat Klasyczny');

%% Result
figure(3)
imshow(O4_rekonstrukcja); title('Result');

