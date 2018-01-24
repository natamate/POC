clearvars;
close all;
clc;

Image = imread('umbrealla.png');

figure(1);
imshow(Image);

%% konwersja na HSV
ImageHSV = rgb2hsv(Image);
ImageHSV = double(ImageHSV);

H = ImageHSV(:,:,1);

[Y X] = size(H);

%% zmienne globalne
global minpodzial;
minpodzial = 2;
global progodchylenie;
progodchylenie = 0.05;
global segRes;
segRes = zeros(Y,X);
global index;
index = 1;
global Mres;
Mres = zeros(Y,X);

Split(H,1,Y,1,X);

%figure(2);
%imshow(segRes,[]);

%% laczenie
i=0;
%% konczy sie kiedy przekroczymy liczbe znalezionych wczesniej podobszarow
while i < index
     %% wycinamy maske pikseli o rozpatrywanym indeksie i
   IB = segRes == i;
   
   [Yib Xib] = size(IB);
   % spr czy maska nie jest pusta (ten podobszar zostal dolaczony do
   % innego)
   if sum(IB(:)) == 0
       % jak jest pusta to przechodzimy do kolejnej iteracji
       i = i + 1;
       continue;
   end
   % znajdujemy wsp lewego gornego rogu
   [yF xF] = find(IB,1,'first');
   %% szukamy sasiadow rozpatrywanego obszaru
   % dylatacja maski
   IBDil = imdilate(IB,strel('square',3));
   % odejmujemy maske oryginalna
   IBDiff = imabsdiff(IBDil,IB);
   % mnozymy otrzymana ramke przez segRes (wyciecie)
   IBMult = IBDiff.* segRes;
   
   % wybieramy el niezerowe
   
   IBMult_non_zeros = nonzeros(IBMult);
   
   % wybieramy el unikalne

   IBUnique = unique(IBMult_non_zeros);
   
   %% DLA KAZDEGO SASIADA Z OBSZARU
   joined = 0;
   for k = 1:numel(IBUnique)
       
        IBS = segRes == IBUnique(k);
        
        [yFS, xFS] = find(IBS,1,'first');        
        % SPR modul srednich odcieni barw w 2 podobszarach
        color_difference = abs(Mres(yF,xF) - Mres(yFS, xFS));
        %(zadany przykladowy prog 5/255)
        if color_difference < (5/255)
            %laczenie obszarow (roznica kolorow mniejsza od progu)
            segRes(IBS) = i;
            joined = 1;
        end
   end
   %% spr flage czy cos polaczono
   if joined == 0
       i = i+1;
   end
end

%% filtracja wynikow 

% eliminacja obszaru mniejszego niz zadany

segRes_for = segRes;
MRes_for = Mres;

%% wyznaczamy wektor unikalnych indeksow
segRes_unique = unique(segRes);

for i = 1:numel(segRes_unique)
    %% wycinamy maske dla rozpatrywanego indeksu
    obszar = segRes == segRes_unique(i);
    if sum(obszar) < 33
        % zerowanie obszaru
        segRes(obszar) = 0;
    end
end

% przeindeksowanie indeksow na pierwsze N liczb calkowitych

segRes_unique_2 = unique(segRes);
for i = 1:numel(segRes_unique_2)
    obszar = segRes == segRes_unique_2(i);
    segRes(obszar) = i;
end

% wizualizacja segmentacji
ResultImage = label2rgb(segRes);

figure(3);

subplot(1,2,1);
imshow(Image);

subplot(1,2,2);
imshow(ResultImage,[]);
