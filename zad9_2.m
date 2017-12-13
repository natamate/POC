clearvars;
close all;
clc;

Image = imread('kwadraty.png');

%% detekcja krawedzi

figure(1)
subplot(1,2,1);
imshow(Image);

ImageDetekcja = edge(Image,'log');
subplot(1,2,2);
imshow(ImageDetekcja);

%% Hough

[H theta rho] = hough(ImageDetekcja);

figure(2);
subplot(1,2,1);

imshow(H,[]);
hold on;

%% wyszukiwanie maksimow

peaks = houghpeaks(H,8);
plot(peaks,'o');

%% houghlines

lines = houghlines(ImageDetekcja,theta,rho,peaks);

figure, imshow(ImageDetekcja), hold on
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
