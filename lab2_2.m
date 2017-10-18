clearvars;
close all; 
clc;

Image = imread('parrot.bmp');

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
        i1 = floor(ii*xStep);
        j1 = floor(jj*yStep);
        A = [j1,i1];
        B = [j1, i1+1];
        C = [j1+1, i1+1];
        D = [j1+1, i1];
        
        i = ii/i1;
        if (i > XX-1)
            i = XX-1;
        end
        
        j = jj/j1;    
        if ( j > YY-1)
            j = YY -1;
        end
        
        vA = Image(A);
        vB = Image(B);
        vC = Image(C);
        vD = Image(D);
        
       % newImage(jj+1,ii+1) = 
    end
end

figure(2);
imshow(newImage);
