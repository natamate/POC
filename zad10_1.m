clearvars;
close all;
clc;

Image = imread('knee.png');

figure(1);
imshow(Image);

%% wyznacz w sposob reczny pkt startowy:
%[x y] = ginput(1);
x = 262;
y = 264;

Image = double(Image);

%% Tworzymy stos
[sizeX sizeY] = size(Image);

%% Tworzymy dwie macierze o rozmiarze obrazu
visited = zeros(sizeX, sizeY);
segmented = zeros(sizeX, sizeY);

%% to jest stos
stack = zeros(10000,2);

%% wskaznik stosu
iStack = 1;

%% odkladamy na stos pierwszy punkt (startowy ktory wybralismy)
stack(iStack,:) = [x y];
visited(x,y) = 1;
segmented(x,y) = 1;

%% ogarnianie stosu
%% warunkiem stopu jest obecnosc el na stosie

while (iStack > 0)
    % pobranie wspolrzednych piksela ze stosu
    sX = stack(iStack,1);
    sY = stack(iStack,2);
    % wskaznik stosu sie zmniejsza
    iStack = iStack - 1;
    
    % spr czy piksel ma wszystkich sasiadow
    if (sX - 1 > 0) && (sX + 1 <= sizeX) && (sY - 1) > 0 && (sY + 1 <= sizeY)
        
        % petle po otoczeniu piksela
        for i = sX-1:sX+1
           for j = sY-1:sY+1
               % odleglosc pomiedzy pikselem centralnym a kazdym z
               % kontekstu modul z roznicy jasnosci
              dist = abs(Image(sX,sY) - Image(i,j));
              
              % poczatkowa wartosc progu to 4
              % i jesli piksel nie yl wczesniej odwiedzany to 
              if ((dist < 4) && (visited(i,j) == 0))
                  % ozn go jako nalezacego do obiektu (segmented)
                  segmented(i,j) = 1;
                  % odkladamy go na stos 
                  iStack = iStack + 1;
                  stack(iStack,:) = [i j];
              end
              % ozn piksel jako odwiedzony
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

% licznik pikseli uznanych za nalezace do obiektu 
nS = 0;
% srednia
mV = 0;

%% petla 
while (iStack > 0)
    sX = stack(iStack,1);
    sY = stack(iStack,2);
    iStack = iStack - 1;
    nS = nS + 1;
    
    %% aktualizacja sredniej
    mV = (mV*(nS-1)+Image(sX,sY))/nS;
    
    if (sX - 1 > 0) && (sX + 1 <= sizeX) && (sY - 1) > 0 && (sY + 1 <= sizeY)
        
        for i=sX-1:sX+1
           for j=sY-1:sY+1
              %% zamiana piksela centralnego na wyzn wartosc srednia
              dist = abs(mV - Image(i,j));
              %% zwiekszenie progu
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