clearvars;
close all; 
clc;

Image = double(imread('parrot.bmp'));

figure(1);
imshow(uint8(Image));

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
        i1 = floor(ii*xStep);
        j1 = floor(jj*yStep);
        
         if i1 > XX - 2
            i1 = XX - 2;
        end
        if j1 > YY - 2
            j1 = YY - 2;
        end
        
        A = double(Image(j1+1,i1+1));
        B = double(Image(j1+1,i1+2));
        C = double(Image(j1+2,i1+2));
        D = double(Image(j1+2,i1+1));
        
        i1 = i1/XX;
        j1 = j1/YY;
        
        newImage(jj+1,ii+1) = [1-i1 i1] * [A D; B C] * [1-j1; j1];
    end
end

figure(2);
imshow(uint8(newImage));
