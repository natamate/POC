clearvars;
close all;
clc;

%% Detekcja krawedzi
Image = imread('dom.png');
figure(1);
subplot(1,3,1);
imshow(Image);
title('Oryginal');

ImageEdge = edge(Image, 'log');
subplot(1,3,2);
imshow(ImageEdge);
title('Log');

ImageEdge = edge(Image, 'canny');
subplot(1,3,3);
imshow(ImageEdge);
title('Canny');

figure(2);
subplot(2,3,1);
imshow(edge(Image, 'sobel'));
title('Sobel auto');

subplot(2,3,4);
imshow(edge(Image, 'sobel', 0.15));
title('Sobel 0.15');

subplot(2,3,2);
imshow(edge(Image, 'log'));
title('Log auto');

subplot(2,3,5); 
imshow(edge(Image, 'log', 0.01));
title('Log 0.01');

subplot(2,3,3);
imshow(edge(Image, 'canny'));
title('Canny auto');

subplot(2,3,6); 
imshow(edge(Image, 'canny', 0.2));
title('Canny 0.2');