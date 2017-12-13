clearvars;
close all;
clc;

Image = imread('lab112.png');

%% Wyodrebnij krawedzie kwadratow
figure(1);

subplot(2,2,1);
imshow(Image);
title('Oryginalny');

%% binaryzacja

ImageBin = im2bw(Image, 0.4);

subplot(2,2,2);
imshow(ImageBin);
title('Binaryzacja');

%% rekonstrukcja

ImageCompl = imcomplement(ImageBin);
el_strukt = ones(1,100);
marker = imerode(ImageCompl,el_strukt);

ImageRekon = imreconstruct(marker,ImageCompl);
Image2 = imcomplement(ImageRekon);

subplot(2,2,3);
imshow(Image2);
title('Rekonstrukcja');

%% wykrywanie krawedzi
Imagedet = edge(ImageRekon,'canny');

subplot(2,2,4);
imshow(Imagedet);
title('Wykrywanie krawedzi');

































%{
clearvars;
close all;
clc;

%% wczytanie i wyswietlenie obrazka
I = imread('lab112.png');
imshow(I);
%% binaryzacja

BW = im2bw(I,0.4);
figure(1);
imshow(BW);
%% rekonstrukcja
BWneg = imcomplement(BW);
el_strukt = ones(1,100);
marker = imerode(BWneg,el_strukt);
Irecon = imreconstruct(marker,BWneg);
BW2 = imcomplement(Irecon);
imshow(BW2);

%% wykrywanie krawedzi
Idet = edge(Irecon,'canny');
subplot(1,2,1);
imshow(Idet);

%%
[H theta rho] = hough(Idet);

figure(2);
imshow(H,[]);

hold on;
peaks = houghpeaks(H,8);
plot(peaks,'o');
hold off;

%% houghlines

lines = houghlines(Idet,theta,rho,peaks);

figure, imshow(Idet), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

%% domek

I = imread('dom.png');
Idet = edge(I,'log');
imshow(Idet);

[H theta rho] = hough(Idet);

%% poszukiwanie maksimow houghpeaks

peaks = houghpeaks(H,20);
plot(peaks,'o');

%% houghlines

lines = houghlines(Idet,theta,rho,peaks);

figure, imshow(Idet), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
%}