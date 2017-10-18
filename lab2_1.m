clearvars;
close all; 
clc;

Image = imread('clock.bmp');

figure(1);
imshow(Image);

xReScale = 1.5;
yReScale = 1.5;

%%okr rozdzielczosci
[YY, XX] = size(Image);

newYY = floor(YY * yReScale); % floor or round zaokraglenie

newXX = floor(XX * xReScale);

newImage = uint8(zeros(newYY, newXX));

xStep = XX/newXX;
yStep = YY/newYY;

for ii=0:(newXX-1)
    for jj=0:(newYY-1)
        i = round(ii*xStep);
        if (i > XX-1)
            i = XX -1;
        end
        j = round(jj*yStep);
        if (j > YY-1)
            j = YY -1;
        end
        newImage(jj+1,ii+1) = Image(j+1,i+1);
    end
end

figure(2);
imshow(newImage);
