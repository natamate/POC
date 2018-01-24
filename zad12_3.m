clearvars;
close all;
clc;

Image = imread('kolo.bmp');

%% odwrotna dwuwymiarowa transformata Fouriera

ImageF = fft2(Image);
ImageShift = fftshift(ImageF);

%% odwrotne    przesunieci
ImageUnshift = ifftshift(ImageShift);

%% odwrotna operacja
ImageUnf = ifft2(ImageUnshift);

figure(1);
subplot(1,3,1); 
imshow(Image);

subplot(1,3,2);
imshow(ImageUnf);

subplot(1,3,3); 
imshow(imabsdiff(Image,uint8(ImageUnf)), []);
