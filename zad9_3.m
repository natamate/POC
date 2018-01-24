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
%ImageCompl = ImageBin;
ElStruct = ones(1,100);
Marker = imerode(ImageCompl,ElStruct);

ImageRekon = imreconstruct(Marker,ImageCompl);
%Image2 = imcomplement(ImageRekon);

subplot(2,2,3);
imshow(ImageRekon);
title('Rekonstrukcja');

%% wykrywanie krawedzi
Imagedetekcja = edge(ImageRekon,'canny');

subplot(2,2,4);
imshow(Imagedetekcja);
title('Wykrywanie krawedzi');

%% Hough
[H theta rho] = hough(Imagedetekcja);

figure(2);
imshow(H,[]);

%% dorysuj maksima
peaks = houghpeaks(H,8);
hold on;
plot(peaks(:,2),peaks(:,1),'o');
hold off;

%% houghlines

lines = houghlines(Imagedetekcja,theta,rho,peaks);

figure(3);

imshow(Imagedetekcja);
hold on;

max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1;
   lines(k).point2];
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
