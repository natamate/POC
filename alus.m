clearvars;
close all; 
clc;

Image = (imread('parrot.bmp')); 
%figure(1);
%imshow(Image);

xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(Image);

newYY = floor(YY * yReScale);
newXX = floor(XX * xReScale);

newImage = uint8(zeros(newYY, newXX));

xStep = (XX/newXX);
yStep = (YY/newYY);

pomImage = im2double(Image);

imshow(pomImage);

for ii=2:(newXX)
    for jj=2:(newYY)
        i1 = floor(ii*xStep);
        j1 = floor(jj*yStep);
        
        i1 = max(i1, 0);
        j1 = max(j1, 0);
        i1 = min(i1, XX-2);
        j1 = min(j1, YY-2);
        
        A = [i1,j1];
        B = A + [1, 0];
        C = A + [1, 1];
        D = A + [0, 1];
             
        i = ii - i1; 
        j = jj - j1;    
   
        vA = pomImage(A(1), A(2));
        vB = pomImage(B(1), B(2));
        vC = pomImage(C(1), C(2));
        vD = pomImage(D(1), D(2));
        
        newImage(ii,jj) = [1.0 - i, i] * [vA,vD;vB,vC]*[1.0-j;j];
        %newImage(ii, jj) = ((1.0-i)*(1.0-j)*vA + i*(1.0-j)*vB + (1.0-i)*j*vC + i*j*vD);
    end
end

figure(2);
%imshow(bilinearInterpolation(Image, [270 396]));
imshow((newImage));