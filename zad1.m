clearvars;
close all;
clc;

Image = imread('ccl1.png');
figure(1);
imshow(Image);

[YY XX] = size(Image);

ImageTmp = Image;

N = 100;
%% inicjowanie etykiety
L = 1;

%% tablica do wyznaczania luta
id = 1:N;

for y = 2:YY
    for x = 2:(XX - 1)
       %% DZIALANIA TYLKO gdy piksel rozny od zera
        if (ImageTmp(y,x) > 0)
          LA = ImageTmp(y-1,x-1);
          LB = ImageTmp(y-1,x);
          LC = ImageTmp(y-1,x+1);
          LD = ImageTmp(y,x-1);
          
          %% wektor otoczenia piksela
          neighbours = [LA LB LC LD];
          sumNeighbours = sum(neighbours);
          nozeroNeighbours = nonzeros(neighbours);
          minNeighbours = min(nozeroNeighbours); 
          maxNeighbours = max(nozeroNeighbours);
          
          %% przypadek a
           if sumNeighbours == 0
               ImageTmp(y,x) = L;
               L = L + 1;
           %% przypadek b    
           elseif minNeighbours == maxNeighbours
               ImageTmp(y,x) = minNeighbours;
           %%  przypadek c    
           elseif minNeighbours ~= maxNeighbours
               %NeighboursWithoutMin = nozeroNeighbours(nozeroNeighbours~=minNeighbours);
               %secondMinNeighbours = min(NeighboursWithoutMin);
               %% przyjmujemy taka konwencje
               ImageTmp(y,x) = minNeighbours;
               %% jesli jestesmy w przypadku c to wystapil konflikt wiec tworzymy unie pomie
               %% dzy etykieeta mniejsza i wieksza
               %id = union(id,minNeighbours,secondMinNeighbours);
               id = union(id,minNeighbours, maxNeighbours);
           end
       end
   end
end

%% wyswietl rezultat indeksacji
figure(2);
imshow(ImageTmp, []);

%% tworzymy tablice lut
lut = zeros(N);

for i = 1:N
    lut(i) = root(id,i);
end

%% dla kazdego piksela ktory nie jest tlem realizujemy lut
for y = 2:YY
   for x = 2:(XX-1)
      if (ImageTmp(y,x) > 0)
        ImageTmp(y,x) = lut(ImageTmp(y,x));
      end
   end
end

%% po operacji LUT
figure(3);
imshow(label2rgb(ImageTmp),[]);


