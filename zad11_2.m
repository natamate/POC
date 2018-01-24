clearvars;
close all;
clc;

Image = imread('ccl2.png');

Image4 = bwlabel(Image, 4);
Image8 = bwlabel(Image, 8);

figure(1);

subplot(1,3,1);
imshow(Image,[]);
title('Oryginal');


subplot(1,3,2);
imshow(Image4,[]);
title('4-elem');

subplot(1,3,3);
imshow(Image8,[]);
title('8-elem');