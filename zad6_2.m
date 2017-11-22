clearvars;
close all;
clc; 

%% filtry nieliniowe mediana

Image = imread('lenaSzum.bmp');

ImageMediana = medfilt2(Image, [3, 3]);

figure(1);
subplot(2,3,1);
imshow(Image);

subplot(2,3,2);
imshow(ImageMediana);

subplot(2,3,3);
imshow(imabsdiff(Image, ImageMediana), []);

%% porównanie medianowej i uśredniającej

ImageDouble = double(Image);

h = fspecial('average', 3);

hDouble = double(h);

ImageFiltr = uint8(conv2(ImageDouble,hDouble,'same'));

ImageDiffFiltr = imabsdiff(Image,ImageFiltr);

subplot(2,3,4);
imshow(Image);

subplot(2,3,5);
imshow(ImageFiltr);

subplot(2,3,6);
imshow(ImageDiffFiltr, []);

%% posteryzacja


ImagePoster = Image;
for i = 1:10
    ImagePoster = medfilt2(ImagePoster, [5, 5]);
end

figure(2);
imshow(ImagePoster);
