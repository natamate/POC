clearvars;
close all;
clc;

Image = imread('knee.png');

figure(1);
imshow(Image);

%[x y] = ginput(1);
x = 262;
y = 264;

Image = double(Image);

%% Tworzymy stos
[sizeX sizeY] = size(Image);

visited = zeros(sizeX, sizeY);
segmented = zeros(sizeX, sizeY);

stack = zeros(10000,2);
iStack = 1;

stack(iStack,:) = [x y];
visited(x,y) = 1;
segmented(x,y) = 1;

%% ogarnianie stosu

while (iStack > 0)
    sx = stack(iStack,1);
    sy = stack(iStack,2);
    iStack = iStack - 1;
    
    if (sx - 1 > 0) && (sx + 1 <= sizeX) && (sy - 1) > 0 && (sy + 1 <= sizeY)
        
        for i=sx-1:sx+1
           for j=sy-1:sy+1
              dist = abs(Image(sx,sy) - Image(i,j));
              if ((dist < 4) && (visited(i,j) == 0))
                  segmented(i,j) = 1;
                  iStack = iStack + 1;
                  stack(iStack,:) = [i j];
              end
              visited(i,j) = 1;
           end
        end
        
    end
end

figure(2);
subplot(1,2,1);
imshow(uint8(segmented),[]);


%% aktualizacja na podstawie średniej

%% wczytanie obrazu

Image = imread('knee.png');
%imshow(Image);
%[x y] = ginput(1);
x = 262;
y = 264;
Image = double(Image);

[sizeX sizeY] = size(Image);

visited = zeros(sizeX, sizeY);
segmented = zeros(sizeX, sizeY);

stack = zeros(10000,2);
iStack = 1;

stack(iStack,:) = [x y];
visited(x,y) = 1;
segmented(x,y) = 1;

nS = 0
mV = 0;

%% petla 
while (iStack > 0)
    sx = stack(iStack,1);
    sy = stack(iStack,2);
    iStack = iStack - 1;
    nS = nS + 1;
    
    mV = (mV*(nS-1)+Image(sx,sy))/nS;
    
    if (sx - 1 > 0) && (sx + 1 <= sizeX) && (sy - 1) > 0 && (sy + 1 <= sizeY)
        
        for i=sx-1:sx+1
           for j=sy-1:sy+1
              dist = abs(mV - Image(i,j));
              if ((dist < 20) && (visited(i,j) == 0))
                  segmented(i,j) = 1;
                  iStack = iStack + 1;
                  stack(iStack,:) = [i j];
              end
              visited(i,j) = 1;
           end
        end
        
    end
end

subplot(1,2,2);
imshow(uint8(segmented), []);
title('ze srednia');