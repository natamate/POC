clearvars;
close all; 
clc;

Kolo = imread('kolo.bmp');
Kwadrat = imread('kwadrat.bmp');

KoloB = boolean(Kolo);
KwadratB = boolean(Kwadrat);

KoloNOT = ~KoloB;
KoloANDKwadrat = KwadratB&KoloB;
KoloORKwadrat = KwadratB|KoloB;
KoloXORKwadrat = xor(KwadratB,KoloB);

subplot(2,3,1);
imshow(KoloB);
subplot(2,3,2);
imshow(KwadratB);
subplot(2,3,3);
imshow(KoloNOT);
subplot(2,3,4);
imshow(KoloANDKwadrat);
subplot(2,3,5);
imshow(KoloORKwadrat);
subplot(2,3,6);
imshow(KoloXORKwadrat);
